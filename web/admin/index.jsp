<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>As You Wish | Admin Panel</title>
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
        <meta content="" name="description" />
        <meta content="" name="author" />

        <!-- ================== BEGIN BASE CSS STYLE ================== -->
        <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
        <link href="assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css" rel="stylesheet" />
        <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="assets/css/animate.min.css" rel="stylesheet" />
        <link href="assets/css/style.min.css" rel="stylesheet" />
        <link href="assets/css/style-responsive.min.css" rel="stylesheet" />
        <link href="assets/css/theme/default.css" rel="stylesheet" id="theme" />
        <!-- ================== END BASE CSS STYLE ================== -->

        <!-- ================== BEGIN PAGE LEVEL CSS STYLE ================== -->
        <link href="assets/plugins/jquery-jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" />
        <link href="assets/plugins/bootstrap-calendar/css/bootstrap_calendar.css" rel="stylesheet" />
        <link href="assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" />
        <link href="assets/plugins/morris/morris.css" rel="stylesheet" />
        <!-- ================== END PAGE LEVEL CSS STYLE ================== -->

        <!-- ================== BEGIN BASE JS ================== -->
        <script src="assets/plugins/pace/pace.min.js"></script>
        <!-- ================== END BASE JS ================== -->
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
                    <li class="active">Dashboard </li>
                </ol>
                <!-- end breadcrumb -->
                <!-- begin page-header -->
                <h1 class="page-header">Dashboard <small>Control every thing from here...</small></h1>
                <!-- end page-header -->
                <!-- begin row -->
                <div class="row">
                    <!-- begin col-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="widget widget-stats bg-green">
                            <div class="stats-icon stats-icon-lg"><i class="fa fa-globe fa-fw"></i></div>
                            <div class="stats-title">Today's visits</div>
                            <div class="stats-number">42,900</div>
                            <div class="stats-progress progress">
                                <div class="progress-bar" style="width: 62.1%;"></div>
                            </div>

                        </div>
                    </div>
                    <!-- end col-3 -->
                    <!-- begin col-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="widget widget-stats bg-blue">
                            <div class="stats-icon stats-icon-lg"><i class="fa fa-tags fa-fw"></i></div>
                            <div class="stats-title">New Users</div>
                            <div class="stats-number">36,500</div>
                            <div class="stats-progress progress">
                                <div class="progress-bar" style="width: 79.5%;"></div>
                            </div>

                        </div>
                    </div>
                    <!-- end col-3 -->
                    <!-- begin col-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="widget widget-stats bg-purple">
                            <div class="stats-icon stats-icon-lg"><i class="fa fa-shopping-cart fa-fw"></i></div>
                            <div class="stats-title">Orderd Times</div>
                            <div class="stats-number">9,900</div>
                            <div class="stats-progress progress">
                                <div class="progress-bar" style="width: 52.3%;"></div>
                            </div>

                        </div>
                    </div>
                    <!-- end col-3 -->
                    <!-- begin col-3 -->
                    <div class="col-md-3 col-sm-6">
                        <div class="widget widget-stats bg-black">
                            <div class="stats-icon stats-icon-lg"><i class="fa fa-comments fa-fw"></i></div>
                            <div class="stats-title">Total Voters - 2016</div>
                            <div class="stats-number">83,988</div>
                            <div class="stats-progress progress">
                                <div class="progress-bar" style="width: 86.9%;"></div>
                            </div>

                        </div>
                    </div>
                    <!-- end col-3 -->
                </div>
                <!-- end row -->

                <!-- begin row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="widget-chart with-sidebar bg-black">
                            <div class="widget-chart-content">
                                <h4 class="chart-title">
                                    WebSite Traffic
                                    <small></small>
                                </h4>
                                <div id="visitors-line-chart" class="morris-inverse" style="height: 260px;"></div>
                            </div>
                            <div class="widget-chart-sidebar bg-black-darker">
                                <div class="chart-number">
                                    42,900
                                    <small>visitors</small>
                                </div>
                                <div id="visitors-donut-chart" style="height: 160px"></div>
                                <ul class="chart-legend">
                                    <li><i class="fa fa-circle-o fa-fw text-success m-r-5"></i> 86.0% <span>New Visitors</span></li>
                                    <li><i class="fa fa-circle-o fa-fw text-primary m-r-5"></i> 14.0% <span>Return Visitors</span></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="panel panel-inverse" data-sortable-id="index-1">
                            <div class="panel-heading">
                                <h4 class="panel-title">
                                    Visitors Origin
                                </h4>
                            </div>
                            <div id="visitors-map" class="bg-black" style="height: 181px;"></div>
                            <div class="list-group">
                                <a href="#" class="list-group-item list-group-item-inverse text-ellipsis">
                                    <span class="badge badge-success">87.95%</span>
                                    1. Sri Lanka 
                                </a> 
                                <a href="#" class="list-group-item list-group-item-inverse text-ellipsis">
                                    <span class="badge badge-primary">10.12%</span>
                                    2. India
                                </a>
                                <a href="#" class="list-group-item list-group-item-inverse text-ellipsis">
                                    <span class="badge badge-inverse">2.99%</span>
                                    3. United State
                                </a>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <!-- begin panel -->
                        <div class="panel panel-inverse" data-sortable-id="index-3">
                            <div class="panel-heading">
                                <h4 class="panel-title">Today's Schedule</h4>
                            </div>
                            <div id="schedule-calendar" class="bootstrap-calendar"></div>
                            <div class="list-group">
                                <a href="#" class="list-group-item text-ellipsis">
                                    <span class="badge badge-success">9:00 am</span> Sales Reporting
                                </a> 
                                <a href="#" class="list-group-item text-ellipsis">
                                    <span class="badge badge-primary">2:45 pm</span> Have a meeting with sales team
                                </a>
                            </div>
                        </div>
                        <!-- end panel -->
                    </div>

                </div>
                <!-- end row -->

            </div>
            <!-- end #content -->



            <!-- begin scroll to top btn -->
            <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>
            <!-- end scroll to top btn -->
        </div>
        <!-- end page container -->

        <!-- ================== BEGIN BASE JS ================== -->
        <script src="assets/plugins/jquery/jquery-1.9.1.min.js"></script>
        <script src="assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
        <script src="assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>
        
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/plugins/jquery-cookie/jquery.cookie.js"></script>
        <!-- ================== END BASE JS ================== -->

        <!-- ================== BEGIN PAGE LEVEL JS ================== -->
        <script src="assets/plugins/morris/raphael.min.js"></script>
        <script src="assets/plugins/morris/morris.js"></script>
        <script src="assets/plugins/jquery-jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
        <script src="assets/plugins/jquery-jvectormap/jquery-jvectormap-world-merc-en.js"></script>
        <script src="assets/plugins/bootstrap-calendar/js/bootstrap_calendar.min.js"></script>
        <script src="assets/js/ui-modal-notification.demo.min.js"></script>
        <script src="assets/plugins/gritter/js/jquery.gritter.js"></script>
        <script src="assets/js/dashboard-v2.min.js"></script>
        <script src="assets/js/apps.min.js"></script>
        <!-- ================== END PAGE LEVEL JS ================== -->

        <script>
            $(document).ready(function () {
                App.init();
                DashboardV2.init();
                Notification.init();
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

