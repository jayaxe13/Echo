<%-- 
    Document   : login
    Created on : Jul 5, 2015, 5:42:37 PM
    Author     : User
--%>
<%@page import="entity.User"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="images/icon/echo.ico" type="image/x-icon">

        <title>Echo</title>

        <style>
            body { 
                background: url("images/home/bg.jpg") no-repeat center center fixed; 
                background-color: #cccccc;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
        </style>
    </head>
    <body>
        <!--Standard Includes-->
        <%@include file="include/header-nav.jsp" %>
        <%@include file="include/bootstrap.jsp" %>
        <%@include file="include/home-validation.jsp" %>

        <!--Includes END-->

        <%            
            //userdao can be used here because it's declared in include/home-validation already
            firstname = "Something";
        %>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <br><br><br><br><br><br><br><br><br><br><br><br>
                    <center><img src="images/home/logo.png" alt="logo image"></center>
                </div>
            </div>
        </div>
    </body>
</html>