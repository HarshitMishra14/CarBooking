<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link href="css/dashboard.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <%@include file="header.jsp" %>
    <center>
    <h1>Welcome to User Dashboard</h1>
    <div>
        <h2>Options:</h2>
        <br/>
        <ul>
            <li><a href="booking.jsp">Book a Car</a></li>
            <li><a href="logoutServlet">Logout</a></li>
        </ul>
    </div>
    </center>
    <%@include file="footer.jsp" %>
</body>
</html>
