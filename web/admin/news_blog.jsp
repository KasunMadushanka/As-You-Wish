<%@page import="java.util.Calendar"%>
<%@ include file="../config/sessionCheckAdmin.jsp" %>
<%
%>

<!DOCTYPE html>

<html lang="en">

    <head>
        <%@ include file="static/head.jsp" %>

        <link rel="stylesheet" href="assets/css/switch/bootstrap-switch.css">


        <script src="assets/js/switch/bootstrap-switch.js"></script>



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
                    <li><a href="javascript:;">News Blog</a></li>
                </ol>

                <h1 class="page-header">Timeline</h1>
                <!-- end page-header -->

                <!-- begin timeline -->
                <ul class="timeline">
                    <%for(int i=0;i<10;i++){%>
                    <li>
                        <!-- begin timeline-time -->
                        <div class="timeline-time">
                            <span class="date">10 January 2016</span>
                            <span class="time">08:43 PM</span>
                        </div>
                        <!-- end timeline-time -->
                        <!-- begin timeline-icon -->
                        <div class="timeline-icon">
                            <a href="javascript:;"><i class="fa fa-camera"></i></a>
                        </div>
                        <!-- end timeline-icon -->
                        <!-- begin timeline-body -->
                        <div class="timeline-body">
                            <div class="timeline-header">
                                <span class="userimage"><img src="assets/img/user-7.jpg" alt="" /></span>
                                <span class="username">Rahal Jayawardene</span>
                                <span class="pull-right text-muted">75 Views</span>
                            </div>
                            <div class="timeline-content">
                                <h4 class="template-title">
                                    Bridal Show 2016
                                </h4>
                                <p class="m-t-20">
                                    <img src="assets/img/gallery/gallery-4.jpg" alt="" />
                                </p>
                                <p>Bridal Show is going to be held 15th of November 2016.</p>                            
                            </div>
                            <div class="form-group" style="padding-top: 15px;">
                                <a href="javascript:;" class="m-r-15"><i class="fa fa-thumbs-up fa-fw"></i> Like</a>
                                <a href="javascript:;"><i class="fa fa-comments fa-fw"></i> View Comments</a>
                            </div>
                            <input type="text" class="form-control" placeholder="Write a comment...">
                        </div>

                    </li>
                    <%}%>

                </ul>


            </div>

        </div>

        <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>


        <script src="assets/plugins/jquery/jquery-1.9.1.min.js"></script>
        <script src="assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
        <script src="assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/plugins/jquery-cookie/jquery.cookie.js"></script>

        <script src="assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>
        <script src="assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
        <script src="assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
        <script src="assets/js/table-manage-default.demo.min.js"></script>
        <script src="assets/js/apps.min.js"></script>

        <script>
            $(document).ready(function () {
                App.init();
                TableManageDefault.init();
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

