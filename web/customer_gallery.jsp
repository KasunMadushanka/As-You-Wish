<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "config/db_connection.jsp" %>
<%
    String id = (String) session.getAttribute("id");
    session.setAttribute("page", "gallery");

    ArrayList gallery = new ArrayList();

    ResultSet rs = getCon().createStatement().executeQuery("Select title,image_url from couple_blog where customer_id='" + id + "'");
    while (rs.next()) {
        String[] data = new String[2];
        data[0] = rs.getString("title");
        data[1] = rs.getString("image_url");

        gallery.add(data);
    }


%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>
    </head>

    <body class="has-side-panel side-panel-left fullwidth-page">

        <%@ include file="/side_panels/customer_side_panel.jsp" %>

        <div id="wrapper" class="clearfix">
            <!-- preloader -->
            <div id="preloader">
                <div id="spinner">
                    <div class="heart-preloader">
                        <i class="fa fa-heart font-36 infinite animated pulse"></i>
                    </div>
                </div>
            </div>

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
                                    <h3 class="title text-white">Gallery</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Section: Gallery  -->
                <section id="gallery" class="bg-lighter">
                    <div class="container-fluid p-0">
                        <div class="section-content">
                            <div class="row">
                                <div class="col-md-12"> 

                                    <!-- Gallery Grid -->
                                    <div id="grid" class="portfolio-gallery masonry grid-4 clearfix" data-lightbox="gallery">
                                        <%for (int i = 0; i < gallery.size(); i++) {
                                                String[] data = (String[]) gallery.get(i);%>
                                        <!-- Image -->
                                        <div class="portfolio-item">
                                            <a href="<%=data[1]%>" data-lightbox="gallery-item" title="<%=data[0]%>">
                                                <div class="thumb">
                                                    <img class="img-fullwidth photo" src="<%=data[1]%>" alt="project" height="200">
                                                    <div class="overlay-shade"></div>
                                                    <div class="text-holder">
                                                        <div class="title text-center">Wedding</div>
                                                    </div>
                                                    <div class="icons-holder">
                                                        <div class="icons-holder-inner">
                                                            <div class="social-icons icon-sm icon-dark icon-circled icon-theme-colored">
                                                                <i class="fa fa-plus text-white"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <!-- Image -->
                                        <%}%>
                                    </div>
                                    <!-- Gallery Grid --> 
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <!-- end main-content -->

            <!-- Footer -->
            <footer id="footer" class="footer pb-0 bg-black-111">
                <%@ include file="/static/footer.jsp"%>
            </footer>
            <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
        </div>
        <!-- end wrapper -->

        <!-- Footer Scripts -->
        <!-- JS | Custom script for all pages -->
        <script src="js/custom.js"></script>

    </body>

</html>

