package web;
import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/logoutServlet")
public class logoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        // Set a session attribute to indicate that the user has logged out
        session.setAttribute("loggedOut", true);

        // Invalidate the session after setting the attribute
        session.invalidate();

        response.sendRedirect("home.jsp");
    }
}
