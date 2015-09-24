<%
    if(session.getAttribute("userid")==null){
        
        session.setAttribute("validateMsg", "Please Log In");
        
        response.sendRedirect("home.jsp");
        return;
    }
    %>
