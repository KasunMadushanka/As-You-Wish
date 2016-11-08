<%@page import="java.util.Calendar"%>
<%@ include file="../config/sessionCheckAdmin.jsp" %>
<%
%>

<!DOCTYPE html>

<html lang="en">

    <head>
        <%@ include file="static/head.jsp" %>

        <link href="assets/plugins/switchery/switchery.min.css" rel="stylesheet" />

    </head>

    <body>

        <!-- begin #page-container -->
        <div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
            <!-- begin #header -->
            <%@ include file="static/header.jsp" %>
            <!-- end #header -->

            <!-- begin #sidebar -->
            <%@ include file="static/navbar.jsp" %>
            <!-- end #sidebar -->

            <!-- begin #content -->
            <div id="content" class="content">
                <!-- begin breadcrumb -->
                <ol class="breadcrumb pull-right">
                    <li><a href="javascript:;">Home</a></li>
                    <li><a href="javascript:;">Video Clip</a></li>
                    <li class="active">Settings</li>
                </ol>

                <h1 class="page-header">Video Settings</h1>     

                <div class="panel panel-inverse">
                    <div class="panel-heading">
                        <div class="panel-heading-btn">
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                        </div>
                        <h4 class="panel-title">Configuration</h4>
                    </div>
                    <div class="panel-body panel-form">
                        <form class="form-horizontal form-bordered">
                            <div class="form-group" style="padding-top: 0px;">                              
                                <label class="control-label col-md-2">Your Greeting</label>
                                <div class="col-md-4">
                                    <input id="no_of_images" type="text" class="form-control" />
                                </div>                                  
                            </div>
                            <div class="form-group">                              
                                <label class="control-label col-md-2">Number of Images</label>
                                <div class="col-md-4">
                                    <input id="no_of_images" type="number" class="form-control" />
                                </div>                                  
                            </div>
                          
                            <div class="form-group">
                                <label class="control-label col-md-4">Scheduled Date</label>
                                <div class="col-md-8">
                                    <div class="input-group input-daterange">
                                        <input type="text" class="form-control" name="start" placeholder="Date Start" />
                                        <span class="input-group-addon">to</span>
                                        <input type="text" class="form-control" name="end" placeholder="Date End" />
                                    </div>
                                </div>                                      
                            </div>

                        </form>
                    </div>
                </div>
            </div>             
        </div>

        <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>


        <script src="assets/plugins/jquery/jquery-1.9.1.min.js"></script>
        <script src="assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
        <script src="assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/plugins/jquery-cookie/jquery.cookie.js"></script>

        <script src="assets/plugins/switchery/switchery.min.js"></script>
        <script src="assets/plugins/powerange/powerange.min.js"></script>
        <script src="assets/js/form-slider-switcher.demo.min.js"></script>

        <script src="assets/js/apps.min.js"></script>

        <script>
            $(document).ready(function () {
                App.init();
                FormSliderSwitcher.init();
            });
            $('#myModal1').modal({
                show: true
            });

        </script>
        <script>
            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                        m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', '../../../../www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'UA-53034621-1', 'auto');
            ga('send', 'pageview');
        </script>
    </body>

</html>
