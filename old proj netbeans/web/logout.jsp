<%
    session.removeAttribute("userid");
    session.setAttribute("logoutMsg", "You've successfully logged out!");
    response.sendRedirect("home.jsp");
%>
