<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>As You Wish</title>
        <%@ include file="/static/head.jsp" %>
        <link rel="stylesheet" href="video_data/template_data/style.css">
        <script src="video_data/template_data/UnityProgress.js"></script>
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

            <!-- Start main-content -->
            <div class="main-content">
                <!-- Section: inner-header -->
                <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/bg11.jpg">
                    <div class="container pt-120 pb-50">
                        <!-- Section Content -->
                        <div class="section-content pt-0">
                            <div class="row"> 
                                <div class="col-md-12">
                                    <h3 class="title text-white">Thank You For Being With Us!</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section>
                    <div class="container pt-80">
                        <div class="template">
                            <div class="template-wrap clear">
                                <canvas class="emscripten" id="canvas" oncontextmenu="event.preventDefault()" height="460px" width="1920px" style="position:relative;top:178px;"></canvas>
                                <br>
                                <div class="logo"></div>
                            </div>

                            <script type='text/javascript'>
                                var Module = {
                                    TOTAL_MEMORY: 268435456,
                                    errorhandler: null,
                                    compatibilitycheck: null,
                                    dataUrl: "video_data/video.data",
                                    codeUrl: "video_data/video.js",
                                    memUrl: "video_data/video.mem",
                                };
                            </script>
                            <script src="video_data/UnityLoader.js"></script>
                        </div>
                    </div>
                </section>
            </div>
            <!-- end main-content -->

            <!-- Footer -->
            <footer id="footer" class="footer pb-0 bg-black-111" style="position:relative;top:302px;">
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