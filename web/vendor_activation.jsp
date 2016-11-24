<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="config/db_connection.jsp" %>

<%
    String id = (String) session.getAttribute("id");

    getCon().createStatement().executeUpdate("Update vendor set status='" + "active" + "' where vendor_id='" + id + "'");

%>

<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>
    </head>

    <body class="">
        <div id="wrapper" class="clearfix">

            <div id="preloader">
                <div id="spinner">
                    <div class="heart-preloader">
                        <i class="fa fa-heart font-36 infinite animated pulse"></i>
                    </div>
                </div>
            </div>

            <header id="header" class="header">
                <div class="header-nav navbar-fixed-top header-dark navbar-white navbar-transparent navbar-sticky-animated animated-active">
                    <div class="header-nav-wrapper">
                        <div class="container">
                            <nav>
                                <div id="menuzord-right" class="menuzord red"> <a class="menuzord-brand pull-left flip font-playball text-theme-colored font-32" href="javascript:void(0)"><i class="fa fa-heart-o font-25"></i> As You Wish <i class="fa fa-heart-o font-25"></i></a>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </header>

            <!-- Start main-content -->
            <div class="main-content">
                <!-- Section: inner-header -->
                <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/bg11.jpg">
                    <div class="container pt-120 pb-50">
                        <!-- Section Content -->
                        <div class="section-content pt-0">
                            <div class="row"> 
                                <div class="col-md-12">
                                    <% ResultSet rs = getCon().createStatement().executeQuery("Select* from vendor where vendor_id='" + id + "'");
                                        if (rs.first()) {
                                    %>
                                    <h3 class="title text-white">Welcome <%=rs.getString("first_name")%></h3>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="">
                    <div class="container mt-30 mb-30 p-30">
                        <div class="section-content">
                            <div class="form-group">
                                <center><h2>Congratulations!</h2></center>
                                <center><p class="font-18"><b>You have activated your new As You Wish account...</b></p></center>
                                <center><a class="font-15" href="index.jsp"><b>Click here to Login</b></a></center>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

            <footer id="footer" class="footer pb-0 bg-black-111">
                <%@ include file="/static/footer.jsp" %>
            </footer>
            <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
        </div>

        <script src="js/custom.js"></script>

    </body>

</html>