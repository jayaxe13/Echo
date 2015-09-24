<%-- 
    Document   : admin-userprofilespage
    Created on : Aug 8, 2015, 3:36:53 PM
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
        <title> Admin Page </title>
    </head>
    <body>
        <h1>ADMIN PAGE</h1>
        <%
            UserDAO userdao = new UserDAO();
            //admin validation
                    int userid = (Integer)session.getAttribute("userid");
                    User admin = userdao.getUser(userid);
                    if(!admin.isAdmin()){
                        response.sendRedirect("user-profile.jsp");
                    }
                    //admin validation ENDS
            ChildcareDAO childcaredao = new ChildcareDAO();
            ArrayList<Childcare> childcareList = childcaredao.getChildcares();
            for (Childcare childcare : childcareList) {
                int childcare_id = childcare.getID();
                String name = childcare.getName();
                String address = childcare.getAddress();
                int rating = childcare.getRating();
        %>
        <br>ID : <%=childcare_id%>, Name = <%=name%>, address <%=address%>, Rating = <%=rating%> </br>


        <%
            }

        %>
    </body>
</html>
