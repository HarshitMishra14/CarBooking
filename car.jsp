<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Car</title>
    <link href="css/carcss.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <h2>Add a New Car</h2>
    <form action="carServlet" method="post">
        Car ID: <input type="text" name="carid"><br>
        Car Name: <input type="text" name="carname"><br>
        Category: <input type="text" name="category"><br>
        Number of Seats: <input type="text" name="seat"><br>
        <input type="submit" value="Add Car">
    </form>
</body>
</html>
