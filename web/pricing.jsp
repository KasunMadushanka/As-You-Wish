<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "config/db_connection.jsp" %>

<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>
        <script src="myjs/pricing.js"></script>
    </head>

    <body class="">
        <div id="wrapper">

            <div id="preloader">
                <div id="spinner">
                    <div class="heart-preloader">
                        <i class="fa fa-heart font-36 infinite animated pulse"></i>
                    </div>
                </div>
            </div>

            <!-- Header -->
            <%@ include file="/static/visitor_header.jsp"%>

            <div class="main-content">
                <!-- Section: inner-header -->
                <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/bg11.jpg">
                    <div class="container pt-120 pb-50">
                        <!-- Section Content -->
                        <div class="section-content pt-0">
                            <div class="row"> 
                                <div class="col-md-12">
                                    <h3 class="title text-white">Monthly Pricing Plans</h3>                           
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section>
                    <div class="container">
                        <div class="section-content">
                            <div class="row">
                                <%                                 
                                    ResultSet rs = getCon().createStatement().executeQuery("Select* from pricing");
                                    while (rs.next()) {
                                %>
                                <div class="col-xs-12 col-sm-3 col-md-3 hvr-float-shadow mb-sm-30">
                                    <div class="pricing-table style1 bg-white-light border-10px text-center">
                                        <div class="pt-40 pb-60">                                    
                                            <h4 class="package-type"><%=rs.getString("title")%> Package</h4>
                                            <h6 class="price text-theme-colored mb-10"><span class="font-25">LKR </span><%=rs.getString("price")%></h6>
                                            <ul class="table-list bg-lightest pl-0">
                                                <%String[] features = rs.getString("description").split(",");
                                                    for (int i = 0; i < features.length; i++) {
                                                %>
                                                <li><%=features[i]%></li>          
                                                    <%}
                                                    %>                                                                                                            
                                            </ul>
                                            <a class="btn btn-colored btn-theme-colored text-uppercase" href="vendor_sign_up.jsp?pricing=<%=rs.getString("package_id")%>">Contact Now</a><br>
                                        </div>
                                    </div>
                                </div>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

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