<%@page import="java.util.Calendar"%>
<%@ include file="../config/sessionCheckAdmin.jsp" %>
<%
%>

<!DOCTYPE html>

<html lang="en">

    <head>
        <%@ include file="static/head.jsp" %>

        <link href="assets/plugins/switchery/switchery.min.css" rel="stylesheet" />

        <link href="assets/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" />
        <link href="assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" />
        <link href="assets/plugins/ionRangeSlider/css/ion.rangeSlider.css" rel="stylesheet" />
        <link href="assets/plugins/ionRangeSlider/css/ion.rangeSlider.skinNice.css" rel="stylesheet" />
        <link href="assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet" />
        <link href="assets/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" />
        <link href="assets/plugins/password-indicator/css/password-indicator.css" rel="stylesheet" />
        <link href="assets/plugins/bootstrap-combobox/css/bootstrap-combobox.css" rel="stylesheet" />
        <link href="assets/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
        <link href="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css" rel="stylesheet" />
        <link href="assets/plugins/jquery-tag-it/css/jquery.tagit.css" rel="stylesheet" />
        <link href="assets/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" />
        <link href="assets/plugins/select2/dist/css/select2.min.css" rel="stylesheet" />
        <link href="assets/plugins/bootstrap-eonasdan-datetimepicker/build/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />

        <script src="myjs/contest.js"></script>

    </head>

    <body>

        <!-- begin #page-container -->
        <div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
            <!-- begin #header -->
            <%@ include file="static/header.jsp" %>
            <!-- end #header -->

            <!-- begin #sidebar -->
            <%
                    String pageTitle = "contest";
                    String subPage = "setting";
            %>
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

                <h1 class="page-header">Couple Contest Configuration</h1>     

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
                                <label class="control-label col-md-2">Contest Title</label>
                                <div class="col-md-4">
                                    <input id="contest_title" name="contest_title" type="text" class="form-control" />
                                </div>
                                <label class="control-label col-md-2">Schedule</label>            
                                <div class="col-md-2">
                                    <input type="text" class="form-control"  id="datetimepicker3" placeholder="Min Date" />
                                </div>
                                <div class="col-md-2">
                                    <input type="text" class="form-control"  id="datetimepicker4" placeholder="Max Date" />
                                </div>                             
                            </div>           
                            <div class="form-group">
                                <label class="control-label col-md-2">Applications Accepting</label>
                                <div class="col-md-4">
                                    <div class="input-group input-daterange">
                                        <input id="applications_from" name="start" type="text" class="form-control" placeholder="Date Start" />
                                        <span class="input-group-addon">to</span>
                                        <input id="applications_to" name="end" type="text" class="form-control" placeholder="Date End" />
                                    </div>
                                </div>
                                <label class="control-label col-md-2">Limit of Contestants</label>
                                <div class="col-md-4">
                                    <input id="limit_of_contestants" name="limit_of_contestants" type="number" value="" class="form-control"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-md-2">Maximum No of Votes<br>(One Account)</label>
                                <div class="col-md-4">
                                    <input id="max_votes" name="max_votes" type="number" value="" class="form-control"/>
                                </div>
                                <label class="control-label col-md-2">Votes per Contestant<br>(One Account)</label>
                                <div class="col-md-4">
                                    <input id="votes_per_contestant" name="votes_per_contestant" type="number" value="" class="form-control"/>
                                </div>
                            </div>  
                            <div class="form-group">
                                <label class="control-label col-md-2">Display Positions</label>
                                <div class="col-md-1">
                                    <input id="display_positions" name="display_positions" type="checkbox" data-render="switchery" data-theme="default" checked style="position: relative;left:100px;" />
                                </div>
                                <label class="control-label col-md-2">Display Total Votes</label>
                                <div class="col-md-1">
                                    <input id="display_votes" name="display_votes" type="checkbox" data-render="switchery" data-theme="default" checked style="position: relative;left:100px;" />
                                </div>
                                <div class="col-md-6" style="position: relative;left: 183px;">
                                    <button type="button" class="btn btn-sm btn-success" onclick="update_contest_settings()">Apply Changes</button>
                                    <button type="button" class="btn btn-sm btn-success" onclick="host_contest()">Host New Contest</button>
                                    <button type="button" class="btn btn-sm btn-success" onclick="discard_contest()">Discard Contest</button>
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

        <script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
        <script src="assets/plugins/ionRangeSlider/js/ion-rangeSlider/ion.rangeSlider.min.js"></script>
        <script src="assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
        <script src="assets/plugins/masked-input/masked-input.min.js"></script>
        <script src="assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
        <script src="assets/plugins/password-indicator/js/password-indicator.js"></script>
        <script src="assets/plugins/bootstrap-combobox/js/bootstrap-combobox.js"></script>
        <script src="assets/plugins/bootstrap-select/bootstrap-select.min.js"></script>
        <script src="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>
        <script src="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput-typeahead.js"></script>
        <script src="assets/plugins/jquery-tag-it/js/tag-it.min.js"></script>
        <script src="assets/plugins/bootstrap-daterangepicker/moment.js"></script>
        <script src="assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
        <script src="assets/plugins/select2/dist/js/select2.min.js"></script>
        <script src="assets/plugins/bootstrap-eonasdan-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>



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
        <script src="assets/js/jquery.rustaMsgBox.js"></script>
    </body>

</html>


