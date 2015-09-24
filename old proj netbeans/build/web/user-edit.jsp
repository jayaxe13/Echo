<%-- 
    Document   : user-edit
    Created on : Aug 11, 2015, 10:27:36 AM
    Author     : Qianpin
--%>

<%@page import="java.sql.Blob"%>
<%@page import="entity.User"%>
<%@page import="dao.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="images/icon/echo.ico" type="image/x-icon">

        <title>User Edit</title>

        <script type="text/javascript">

        </script>
    </head>
    <body>
        <!--Standard Includes-->
        <%@include file="include/header-nav.jsp" %>
        <%@include file="include/bootstrap.jsp" %>
        <%@include file="include/validation.jsp" %>

        <%            //if user had clicked edit profile
            if (session.getAttribute("editMsg") != null) {
        %>
        <script>
            alert("<%=session.getAttribute("editMsg")%>");
        </script>
        <%
                session.removeAttribute("editMsg");
            }
        %>

        <%            int id = (Integer) session.getAttribute("userid");
            UserDAO dao = new UserDAO();
            User user = dao.getUser(id);
            String firstname = user.getFirstname();
            String lastname = user.getLastname();
            String email = user.getEmail();
            String password = user.getPassword();
            int postal = user.getPostal(); 
            byte[] imageByte = user.getImage().getBytes(1, (int) user.getImage().length());
            String image_string = javax.xml.bind.DatatypeConverter.printBase64Binary(imageByte);
        %>

        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2 col-xs-4">
                    <!-- Sidebar -->
                    
                    <!--If no profile picture was chosen-->
                    <%
                        if (user.getImage() == null) {
                    %>
                    <img src="images/default.png" alt="profile picture" class="img-thumbnail">
                    <%
                        }else {
                            %>
                      <img src="data:image/jpg;base64, <%=image_string%>" alt="profile picture" class="img-thumbnail">      
                            <%
                        }
                    %>
                    <form action="uploadPP" enctype="multipart/form-data" method="post">
                        <input type="file" name="profilePicture">No bigger than 16MB<br>
                        <input type="hidden" name="userid" value="<%=session.getAttribute("userid")%>">
                        <input type="submit">
                    </form>
                </div>
                <div class="col-md-8 col-xs-8">
                    <h1>User Edit</h1>

                    <div class="row">
                        <div class="col-md-2">
                            <br><span>First Name:&nbsp;</span>
                            <br><span>Last Name:&nbsp;</span>
                            <br><span>Email:&nbsp;</span>
                            <br><span>Password:&nbsp;</span>
                            <br><span>Postal:&nbsp;</span>
                        </div>

                        <div class="col-md-4">
                            <form action="user-edit" accept-charset="UTF-8">
                                <input type="text" name="first_name" value="<%=firstname%>"/><br>
                                <input type="text" name="last_name" value="<%=lastname%>"/><br>
                                <input type="text" name="email" value="<%=email%>"/><br> 
                                <input type="text" name="password" value="<%=password%>"/><br> 
                                <input type="text" name="postal" value="<%=postal%>" maxlength="6"/><br><br>
                                <input type="hidden" name="id" value ="<%=id%>"/>
                                <input class="btn btn-primary" style="clear: left; width: 100%; height: 32px; font-size: 13px;" type="submit"/>
                            </form>
                        </div>
                    </div>

                    <button id="btnA" onclick="window.location.href = 'user-profile.jsp'">Back</button>
                </div>
            </div>
        </div>
    </body>
</html>
