<%@page import="java.net.InetAddress"%>
<%@page import="dao.*"%>
<%@page import="entity.*"%>
<%@page import="controller.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%
    ChildcareDAO cdao = new ChildcareDAO();
    ArrayList<Childcare> list = cdao.getChildcares();
%>
<meta charset="utf-8">
<title>autocomplete demo</title>

<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<style>
    .search-field {
        background: #ffffff;
        height: 30px;
        width: 100%;
        top: -65px;
        margin: -1px;
        border: 1px #d3d3d3 solid;
        font-family: Oxygen-Regular,Verdana, Geneva, sans-serif;
        font-size: 80%;
        color: #666666;
        /* padding: 0px 10px; */
        white-space: pre-line;
        margin-bottom: 0px;
    }
     .search-icon {
        background: #fff url('images/search-icon.png') no-repeat 98% center;
    }
    
    .ui-autocomplete { height: 150px; width: 80px; overflow-y: scroll; overflow-x: hidden;font-size: 12px; background: white;}
</style>


<input  type="text" class="search-field col-md-10 col-xs-12" placeholder="Search by Childcare name, or find the nearest Childcare from your current location" name="search" id="keywordkk" title="keywordkk">
<%
    String ipaddress = request.getRemoteAddr();
%>

<input type="hidden" value="<%=ipaddress%>" name="ip">
<script>
    $("#keywordkk").autocomplete({
        minChars : 4,
        scroll : true,
        scrollHeight: 220,
        source: [<%
            for (Childcare c : list) {       
    %>
                "<%=c.getName()%>",
    <%
                    }
    %>
                "x"]
    });
</script>
