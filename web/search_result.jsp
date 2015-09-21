<%-- 
    Document   : search_result
    Created on : Sep 17, 2015, 2:19:05 PM
    Author     : teckhui.lee.2013
--%>

<%@page import="entity.Childcare"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        test
        <%
            ArrayList<Childcare> childcares= (ArrayList<Childcare>)request.getAttribute("result");
            for(Childcare childcare : childcares){
                out.println(childcare.getName());
            }
        %>
    </body>
</html>
