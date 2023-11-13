<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Car Booking</title>
        <link href="css/home.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <br/>
        <center><div class="home-banner">
            <h1>Welcome to Car Booking</h1>
            <p>Book your next journey with us and explore our wide range of cars.</p>
        </div></center>
        <br/>
        <center><h2>Our Services</h2></center>
        <div class="services-section">
            <div class="service">
                <h3>Wide Car Selection</h3>
                <p>Choose from a diverse range of cars to suit your travel needs.</p>
            </div>
            <div class="service">
                <h3>Easy Booking Process</h3>
                <p>Our user-friendly booking process ensures a hassle-free experience.</p>
            </div>
            <div class="service">
                <h3>24/7 Customer Support</h3>
                <p>Our Customer Support Team is available around the clock to assist you.</p>
            </div>
        </div>
        <center><h2>Available Cars:-</h2></center>
        <div class="services-section">
            <div class="service">
                <img src="images/alto.jpg" alt="" style="width: 80px; height: 80px"/>
                <h3>Alto</h3>
            </div>
            <div class="service">
                <img src="images/baleno.jpg" alt=""  style="width: 80px; height: 80px"/>
                <h3>Baleno</h3>
            </div>
            <div class="service">
                <img src="images/bolero.jpg" alt="" style="width: 80px; height: 80px"/>
                <h3>Bolero</h3>
            </div>
            <div class="service">
                <img src="images/celerio.jpg" alt="" style="width: 80px; height: 80px"/>
                <h3>Celerio</h3>
            </div>
            <div class="service">
                <img src="images/ertiga.jpg" alt="" style="width: 80px; height: 80px"/>
                <h3>Ertiga</h3>
            </div>
            <div class="service">
                <img src="images/harrier.jpg" alt="" style="width: 80px; height: 80px"/>
                <h3>Harrier</h3>
            </div>
        </div>
        <%@include file="footer.jsp" %>
    </body>
</html>
