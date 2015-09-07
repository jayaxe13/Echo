<%-- 
    Document   : admin-userEdit
    Created on : Aug 8, 2015, 4:10:04 PM
    Author     : Daniel
--%>

<%@page import="entity.Review"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.*"%>
<%@page import="entity.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <!--Bootstrap-->
        <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

        <title>ADMIN PAGE</title>

        <script type="text/javascript">
            //javascript code to do an AJAX call to logout handler.
            $('document').ready(function () {
                //Hook for Edit button
                $('#btnEditComplete').click(function () {
                    $.ajax({
                        url: "admin-edit",
                        success: function (response) {
                            alert(response);
                            $('#mainContent').load("admin/a-user-profiles.jsp");
                            event.preventDefault();
                        },
                        error: function (response) {
                            alert('error');
                            console.log(response);
                        },
                        data: {
                            'id': $('#id').val(),
                            'first_name': $('#first_name').val(),
                            'last_name': $('#last_name').val(),
                            'email': $('#email_').val(),
                            'password': $('#password_').val(),
                            'postal': $('#postal').val()
                        }
                    });
                });
                //Hook for Back button
                $('#btnProfilePage').click(function () {
                    //sending ajax request to servlet
                    $('#mainContent').load("admin/a-user-profiles.jsp");
                });
            });

        </script>
    </head>
    <body>
        <%
                        int id = Integer.parseInt(request.getParameter("userID"));
                        UserDAO userdao = new UserDAO();
                        //admin validation
                        int userid = (Integer) session.getAttribute("userid");
                        User admin = userdao.getUser(userid);
                        if (!admin.isAdmin()) {
                            response.sendRedirect("user-profile.jsp");
                        }
                        //admin validation ENDS
                        User user = userdao.getUser(id);
                        String firstname = user.getFirstname();
                        String lastname = user.getLastname();
                        String email = user.getEmail();
                        String password = user.getPassword();
                        int postal = user.getPostal();
                    %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2 col-xs-4">
                    <!-- Sidebar -->
                    <img src="images/user/<%=user.getImage()%>" alt="profile picture" class="img-thumbnail">
                </div>
                <div class="col-md-8 col-xs-8">
                    <h1>Admin User Edit</h1>
                    
                    <div class="row">
                        <div class="col-md-2">
                            <br>First Name:
                            <br>Last Name:
                            <br>Email: 
                            <br>Password:
                            <br>Postal:
                        </div>
                        <div class="col-md-2">
                            <input type="text" id="first_name" value="<%=firstname%>"><br>
                            <input type="text" id="last_name" value="<%=lastname%>"></br> 
                            <input type="text" id="email_" value="<%=email%>"></br> 
                            <input type="text" id="password_" value="<%=password%>"></br> 
                            <input type="text" id="postal" value="<%=postal%>" maxlength="6"></br><br>
                        </div>
                    </div>
                    <input type="hidden" id="id" value ="<%=id%>"/>

                    <button id="btnEditComplete">Edit</button>
                    <button id="btnProfilePage">Back</button>
                </div>
            </div>
        </div>
    </body>
</html>
