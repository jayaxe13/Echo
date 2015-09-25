<%-- 
    Document   : modal
    Created on : Sep 7, 2015, 12:31:40 PM
    Author     : Toshiba PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
    </body>
</html>
