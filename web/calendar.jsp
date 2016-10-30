<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>
    </head>
    <!-- Header -->
    <body class="has-side-panel side-panel-left fullwidth-page">
        
        <%@ include file="/side_panels/vendor_side_panel.jsp"%>
        
        <div id="wrapper" class="clearfix">
          
            <div id="preloader">
                <div id="spinner">
                    <div class="heart-preloader">
                        <i class="fa fa-heart font-36 infinite animated pulse"></i>
                    </div>
                </div>
            </div>

            <!-- Header -->
           <%@include file="/static/vendor_header.jsp"%>

            <!-- Start main-content -->
            <div class="main-content">
                <!-- Section: inner-header -->
                <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/bg11.jpg">
                    <div class="container pt-120 pb-50">
                        <!-- Section Content -->
                        <div class="section-content pt-100">
                            <div class="row"> 
                                <div class="col-md-12">
                                    <h3 class="title text-white">Calender</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- divider: what makes us different -->
                <section class="divider bg-lightest">
                    <div class="container">
                        <div class="section-content text-center">
                            <div class="row">
                                <div class="col-md-12">
                                    <div id="full-event-calendar"></div>
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
        <!-- JS | Calendar Event Data -->
        <script src="js/calendar-events-data.js"></script>
        <!-- JS | Custom script for all pages -->
        <script src="js/custom.js"></script>


    </body>

</html>