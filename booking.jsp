<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dao.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Car Booking</title>
    <link href="css/booking.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <h1>Car Booking</h1>
    <form action="bookingServlet" method="post">
        <label for="pickupLocation">Pickup Location:</label>
        <input type="text" id="pickupLocation" name="pickupLocation" required><br>
        
        <label for="dropLocation">Drop-off Location:</label>
        <input type="text" id="dropLocation" name="dropLocation" required><br>
        
        <label for="startDate">Start Date:</label>
        <input type="date" id="startDate" name="startDate" required><br>
        
        <label for="endDate">End Date:</label>
        <input type="date" id="endDate" name="endDate" required><br>
        
        <label for="bookingDate">Booking Date:</label>
        <input type="date" id="bookingDate" name="bookingDate" required><br>
        
        <label for="carName">Select a Car:</label>
        <select id="carName" name="carName" required>
            <option value="">-- Choose a car --</option>
            <% 
                // Fetch car names from the database and populate the dropdown
                try {
                    // Import necessary classes and establish a database connection here
                    Connection connection = DBUtil.getConnection(); // Implement your connection manager

                    // Execute a query to fetch car names from the database
                    String query = "SELECT carname FROM car";
                    Statement statement = connection.createStatement();
                    ResultSet resultSet = statement.executeQuery(query);

                    while (resultSet.next()) {
                        String carName = resultSet.getString("carname");
            %>
            <option value="<%= carName %>"><%= carName %></option>
            <%
                    }
                    // Close the result set, statement, and connection here
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </select><br>
        <!-- Display total amount here -->
        <p>Total Amount: Rs<span id="totalAmount">0.00</span></p>
        
        <button type="button" onclick="calculateAmount()">Calculate Amount</button>
        <button type="submit">Book</button>
        
        <p><b>Note:</b> Oil will be given by you!</p>
    </form>
    
    <script>
        function calculateAmount() {
            const startDate = new Date(document.getElementById("startDate").value);
            const endDate = new Date(document.getElementById("endDate").value);

            // Calculate total amount based on the number of days
            const days = Math.ceil((endDate - startDate) / (24 * 60 * 60 * 1000));
            const ratePerDay = 1500.0;
            const totalAmount = days * ratePerDay;

            // Display the calculated amount
            document.getElementById("totalAmount").textContent = totalAmount.toFixed(2);
        }
    </script>
    <%@include file="footer.jsp" %>
</body>
</html>
