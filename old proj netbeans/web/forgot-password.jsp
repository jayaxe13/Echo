<%-- 
    Document   : forgot-password
    Created on : Jul 19, 2015, 2:32:37 PM
    Author     : Toshiba PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/icon/echo.ico" type="image/x-icon">
        <title>Forgot Password</title>
        
        <!--Bootstrap-->
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        
    </head>
    <body>
        <%@include file="include/header-nav.jsp" %>
        <br><br>
    <center>
        <form name="login_form" action ="forgot-password" method="post">
            
            <input type ="text" name ="emailid" placeholder="Email">
            <input type="submit" value="Submit" />
        </form> 
        <br><br>
        <button id="btnBack" onclick="window.location.href='home.jsp'">Back to Home Page</button> 
    </center>
        <%
            String msg = (String)request.getAttribute("pwmsg");
            if(msg!=null){
                %>
                <script>
                    alert("<%=msg%>")
                </script>
                <%
            }
            %>
    </body>
</html>
