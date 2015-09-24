<%-- 
    Document   : sign-up
    Created on : Jul 19, 2015, 4:33:19 PM
    Author     : Toshiba PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/icon/echo.ico" type="image/x-icon">
        <title>Join us today!</title>
        
         <!--Bootstrap-->
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        
        <script>
            //Hook for Back button
                $('#btnBack').click(function () {
                    //sending ajax request to servlet
                    $('#mainContent').load("home.jsp");
                });
            </script>
    </head>
    <body>
        <!--Standard Includes-->
        <%@include file="include/header-nav.jsp" %>
        
        
    <center>
        Didn't do a drop down from header nav cause sign up page can do marketing etc
        <br><br>
        <br><br><br>
        <form action="sign-up" method="post">
            <input type="text" name="firstname" placeholder="firstname" required><br>
            <input type="text" name="lastname" placeholder="lastname" required><br>
            <input type="email" name="email" placeholder="email" required><br>
            <input type="text" maxlength="6" name="postal" placeholder="postal"><br>
            <input type="password" name="password" placeholder="password" required><br>
            <input type ="submit" name ="submit" value ="Submit" />
        </form>
        <button id="btnBack" onclick="window.location.href='home.jsp'">Back to Home Page</button> 
    </center>

    <div id="status">
    </div>
</body>
</html>
