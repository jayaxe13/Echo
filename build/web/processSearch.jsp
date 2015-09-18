<%-- 
    Document   : processSearch
    Created on : Sep 17, 2015, 2:17:37 PM
    Author     : teckhui.lee.2013
--%>
<%@page import="entity.Childcare"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ChildcareDAO"%>
<%
    ChildcareDAO childDao = new ChildcareDAO();
    ArrayList<Childcare> childcares = childDao.search(request.getParameter("query"));
    request.setAttribute("result", childcares);
    
    RequestDispatcher rd = request.getRequestDispatcher("search_result.jsp");    
    rd.forward(request, response);
%>