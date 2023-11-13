package web;

import dao.BookingDAO;
import dao.DBUtil;
import entities.Booking;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/bookingServlet")
public class bookingServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        try {
            // Retrieve user input from the booking form
            String pickupLocation = request.getParameter("pickupLocation");
            String dropLocation = request.getParameter("dropLocation");
            String startDateStr = request.getParameter("startDate");
            String endDateStr = request.getParameter("endDate");
            String bookingDateStr = request.getParameter("bookingDate");
            String carName = request.getParameter("carName"); // Retrieve car name from the form

            // Convert date strings to Date objects
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date startDate = dateFormat.parse(startDateStr);
            Date endDate = dateFormat.parse(endDateStr);
            Date bookingDate = dateFormat.parse(bookingDateStr);

            // Calculate total amount
            long days = (endDate.getTime() - startDate.getTime()) / (24 * 60 * 60 * 1000);
            BigDecimal ratePerDay = new BigDecimal("1500.00");
            BigDecimal totalAmount = ratePerDay.multiply(new BigDecimal(days));

            // Create a Booking object
            String generatedBid = "BID" + String.format("%03d", new Random().nextInt(1000));
            Booking booking = new Booking(generatedBid, pickupLocation, dropLocation, startDate, endDate, bookingDate, totalAmount.doubleValue(), carName);

            // Create a BookingDAO instance and add the booking to the database
            try (BookingDAO bookingDAO = new BookingDAO()) {
                if (bookingDAO.addBooking(booking)) {
                    // Data successfully inserted into the database
                    response.sendRedirect(request.getContextPath() + "/success.jsp");
                } else {
                    // No data inserted
                    response.sendRedirect(request.getContextPath() + "/error.jsp");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendRedirect(request.getContextPath() + "/error.jsp");
            }
        } catch (ParseException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/error.jsp");
        }
    }
}
