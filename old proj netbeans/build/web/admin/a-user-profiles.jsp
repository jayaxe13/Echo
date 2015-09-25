
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

                //Hook for Back button
                $('#btnProfilePage').click(function () {
                    //sending ajax request to servlet
                    $('#mainContent').load("user-profile.jsp");
                });

                //Hook for Edit User button
                $('.btnEdit').click(function () {
                    //sending ajax request to servlet
                    var userid = $(this); //value of the button
                    $.ajax({
                        success: function (response) {
                            $('#mainContent').load("admin/a-user-edit.jsp?userID=" + userid.val());
                            event.preventDefault();
                        },
                        error: function (response) {
                            alert('error');
                            console.log(response);
                        }
                    });
                });
            });

        </script>
    </head>
    <body>
        <%
            UserDAO userdao = new UserDAO();
            int userid = (Integer) session.getAttribute("userid");
            User u = null;
            String image = "";
            //admin validation
            User admin = userdao.getUser(userid);
            if (!admin.isAdmin()) {
                response.sendRedirect("user-profile.jsp");
            }
            else{
                u = userdao.getUser(userid);
                image = u.getImage();
            }
                    //admin validation ENDS
%>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2 col-xs-4">
                    <!-- Sidebar -->
                    <img src="images/user/<%=image%>" alt="profile picture" class="img-thumbnail">
                </div>
                <div class="col-md-8 col-xs-8">
                    <h1>ADMIN PAGE</h1>
                    <div class="row">
                        <div class="col-md-1">
                        </div>
                        <div class="col-md-2">
                            Name
                        </div>
                        <div class="col-md-4">
                            Email
                        </div>
                        <div class="col-md-1">
                            Password
                        </div>
                        <div class="col-md-1">
                            Postal
                        </div>
                    </div>
                    <%

                        ArrayList<User> userList = userdao.getUsers();

                        for (User user : userList) {
                            if (!user.isAdmin()) {
                                int userID = user.getUserId();
                                String firstname = user.getFirstname();
                                String lastname = user.getLastname();
                                String email = user.getEmail();
                                String password = user.getPassword();
                                int postal = user.getPostal();

                    %>   
                    <div class="row">
                        <div class="col-md-1">
                            <button class="btnEdit" value="<%=userID%>">Edit</button>
                        </div>
                        <div class="col-md-2">
                            <%=firstname%> <%=lastname%>
                        </div>
                        <div class="col-md-4">
                            <%=email%>
                        </div>
                        <div class="col-md-1">
                            <%=password%>
                        </div>
                        <div class="col-md-1">
                            <%=postal%>
                        </div> 
                    </div><br>                   
                    <%
                            }
                        }
                    %>
                    <br><button id="btnProfilePage">Back</button>
                </div>            
            </div>
        </div>
    </body>
</html>
