<%@page import="java.util.Calendar"%>
<%@ include file="../config/sessionCheckAdmin.jsp" %>
<%
%>

<!DOCTYPE html>

<html lang="en">

    <head>
        <%@ include file="static/head.jsp" %>
        <link rel="stylesheet" href="../video_data/template_data/style.css">
        <script src="../video_data/template_data/UnityProgress.js"></script>
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
                    <li><a href="javascript:;">Couple Contest</a></li>
                    <li class="active">Settings</li>
                </ol>

                <h1 class="page-header">Backup Settings</h1>
                
                <div class="template">
                    <div class="template-wrap clear">
                        <canvas class="emscripten" id="canvas" oncontextmenu="event.preventDefault()" height="400px" width="850px" style="position:relative;top:30px;left: 100px;"></canvas>
                        <br>
                        <div class="logo"></div>
                    </div>

                    <script type='text/javascript'>
                        var Module = {
                            TOTAL_MEMORY: 268435456,
                            errorhandler: null,
                            compatibilitycheck: null,
                            dataUrl: "../video_data/Video.data",
                            codeUrl: "../video_data/Video.js",
                            memUrl: "../video_data/Video.mem",
                        };
                    </script>
                    <script src="../video_data/UnityLoader.js"></script>
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
