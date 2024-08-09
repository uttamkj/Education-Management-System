import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ContactFormServlet")
public class ContactFormServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("emailAddress");
        String message = request.getParameter("message");

        
        String jdbcURL = "jdbc:mysql://localhost:3301/education_system";
        String dbUser = "root";
        String dbPassword = "";

        try {
           
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

           
            String sql = "INSERT INTO contact_form (name, email, message) VALUES (?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, message);

          
            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                response.getWriter().println("Form submission successful!");
            } else {
                response.getWriter().println("Error submitting form.");
            }

            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Database error.");
        }
    }
}
