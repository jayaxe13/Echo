<%-- 
    Document   : rankedChildcare
    Created on : Aug 9, 2015, 8:24:48 PM
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
        <title>Rating Page</title>
        <script>
            
        </script>
    </head>
    <body>
        <!--Standard Includes-->
        <%@include file="include/header-nav.jsp" %>
        <%@include file="include/bootstrap.jsp" %>
        
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    
                    
                    <h1>TOP 10 CHILDCARES</h1>
                     
                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-3">
                            <b>Childcare Name</b>
                        </div>
                        <div class="col-md-3">
                            <b>Address</b>
                        </div>
                        <div class="col-md-1">
                            <b>Rating</b>
                        </div>
                    </div>
                    <%  ChildcareDAO dao = new ChildcareDAO();
                        ArrayList<Childcare> cList = dao.getRankedChildcares();

                        for (Childcare childcare : cList) {
                            int childcareID = childcare.getID();
                            String name = childcare.getName();
                            String address = childcare.getAddress();
                            int rating = childcare.getRating();


                    %>   
                    <div class="row">
                        <div class="col-md-1">
                            <button class="btnView" onclick="window.location.href = 'c-individual.jsp?ccid=<%=childcareID%>'" value="<%=childcareID%>">View</button>
                        </div>
                        <div class="col-md-3">
                            <%=name%>
                        </div>
                        <div class="col-md-3">
                            <%=address%>
                        </div>
                        <div class="col-md-1">
                            <%=rating%>
                        </div> 
                    </div><br>                   
                    <%
                        }

                    %>
                </div>            
            </div>
        </div>
    </body>
</html>
