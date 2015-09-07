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

        <script type="text/javascript">

        </script> 

        <style>
            body { 
                background: url("images/home/bg.jpg") no-repeat center center fixed; 
                background-color: #cccccc;
                -webkit-background-size: cover;
                -moz-background-size: cover;
                -o-background-size: cover;
                background-size: cover;
            }
            body {
                

            }
        </style>
    </head>
    <body>
        <!--Standard Includes-->
        <%@include file="include/header-nav.jsp" %>
        <%@include file="include/bootstrap.jsp" %>
        
        <!--Includes END-->
        <%            UserDAO userdao = new UserDAO();
            String firstname = "";
            //validates if user exists already
            if (session.getAttribute("userid") != null) {
                int userid = (Integer) session.getAttribute("userid");
                firstname = (userdao.getUser((Integer) session.getAttribute("userid"))).getFirstname();
        %>
        <input type="hidden" id="userid" value="<%=userid%>">
        <%
            //if user had clicked login
            if (session.getAttribute("returnMsg") != null) {
        %>
        <script>
            alert("<%=session.getAttribute("returnMsg") + firstname%>");
        </script>
        <%
                    session.removeAttribute("returnMsg");
                }
            }
            //if user clicked logout
            if (session.getAttribute("logoutMsg") != null) {
        %>
        <script>
            alert("<%=session.getAttribute("logoutMsg")%>");
        </script>
        <%
                session.removeAttribute("logoutMsg");
            }
            //if user had clicked forgot password
            if (session.getAttribute("pwmsg") != null) {
        %>
        <script>
            alert("<%=session.getAttribute("pwmsg")%>");
        </script>
        <%
                session.removeAttribute("pwmsg");
            }
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