<%-- 
    Document   : header-nav
    Created on : Sep 3, 2015, 1:02:51 PM
    Author     : qianpin
--%>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="home.jsp"><img src="images/home/logo.png" alt="logo image" style="max-height: 50px; width: auto;"></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <form class="navbar-form navbar-left" role="search" action="processSearch.jsp">
                <div class="form-group">
                    <input type="text" name="query" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <ul class="nav navbar-nav navbar-right">

                <%
                    if (session.getAttribute("userid") == null) {
                %>
                <!-- For Login -->
                <li class="dropdown">
                    <a class="dropdown-toggle" href="#" data-toggle="dropdown">Login <strong class="caret"></strong></a>
                    <div class="dropdown-menu" style="padding: 15px; padding-bottom: 0px;">
                        <!-- Login form here -->
                        <form action="login" accept-charset="UTF-8">
                            <input style="margin-bottom: 15px;" type="text" name="email" size="30" placeholder="Email" />
                            <input style="margin-bottom: 15px;" type="password" name="password" size="30" placeholder="Password"/>
                            <input id="user_remember_me" style="float: left; margin-right: 10px;" type="checkbox" name="user[remember_me]" value="1" />
                            <label class="string optional" for="user_remember_me"> Remember me</label><br>
                            <label><a href="forgot-password.jsp">Forgot Password?</a></label>

                            <input class="btn btn-primary" style="clear: left; width: 100%; height: 32px; font-size: 13px;" type="submit"/><br><br>
                        </form>
                    </div>
                </li>
                <!-- For Sign Up -->
                <li><a href="sign-up.jsp">Sign Up</a></li>
                <%
                    }
                    if (session.getAttribute("userid") != null) {
                %>
                <li><a href="user-profile.jsp">Profile</a></li>
                <li><a href="logout.jsp">Logout</a></li>
                    <%
                        }
                    %>
                

                <li><a href="#">Facebook Login HERE</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Action</a></li>
                        <li><a href="#">Another action</a></li>
                        <li><a href="#">Something else here</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">Separated link</a></li>
                    </ul>
                </li>

            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

