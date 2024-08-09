

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * Servlet implementation class chk_user
 */
@WebServlet("/chk_user")
public class chk_user extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	    private static final String DB_URL = "jdbc:mysql://localhost:3301/education_system";
	    private static final String DB_USER = "root";
	    private static final String DB_PASSWORD = "";
	    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public chk_user() {
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
		processRequest(request, response);
	}
	  private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        
	        //method 1
	        ArrayList<String> userInfo = authenticateUser(email, password);
	        if (userInfo.isEmpty()) {
	            request.setAttribute("res", "invalid !!!!");
	            request.getRequestDispatcher("login.jsp").forward(request, response);
	        } else {
	            HttpSession session = request.getSession();
	            session.setAttribute("name", userInfo.get(0));
	            session.setAttribute("email", userInfo.get(1));
	            String role = userInfo.get(4);
	            String status = userInfo.get(5);
	            if ("1".equals(status)) {
	                redirectToRoleBasedPage(response, role); // method 2 
	            } else {
	                request.setAttribute("res", "please contact admin");
	                request.getRequestDispatcher("login.jsp").forward(request, response);
	            }
	        }
	    }

	    private void redirectToRoleBasedPage(HttpServletResponse response, String role) throws IOException {
	        switch (role.toLowerCase()) {
	            case "admin":
	                response.sendRedirect("admin.jsp");
	                break;
	            case "student":
	                response.sendRedirect("student.jsp");
	                break;
	            case "faculty":
	                response.sendRedirect("faculty.jsp");
	                break;
	            default:
	                response.sendRedirect("login.jsp");
	                break;
	        }
	    }

	    private ArrayList<String> authenticateUser(String email, String password) {
	        ArrayList<String> userInfo = new ArrayList<>();
	        
	        try {
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            Connection con = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
	            String sql = "SELECT * FROM user_master WHERE email=? AND password=?";
	            PreparedStatement stmt = con.prepareStatement(sql);
	            stmt.setString(1, email);
	            stmt.setString(2, password);
	            ResultSet rs = stmt.executeQuery();
	            if (rs.next()) {
	                for (int i = 1; i <= 6; i++) {
	                    userInfo.add(rs.getString(i));
	                }
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return userInfo;
	    }
	}

