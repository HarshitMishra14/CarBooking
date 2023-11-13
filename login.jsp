<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <link href="css/login.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <h1>User Login</h1>
        <form action="loginServlet" method="post">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required><br/>
            <label for="password">Password</label>
            <input type="password" id="password" name="password" required><br/>
            <center><button type="submit">Login</button></center>
        </form><br/>
        <p>Don't have an account?<a href="register.jsp">Register Here..</a></p><br/>
        <%@include file="footer.jsp" %>
    </body>
</html>
