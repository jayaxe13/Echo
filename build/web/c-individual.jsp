<%-- 
    Document   : childcare
    Created on : Aug 9, 2015, 10:48:14 PM
    Author     : Daniel
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="dao.*"%>
<%@page import="entity.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="icon" href="images/icon/echo.ico" type="image/x-icon">

        <title>Echo</title>

        <script>

        </script>
        <style>
            //CSS for the Modal Pop Up
            body {
                color: #333;
                font-family: 'Helvetica', arial;
            }

            .wrap {
                padding: 40px;
                text-align: center;
            }

            hr {
                clear: both;
                margin-top: 40px;
                margin-bottom: 40px;
                border: 0;
                border-top: 1px solid #aaa;
            }

            h1 {
                font-size: 30px;
                margin-bottom: 40px;
            }

            p {
                margin-bottom: 20px;
            }

            .btn {
                background: #428bca;
                border: #357ebd solid 1px;
                border-radius: 3px;
                color: #fff;
                display: inline-block;
                font-size: 14px;
                padding: 8px 15px;
                text-decoration: none;
                text-align: center;
                min-width: 60px;
                position: relative;
                transition: color .1s ease;
            }
            .btn:hover {
                background: #357ebd;
            }
            .btn.btn-big {
                font-size: 18px;
                padding: 15px 20px;
                min-width: 100px;
            }

            .btn-close {
                color: #aaa;
                font-size: 30px;
                text-decoration: none;
                position: absolute;
                right: 5px;
                top: 0;
            }
            .btn-close:hover {
                color: #909090;
            }

            .modal:before {
                content: "";
                /*display: none;*/
                background: transparent;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                z-index: -1;
            }
            .modal:target:before {
                -webkit-transition: -webkit-transform 0.9s ease-out;
                -moz-transition: -moz-transform 0.9s ease-out;
                -o-transition: -o-transform 0.9s ease-out;
                transition: transform 0.9s ease-out;
                z-index: 10;
                background: rgba(0, 0, 0, 0.6);
                /*display: block;*/
            }

            .modal:target + .modal-dialog {
                -webkit-transform: translate(0, 0);
                -ms-transform: translate(0, 0);
                transform: translate(0, 0);
                top: 20%;
            }

            .modal-dialog {

                background: #fefefe;
                border: #333 solid 1px;
                border-radius: 5px;
                margin-left: -200px;
                position: fixed;
                left: 0%;
                top: -100%;
                z-index: 11;
                width: 360px;
                -webkit-transform: translate(0, -500%);
                -ms-transform: translate(0, -500%);
                transform: translate(0, -500%);
                -webkit-transition: -webkit-transform 0.3s ease-out;
                -moz-transition: -moz-transform 0.3s ease-out;
                -o-transition: -o-transform 0.3s ease-out;
                transition: transform 0.3s ease-out;
            }

            .modal-body {
                padding: 20px;
            }

            .modal-header,
            .modal-footer {
                padding: 10px 20px;
            }

            .modal-header {
                border-bottom: #eee solid 1px;
            }
            .modal-header h2 {
                font-size: 20px;
            }

            .modal-footer {
                border-top: #eee solid 1px;
                text-align: right;
            }
        </style>
    </head>
    <body>
        <!--Standard Includes-->
        <%@include file="include/header-nav.jsp" %>
        <%@include file="include/bootstrap.jsp" %>

        <%            String cc_name = "";
            String cc_address = "";
            String name_fromSearch = request.getParameter("search");
            int name_fromCcid = 0;
            if (request.getParameter("ccid") != null) {
                name_fromCcid = Integer.parseInt(request.getParameter("ccid"));
            };
            ChildcareDAO childcaredao = new ChildcareDAO();
            UserDAO userdao = new UserDAO();
            Childcare cc = null;
            if (name_fromCcid > 0) {
                cc = childcaredao.getChildcare(name_fromCcid);
            } else {
                cc = childcaredao.getChildcare(name_fromSearch);
            }
            if (cc != null) {
                cc_name = cc.getName();
                cc_address = cc.getAddress();
                ArrayList<Review> childcare_reviews = childcaredao.getReviewsForChildcare(cc.getID());
        %>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <button id="btnBackToTopRank" onclick="window.location.href = 'c-top-rank.jsp'">Back</button>
                    <div class="col-md-2">
                        <img src="images/childcare/<%=cc.getID()%>.png" alt="profile picture" class="img-thumbnail">
                    </div>
                    <div class="col-md-4">
                        <br><h1><%=cc_name%></h1></br>
                        <br>Address :  <%=cc_address%> </br>
                    </div>
                    <div class="col-md-6">
                        <h1>Reviews for this Childcare:<br></h1>
                            <%
                                if (childcare_reviews.size() > 0) {
                                    for (int i = 0; i < childcare_reviews.size(); i++) {
                                        Review r = childcare_reviews.get(i);
                                        int userid = r.getUser_id();
                                        User user = userdao.getUser(userid);
                            %>
                        Review: <%=r.getReview()%><br>
                        User who made this Review: 
                        <%=user.getFirstname()%> <%=user.getLastname()%><br><br>

                        <%
                            }
                        } else {
                        %>
                        No possible reviews for this Childcare yet.
                        <%
                            }
                        %>                  
                        <br>
                        <%
                            if (session.getAttribute("userid") != null) {
                        %>
                        <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#add-review">Add Review</button>
                        <!-- Modal -->
                        <div id="add-review" class="modal fade" role="dialog">
                            <div class="modal-dialog">

                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title">Add New Review</h4>
                                    </div>
                                    <div class="modal-body">
                                        <form action="add-review">
                                            <textarea name="review" id="new-review" maxlength="500" class="form-control" rows="5" placeholder="Message: (Max 500 characters)" required></textarea><br>
                                            <input type="hidden" name="userid" value="<%=session.getAttribute("userid")%>">
                                            <input type="hidden" name="ccid" value="<%=cc.getID()%>">

                                            <div id="characterLeft"></div>
                                            <script>
                                                $('#characterLeft').text('500 characters left');
                                                $('#new-review').keyup(function () {
                                                    var max = 500;
                                                    var len = $(this).val().length;
                                                    if (len >= max) {
                                                        $('#characterLeft').text(' You have reached the limit');
                                                    } else {
                                                        var ch = max - len;
                                                        $('#characterLeft').text(ch + ' characters left');
                                                    }
                                                });
                                            </script>

                                            <input class="btn btn-primary" style="clear: left; width: 100%; height: 32px; font-size: 13px;" type="submit"/>
                                        </form>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <%
                            } else {

                            }
                        %>
                    </div>
                </div>
            </div>
        </div>


        <%
        } else {
        %>
        NO RESULT FOUND
        <%
            }

        %>

    </body>
</html>
