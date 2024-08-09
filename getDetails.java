

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/getDetails")
public class getDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		PrintWriter out = response.getWriter();
		String emp_id = request.getParameter("emp_id");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3301/education_system","root","");
			Statement stmt = con.createStatement();
			
			String qry = "select leave_id,leave_name from leave_master where leave_id in(select leave_id from leave_emp_assign where emp_id='"+emp_id+"')";
			ResultSet rs = stmt.executeQuery(qry);
			JSONArray jarr =  new JSONArray();
			ResultSetMetaData  rsmd = rs.getMetaData();
			while(rs.next()) {
				int col = rsmd.getColumnCount();
				JSONObject obj = new JSONObject();
				for(int i=1;i<=col;i++) {
					String colname = rsmd.getColumnName(i);
					obj.put(colname, rs.getObject(i));
				}
				jarr.put(obj);
			}
			out.print(jarr);
		}catch(Exception e) {
			out.print(e);
		}
	}

}
