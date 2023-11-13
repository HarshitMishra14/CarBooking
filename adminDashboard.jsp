<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="css/admindashboard.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <%@include file="header.jsp" %>
    <h1>Welcome Admin!</h1>

    <h2>Customer Details</h2>
    <%
        // Database connection and query for customer details
        Connection conCustomers = null;
        Statement statementCustomers = null;
        ResultSet resultSetCustomers = null;

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            conCustomers = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Harshit", "123");

            // Query to fetch customer details
            String queryCustomers = "SELECT * FROM customers";
            statementCustomers = conCustomers.createStatement();
            resultSetCustomers = statementCustomers.executeQuery(queryCustomers);

            // Display customer details
            while (resultSetCustomers.next()) {
                // Retrieve customer details from the result set
                String customerId = resultSetCustomers.getString("cid");
                String customerName = resultSetCustomers.getString("cname");
                String email = resultSetCustomers.getString("cemail");
                String phone = resultSetCustomers.getString("phone");
                String username = resultSetCustomers.getString("cusername");
                String password = resultSetCustomers.getString("cpassword");
                // Display the customer details
                out.println("<p>Customer ID: " + customerId + "</p>");
                out.println("<p>Name: " + customerName + "</p>");
                out.println("<p>Email: " + email + "</p>");
                out.println("<p>Phone: " + phone + "</p>");
                out.println("<p>Username: " + username + "</p>");
                out.println("<p>Password: " + password + "</p>");
                out.println("<hr>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error retrieving customer details. Please try again.</p>");
        } finally {
            // Close the database resources
            try {
                if (resultSetCustomers != null) resultSetCustomers.close();
                if (statementCustomers != null) statementCustomers.close();
                if (conCustomers != null) conCustomers.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>

    <h2>Add a New Car</h2>
    <p><a href="car.jsp">Add Car</a></p>
    <h2>View Bookings</h2>
    <% 
        // Database connection and query for bookings
        Connection conBookings = null;
        Statement statementBookings = null;
        ResultSet resultSetBookings = null;

        try {
            Class.forName("oracle.jdbc.OracleDriver");
            conBookings = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "Harshit", "123");

            // Query to fetch all bookings
            String queryBookings = "SELECT * FROM booking";
            statementBookings = conBookings.createStatement();
            resultSetBookings = statementBookings.executeQuery(queryBookings);

            // Display bookings
            while (resultSetBookings.next()) {
                // Retrieve booking details from the result set
                String bookingId = resultSetBookings.getString("bid");
                String pickupLocation = resultSetBookings.getString("pickup");
                String dropLocation = resultSetBookings.getString("dropout");
                String startDate = resultSetBookings.getString("startdate");
                String endDate = resultSetBookings.getString("enddate");
                String bookingDate = resultSetBookings.getString("bdate");
                double totalAmount = resultSetBookings.getDouble("amount");
                String carName = resultSetBookings.getString("carname");
                
                // Display the booking details
                out.println("<p>Booking ID: " + bookingId + "</p>");
                out.println("<p>Pickup Location: " + pickupLocation + "</p>");
                out.println("<p>Drop Location: " + dropLocation + "</p>");
                out.println("<p>Start Date: " + startDate + "</p>");
                out.println("<p>End Date: " + endDate + "</p>");
                out.println("<p>Booking Date: " + bookingDate + "</p>");
                out.println("<p>Total Amount: Rs" + totalAmount + "</p>");
                out.println("<p>Car Name:"+carName+"</p>");
                out.println("<hr>");
            }
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error retrieving bookings. Please try again.</p>");
        } finally {
            // Close the database resources
            try {
                if (resultSetBookings != null) resultSetBookings.close();
                if (statementBookings != null) statementBookings.close();
                if (conBookings != null) conBookings.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>

    
    <a href="logoutServlet">Logout</a>

    <!-- Include your page content here -->

    <%@include file="footer.jsp" %>
</body>
</html>
