<%-- 
    Document   : user-profile
    Created on : Jul 5, 2015, 3:28:49 PM
    Author     : Qianpin
--%>

<%@page import="entity.Childcare"%>
<%@page import="dao.ChildcareDAO"%>
<%@page import="entity.Review"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.UserReviewDAO"%>
<%@page import="dao.UserDAO"%>
<%@page import="entity.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" href="images/icon/echo.ico" type="image/x-icon">

        <script type="text/javascript">

        </script>
    </head>
    <body>
        <!--Standard Includes-->
        <%@include file="include/header-nav.jsp" %>
        <%@include file="include/bootstrap.jsp" %>


        <%            //instatiates user info
            String firstname = "";
            String u_fullname = "";
            String email = "";
            int postal = 0;
            String image = "";
            ArrayList<Review> reviewsbyu = null;

            int userid = (Integer) session.getAttribute("userid");

            UserDAO userdao = new UserDAO();
            User u = userdao.getUser(userid);

            //stores isAdmin
            boolean admin = u.isAdmin();

            //to display friends
            ArrayList<User> friendlist = userdao.getUsers();
            UserReviewDAO userreviewdao = new UserReviewDAO();

            //if viewing friend
            if (request.getParameter("frienduserid") != null) {
                u = userdao.getUser(Integer.parseInt(request.getParameter("frienduserid")));

                firstname = u.getFirstname();
                u_fullname = u.getFirstname() + " " + u.getLastname();
                email = u.getEmail();
                postal = u.getPostal();
                image = u.getImage();

                reviewsbyu = userreviewdao.getReviews(Integer.parseInt(request.getParameter("frienduserid")));
            } else {
                u = userdao.getUser(userid);

                firstname = u.getFirstname();
                u_fullname = u.getFirstname() + " " + u.getLastname();
                email = u.getEmail();
                postal = u.getPostal();
                image = u.getImage();

                reviewsbyu = userreviewdao.getReviews(userid);
            }

        %>

        <%            //if user had clicked login
            if (session.getAttribute("editMsg") != null) {
        %>
        <script>
            alert("<%=session.getAttribute("editMsg")%>");
        </script>
        <%
                session.removeAttribute("editMsg");
            }
        %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-2 col-xs-4">
                    <!-- Sidebar -->
                    <img src="images/user/<%=image%>" alt="profile picture" class="img-thumbnail">
                </div>
                <div class="col-md-8 col-xs-8">
                    <!-- Main Body -->

                    <!--Welcome Message-->
                    <h2>Welcome, <%=firstname%>!</h2>

                    <div class="row">
                        <div class="col-md-8 col-xs-8 bg-info">
                            <!-- Personal Particulars-->
                            <div class="row">
                                <div class="col-md-4 col-xs-4">
                                    <!-- Information Headers-->
                                    Full Name: </br>
                                    Email Address: </br>
                                    Postal Code: </br>
                                    Administrator Rights </br>
                                </div>
                                <div class="col-md-8 col-xs-8">
                                    <!-- Information Body-->
                                    <%=u_fullname%> </br>
                                    <%=email%> </br>
                                    <%=postal%> </br>
                                    <%=admin%> </br>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4 col-xs-4">
                            <!-- Options for user-->
                            <%
                                if (request.getParameter("frienduserid") == null) {
                            %>
                            <button id="btnEditInfo" onclick="window.location.href = 'user-edit.jsp'">Edit Info</button>
                            <button id="btnRank" onclick="window.location.href = 'c-top-rank.jsp'">View Ranks</button><br><br>
                            <%
                            } else {
                            %>
                            <button id="btnBackToProfile">Back to Own Profile</button>
                            <%
                                }
                            %>


                            <%
                                if (admin) {
                            %>
                            <br><br><button id="btnAdminEditUser">Change Other Users Data</button>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12 col-xs-12">
                            <!--Reviews by User-->
                            <h3>Reviews</h3>
                            </br>
                            <%
                                for (Review review : reviewsbyu) {
                                    int childcare_id = review.getChildcare_id();
                                    ChildcareDAO cdao = new ChildcareDAO();
                                    Childcare childcare = cdao.getChildcare(childcare_id);
                            %>
                            <div class="row">
                                <div class="col-md-8 col-xs-8 bg-info">
                                    Childcare: <b><%=childcare.getName()%></b><br><br>
                                    "<%=review.getReview()%>"<br><br>

                                </div>
                            </div>
                            <br><br>
                            <%
                                }
                            %>
                        </div>                           
                    </div>

                    <!--ADMIN DATA LOADED HERE-->    
                </div>
            </div>
        </div>
    </body>
</html>
