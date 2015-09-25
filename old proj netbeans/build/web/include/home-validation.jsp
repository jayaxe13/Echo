<%-- 
    Document   : home-validation
    Created on : Sep 4, 2015, 4:22:26 PM
    Author     : Qianpin
--%>

<%@page import="dao.UserDAO"%>
<%
    UserDAO userdao = new UserDAO();
    String firstname = "";
//validates if user exists already            
    if (session.getAttribute("userid") != null) {
        int userid = (Integer) session.getAttribute("userid");
        firstname = (userdao.getUser((Integer) session.getAttribute("userid"))).getFirstname();
%>
<input type="hidden" id="userid" value="<%=userid%>">
<%
    //if user had clicked login
    if (session.getAttribute("returnMsg") != null) {
%>
<script>
    alert("<%=session.getAttribute("returnMsg") + firstname%>");
</script>
<%
            session.removeAttribute("returnMsg");
        }
    }
    //if user keyed in wrong login details
    if (session.getAttribute("returnMsg") != null) {
%>
<script>
    alert("<%=session.getAttribute("returnMsg") + firstname%>");
</script>
<%
        session.removeAttribute("returnMsg");
    }
    //checks if user has logged in
    if (session.getAttribute("validateMsg") != null) {
%>
<script>
    alert("<%=session.getAttribute("validateMsg")%>");
</script>
<%
        session.removeAttribute("validateMsg");
    }
    //if user click Sign Up
    if (session.getAttribute("signUpMessage") != null) {
%>
<script>
    alert("<%=session.getAttribute("signUpMessage")%>");
</script>
<%
        session.removeAttribute("signUpMessage");
    }
    //if user clicked logout
    if (session.getAttribute("logoutMsg") != null) {
%>
<script>
    alert("<%=session.getAttribute("logoutMsg")%>");
</script>
<%
        session.removeAttribute("logoutMsg");
    }
    //if user had clicked forgot password
    if (session.getAttribute("pwmsg") != null) {
%>
<script>
    alert("<%=session.getAttribute("pwmsg")%>");
</script>
<%
        session.removeAttribute("pwmsg");
    }
%>
