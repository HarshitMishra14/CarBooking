<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>
        <link href="css/contact.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <h1>Contact Us</h1>
        <p align="center">Have a question or need assistance? Get in touch with us.</p>
        <section class="contact-form">
            <div class="form-container">
                <h2>Send us a Message</h2><br/>
                <form action="MessageServlet" method="post">
                    <label for="name">Your Name</label>
                    <input type="text" id="name" name="name"><br/>
                    <label for="email">Your Email</label>
                    <input type="text" id="email" name="email"><br/>
                    <label for="message">Message</label>
                    <input type="text" id="message" name="message"><br/>
                    <button type="submit">Submit</button>
                </form>
            </div>
            <div class="contact-info">
                <h2>Contact Information</h2><br/>
                <ul>
                    <li>
                        <span>Contact Person:</span>
                        <p>Harshit Mishra</p>
                    </li>
                    <li>
                        <span>Address:</span>
                        <p>Near SBI ATM, Makandpur Chowk, Naugachia <br/>
                        Bhagalpur, Bihar
                        </p>
                    </li>
                    <li>
                        <span>Email:</span>
                        <p>harshitmishra1406@gmail.com</p>
                    </li>
                    <li>
                        <span>Phone:</span>
                        <p>+91 8582030298</p>
                    </li>
                </ul>
            </div>
        </section>
        <%@include file="footer.jsp" %>
    </body>
</html>
