package web;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/carServlet")
public class carServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String carId = request.getParameter("carid");
        String carName = request.getParameter("carname");
        String category = request.getParameter("category");
        String seat = request.getParameter("seat");

        
        try {
            // Load the JDBC driver
            Class.forName("oracle.jdbc.OracleDriver");
            // Establish a connection
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","Harshit","123");

            // Create a SQL statement
            String sql = "INSERT INTO car (carid, carname, category, seat) VALUES (?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(sql);

            // Set the parameters for the statement
            statement.setString(1, carId);
            statement.setString(2, carName);
            statement.setString(3, category);
            statement.setString(4, seat);

            // Execute the statement
            statement.executeUpdate();

            // Close the resources
            statement.close();
            connection.close();

            // Redirect to a success page
            response.sendRedirect("success.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            // Redirect to an error page
            response.sendRedirect("error.jsp");
        }
    }
}
