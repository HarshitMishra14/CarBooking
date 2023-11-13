<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign Up</title>
        <link href="css/register.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <h1>User Registration</h1>
        <form action="registerServlet" method="post">
            <label for="cid">C_ID</label>
            <input type="text" id="cid" name="cid" required><br/>
            <label for="name">Name</label>
            <input type="text" id="name" name="name" required><br/>
            <label for="email">Email</label>
            <input type="text" id="email" name="email" required><br/>
            <label for="phone">Phone</label>
            <input type="text" id="phone" name="phone" required><br/>
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required><br/>
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required><br/>
            <center><button type="submit">Register</button></center>
        </form><br/>
        <p>Already have an account?<a href="login.jsp">Login Here..</a></p><br/>
        <%@include file="footer.jsp" %>
    </body>
</html>
