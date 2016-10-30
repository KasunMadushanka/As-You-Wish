<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="config/db_connection.jsp" %>

<%
    String id = request.getParameter("id");
    session.setAttribute("page", "activation");

    getCon().createStatement().executeUpdate("Update customer set status='" + "active" + "' where customer_id='" + id + "'");

    ResultSet rs = getCon().createStatement().executeQuery("Select* from customer where customer_id='" + id + "'");
    if (rs.first()) {
        session.setAttribute("id", rs.getString("customer_id"));
        session.setAttribute("type", "customer");
        session.setAttribute("first_name", rs.getString("first_name"));
        session.setAttribute("last_name", rs.getString("last_name"));
    }

%>

<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>

        <link  href="css/customer_modal.css" rel="stylesheet" type="text/css"/>
        
        <script src="js/customer_modal.js"></script>  
        <script src="js/bootstrap-filestyle.js"></script>  
        <script src="myjs/image_upload.js"></script>
        <script src="myjs/new_post.js"></script>
        <script src="myjs/update_post.js"></script>
        <script src="myjs/logout.js"></script>
    </head>

    <body class="has-side-panel side-panel-left fullwidth-page">

        <%@ include file="/side_panels/customer_side_panel.jsp" %>

        <div id="wrapper" class="clearfix">

            <!-- Header -->
             <%@ include file="/static/customer_header.jsp"%>

            <!-- Start main-content -->
            <div class="main-content">
                <!-- Section: inner-header -->
                <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/bg11.jpg">
                    <div class="container pt-120 pb-50">
                        <!-- Section Content -->
                        <div class="section-content pt-0">
                            <div class="row"> 
                                <div class="col-md-12">
                                    <h3 class="title text-white">Welcome <%=(String) session.getAttribute("first_name")%></h3>
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
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <!-- end main-content -->

            <!-- Footer -->
            <footer id="footer" class="footer pb-0 bg-black-111">
                <%@ include file="/static/footer.jsp" %>
            </footer>
            <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
        </div>
        <!-- end wrapper -->

        <!-- Footer Scripts -->
        <!-- JS | Custom script for all pages -->
        <script src="js/custom.js"></script>

    </body>

</html>