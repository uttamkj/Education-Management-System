import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

@WebServlet("/showLeave")
public class showLeave extends HttpServlet {
	private static final long serialVersionUID = 1L;
   

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	        try {
	            Class.forName("com.mysql.jdbc.Driver");
	            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3301/education_system", "root", "");

	            String emp_id = request.getParameter("emp_id");
	            String leave_id = request.getParameter("leave_id");
	            String assignLeave = request.getParameter("num_of_leave");
	            String totalLeave = request.getParameter("onum_of_leave");

	            int LeaveRemaining = Integer.parseInt(totalLeave) - Integer.parseInt(assignLeave);
	            
	           
	            Statement stmt = conn.createStatement();
	            
	          

	                    String insertQuery = "INSERT INTO leave_apply (emp_id, leave_id, num_of_leave) VALUES ('" + emp_id + "', '" + leave_id + "', '" + assignLeave + "')";
	                    stmt.executeUpdate(insertQuery);
	                    
               
	                    String updateQuery = "UPDATE leave_emp_assign SET no_of_leave = '" + LeaveRemaining + "' WHERE emp_id = '" + emp_id + "' AND leave_id = '" +  leave_id + "'";
	                    stmt.executeUpdate(updateQuery);

	                    response.sendRedirect("leaveForm.jsp?&msg=Leave application submitted successfully");
	             
	                    
	        } catch (Exception e) {
	            e.printStackTrace();
	        } 

	}

}