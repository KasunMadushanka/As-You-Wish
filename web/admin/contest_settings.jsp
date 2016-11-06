<%@page import="java.util.Calendar"%>
<%@ include file="../config/sessionCheckAdmin.jsp" %>
<%    Calendar now = Calendar.getInstance();
    int year = now.get(Calendar.YEAR);
    int month = now.get(Calendar.MONTH) + 1;

    ResultSet rs = getCon().createStatement().executeQuery("Select c.first_name,c.partner_first_name,cnt.votes from customer c inner join contestant cnt on c.customer_id=cnt.customer_id inner join contest cn on cnt.contest_id=cn.contest_id where cn.month='" + month + "' and cn.year='" + year + "' order by cnt.votes desc");
    ResultSet rs1 = getCon().createStatement().executeQuery("Select sum(votes) as total_votes from contestant where contest_id=(Select contest_id from contest where month='" + month + "' and year='" + year + "')");
%>

<!DOCTYPE html>

<html lang="en">

    <head>
        <%@ include file="static/head.jsp" %>

        <link href="assets/plugins/switchery/switchery.min.css" rel="stylesheet" />
        <link href="assets/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" />
        <link href="assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" />
        <link href="assets/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" />
        <link href="assets/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" />

        <script src="assets/plugins/pace/pace.min.js"></script>
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

                <h1 class="page-header">Configuration  <input type="checkbox" data-render="switchery" data-theme="default" checked style="position: relative;left:100px;" /></h1>     



                <div class="panel panel-inverse">
                    <div class="panel-heading">
                        <div class="panel-heading-btn">
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                            <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                        </div>
                        <h4 class="panel-title">Couple Contest Settings </h4>
                    </div>
                    <div class="panel-body panel-form">
                        <form class="form-horizontal form-bordered">
                            <div class="form-group" style="padding-top: 30px;">                              
                                <label class="control-label col-md-2">Selected Duration</label>
                                <div class="col-md-4">
                                    <select class="form-control" id="schedule" name="schedule">
                                        <option value="1" >1 Month</option>
                                        <option value="2" >2 Months</option>
                                        <option value="3" >3 Months</option>
                                        <option value="3" >6 Months</option>
                                    </select>
                                </div>
                                <label class="control-label col-md-2">Scheduled Date</label>
                                <div class="col-md-4">
                                    <input type="text" class="form-control" id="datepicker-autoClose" placeholder="Select Date" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2">Starting Time</label>
                                <div class="col-md-4">
                                    <div class="input-group bootstrap-timepicker">
                                        <input id="timepicker" type="text" class="form-control" />
                                        <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                    </div>
                                </div>
                                <label class="control-label col-md-2">Closing Time</label>
                               <div class="col-md-4">
                                    <div class="input-group bootstrap-timepicker">
                                        <input id="timepicker2" type="text" class="form-control" />
                                        <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2">Scheduled Date</label>
                                <div class="col-md-4">
                                    <div class="input-group input-daterange">
                                        <input type="text" class="form-control" name="start" placeholder="Date Start" />
                                        <span class="input-group-addon">to</span>
                                        <input type="text" class="form-control" name="end" placeholder="Date End" />
                                    </div>
                                </div>
                                <label class="control-label col-md-2">Limit of Contestants</label>
                                <div class="col-md-4">
                                    <input type="number" value="" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2">Maximum No of Votes<br>(One Account)</label>
                                <div class="col-md-4">
                                    <input type="number" value="" class="form-control" id="colorpicker" />
                                </div>
                                <label class="control-label col-md-2">Votes per Contestant<br>(One Account)</label>
                                <div class="col-md-4">
                                    <input type="number" value="" class="form-control"/>
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

        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/plugins/jquery-cookie/jquery.cookie.js"></script>
        <!-- ================== END BASE JS ================== -->

        <!-- ================== BEGIN PAGE LEVEL JS ================== -->
        <script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="assets/plugins/ionRangeSlider/js/ion-rangeSlider/ion.rangeSlider.min.js"></script>
        <script src="assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
        <script src="assets/plugins/masked-input/masked-input.min.js"></script>
        <script src="assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
        <script src="assets/plugins/bootstrap-daterangepicker/moment.js"></script>
        <script src="assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>

        <script src="assets/js/form-plugins.demo.min.js"></script>
        <script src="assets/js/apps.min.js"></script>

        <script>
            $(document).ready(function () {
                App.init();
                FormSliderSwitcher.init();
                FormPlugins.init();
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


