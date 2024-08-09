

import java.io.*;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class update_password
 */
@WebServlet("/update_password")
public class update_password extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public update_password() {
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
		String password = request.getParameter("password");
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email"); // Assuming email is stored in session

        if (email != null && password != null) {
            try {
                // Load MySQL JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish connection
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3301/education_system", "root", "");

                // Prepare SQL statement
                String sql = "UPDATE user_master SET password = ? WHERE email = ?";
                PreparedStatement stmt = conn.prepareStatement(sql);
                stmt.setString(1, password); // Assuming password is stored in plain text. You should hash it in a real application.
                stmt.setString(2, email);

                // Execute update
                int rowsUpdated = stmt.executeUpdate();
                if (rowsUpdated > 0) {
                    response.sendRedirect("success.jsp"); // Redirect to a success page
                } else {
                    request.setAttribute("errorMsg", "Error updating password.");
                    request.getRequestDispatcher("password_change.jsp").forward(request, response);
                }

                // Close resources
                stmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("errorMsg", "Error updating password.");
                request.getRequestDispatcher("password_change.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMsg", "Invalid session or missing password.");
            request.getRequestDispatcher("password_change.jsp").forward(request, response);
        }
	}

}
