<%-- 
    Document   : searchbar
    Created on : May 20, 2015, 10:33:08 AM
    Author     : Qianpin
--%>
<%@page import="dao.*"%>
<%@page import="entity.*"%>
<%@page import="controller.*"%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<script type="text/javascript" src="http://highslide.com/highslide/highslide-full.js"></script>
<script type="text/javascript" src="js/highslide/highslide-with-html.js"></script>
<script type="text/javascript" src="js/highslide/highslide-with-html1.js"></script>
<!-- blueprint js framework -->
<script type="text/javascript" src="js/ajaxtabs/ajaxtabs.js"></script>
<!-- vediogallarytabs-->
<link rel="stylesheet" type="text/css" href="js/ajaxtabs/ajaxtabs.css"/>
<link rel="stylesheet" type="text/css" href="js/highslide/highslide.css" />
<link href="css/bootstrap.css" rel="stylesheet">
<style>
    
</style>
<script type="text/javascript">
    hs.graphicsDir = 'http://highslide.com/highslide/graphics/';
    hs.outlineType = 'rounded-white';
    hs.wrapperClassName = 'draggable-header';
</script>


<!--Search Bar Codes--->
<!-- Search Field-->
                <form name="form1" id="form1" method="post" action="childcare/c-individual.jsp">
                    <jsp:include page="autocomplete.jsp"/>
                </form>
