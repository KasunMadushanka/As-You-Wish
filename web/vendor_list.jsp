<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="config/db_connection.jsp" %>

<%
    String service_id = request.getParameter("service_id");
    String service = request.getParameter("service");

    ArrayList vendors = new ArrayList();

    ResultSet rs = getCon().createStatement().executeQuery("Select vendor.vendor_id,vendor.company_name,service_registry.rank,service_registry.rating,service_registry.image_url from vendor inner join service_registry on vendor.vendor_id=service_registry.vendor_id where service_registry.service_id='" + service_id + "'");
    while (rs.next()) {

        String[] details = new String[5];

        details[0] = rs.getString("vendor_id");
        details[1] = rs.getString("company_name");
        details[2] = rs.getString("image_url");
        details[3] = rs.getString("rank");
        details[4] = rs.getString("rating");

        vendors.add(details);
    }


%>


<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>

        <script src="myjs/vendor_search.js"></script>
    </head>

    <body class="has-side-panel side-panel-left fullwidth-page">
        
         <%if ((String) session.getAttribute("id") != null) {%>
        <%@ include file="/side_panels/customer_side_panel.jsp"%>
        <%}%>
        
        <div id="wrapper" class="clearfix">

            <div id="preloader">
                <div id="spinner">
                    <div class="heart-preloader">
                        <i class="fa fa-heart font-36 infinite animated pulse"></i>
                    </div>
                </div>
            </div>

            <!-- Header -->
            <%if ((String) session.getAttribute("id") != null) {%>
            <%@ include file="/static/customer_header.jsp"%>
            <%} else {%>
            <%@ include file="/static/visitor_header.jsp"%>
            <%}%>

            <!-- Start main-content -->
            <div class="main-content">
                <!-- Section: inner-header -->
                <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/bg11.jpg">
                    <div class="container pt-120 pb-50">
                        <!-- Section Content -->
                        <div class="section-content pt-0">
                            <div class="row"> 
                                <div class="col-md-12">
                                    <h3 class="title text-white"><%=service%></h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Section: Shop Category Sidebar -->
                <section class="">
                    <div class="container mt-30 mb-30 p-30">
                        <div class="section-content">
                            <div class="row">
                                <div class="col-md-12 col-md-9">
                                    <div class="row multi-row-clearfix">
                                        <div id="content" class="products">
                                            <%for (int m = 0; m < vendors.size(); m++) {
                                                    String[] vendor = (String[]) vendors.get(m);%>
                                            <div class="col-sm-6 col-md-4 col-lg-4 mb-30">
                                                <div class="product">
                                                    <span class="tag-sale">rank:<%=vendor[3]%></span>
                                                    <div> <img alt="" src="<%=vendor[2]%>" class="" width="260" height="150">
                                                        <div class="overlay"></div>
                                                    </div>
                                                    <div class="product-details text-center">
                                                        <a><h5 class="product-title"><%=vendor[1]%></h5></a>
                                                        <div class="star-rating" title="Rated 4.50 out of 5"><span style="width: 90%;">3.50</span></div>                                             
                                                        <div class="btn-add-to-cart-wrapper p-10">
                                                            <a class="btn btn-default btn-sm" href="storefront.jsp?id=<%=vendor[0]%>&service=<%=service_id%>">More Details</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <div class="widget">
                                        <h5 class="widget-title line-bottom">Search box</h5>
                                        <div class="search-form">
                                            <form>
                                                <div class="input-group">
                                                    <input id="search" type="text" placeholder="Click to Search" class="form-control search-input">
                                                    <span class="input-group-btn">
                                                        <button id="search_button" type="button" class="btn search-button"><i class="fa fa-search"></i></button>
                                                    </span>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="sidebar sidebar-right mt-sm-30">
                                        <div class="widget">
                                            <h5 class="widget-title line-bottom">Categories</h5>
                                            <div class="categories">
                                                <ul class="list list-border angle-double-right">
                                                    <%
                                                        ResultSet rs1 = getCon().createStatement().executeQuery("Select* from service");
                                                        while (rs1.next()) {%>
                                                    <li><a href="vendor_list.jsp?service_id=<%=rs1.getString("service_id")%>&service=<%=rs1.getString("name")%>"><%= rs1.getString("name")%></a></li>
                                                        <%    }
                                                        %>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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

    <!-- Mirrored from kodesolution.com/demo/wedding/happy-wedding/v2.0/shop-category-sidebar.html by HTTrack Website Copier/3.x [XR&CO'2014], Tue, 24 May 2016 13:11:41 GMT -->
</html>