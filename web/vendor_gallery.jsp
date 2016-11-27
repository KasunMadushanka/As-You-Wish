<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "config/db_connection.jsp" %>
<%
    String id = request.getParameter("id");
    String service = request.getParameter("service");

    session.setAttribute("page", "gallery");
    session.setAttribute("service_id", service);

    ArrayList gallery = new ArrayList();

    ResultSet rs = getCon().createStatement().executeQuery("Select image_url from vendor_gallery where vendor_id='" + id + "' and service_id='" + service + "'");
    while (rs.next()) {
        gallery.add(rs.getString("image_url"));
    }
%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>
    </head>

    <body class="has-side-panel side-panel-left fullwidth-page">

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
            <%@ include file="/static/vendor_header.jsp" %>

            <!-- Start main-content -->
            <div class="main-content">
                <!-- Section: inner-header -->
                <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/bg11.jpg">
                    <div class="container pt-120 pb-50">
                        <!-- Section Content -->
                        <div class="section-content pt-0">
                            <div class="row"> 
                                <div class="col-md-12">
                                    <h3 class="title text-white">Wedding Gallery</h3>
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
                                        <%for (int i = 1; i <= 8; i++) {%>
                                        <div class="portfolio-item">
                                            <a href="images/vendor/gallery_images/1/<%=i%>.jpg" data-lightbox="gallery-item" title="Title Here 1">
                                                <div class="thumb">
                                                    <img class="img-fullwidth photo" src="images/vendor/gallery_images/1/<%=i%>.jpg" alt="project">
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

