package web;
import java.io.IOException;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/MessageServlet")
public class MessageServlet extends HttpServlet{

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException{
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");
        try{
            Class.forName("oracle.jdbc.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","Harshit","123");
            String qry = "INSERT INTO contact(name,email,message)VALUES(?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(qry);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, message);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            response.sendRedirect("thankyou.jsp");
        }catch(Exception e)
        {
            e.printStackTrace();
        }
    }
}