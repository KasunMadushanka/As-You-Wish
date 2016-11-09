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

        <script src="myjs/backup.js"></script>

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

                <h1 class="page-header">Backup/Restore Data</h1>     

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
                            <div class="form-group" style="padding-top: 30px;"> 
                                <label class="control-label col-md-2">Dropbox Upload</label>    
                                <div class="col-md-4">
                                    <input id="display_positions" name="display_positions" type="checkbox" data-render="switchery" data-theme="default" checked style="position: relative;left:100px;" />
                                </div>
                                <label class="control-label col-md-2">Scheduled Backups</label>    
                                <div class="col-md-4">
                                    <input id="display_positions" name="display_positions" type="checkbox" data-render="switchery" data-theme="default" checked style="position: relative;left:100px;" />
                                </div>
                            </div>
                            <div class="form-group">                                  
                                <label class="control-label col-md-2">App Key</label>
                                <div class="col-md-4">
                                    <input id="limit_of_contestants" name="limit_of_contestants" type="number" value="" class="form-control"/>
                                </div>             
                                <label class="control-label col-md-2">Schedule</label>
                                <div class="col-md-4"> 
                                    <select class="form-control" id="service2_type" name="service2_type">
                                        <option value="" disabled selected hidden>Select Your Schedule</option>
                                        <option value="1" >6 hours</option>
                                        <option value="2" >12 hours</option>
                                        <option value="3" >24 hours</option>
                                        <option value="4" >48 hours</option>
                                        <option value="4" >72 hours</option> 
                                    </select>
                                </div>
                            </div>           
                            <div class="form-group">                             
                                <label class="control-label col-md-2">App Secret</label>
                                <div class="col-md-4">
                                    <input id="limit_of_contestants" name="limit_of_contestants" type="number" value="" class="form-control"/>
                                </div>
                                <label class="control-label col-md-2">Time</label>                                                  
                                <div class="input-group bootstrap col-md-4">
                                    <input id="timepicker" type="text" class="form-control" />
                                    <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                </div>     
                            </div>                         

                        </form>
                        <div class="form-group">                             
                            <div class="col-md-6" style="position: relative;left: 183px;padding-top: 15px;">
                                <button type="button" class="btn btn-sm btn-success">
                                    <i class="fa fa-upload"></i>
                                    <span>Upload Backup</span>
                                </button>     
                                <button type="button" class="btn btn-sm btn-success">

                                    <span>Apply Changes</span>
                                </button>    
                                <button type="button" class="btn btn-sm btn-success">

                                    <span>Reset to Default</span>
                                </button>                                  
                            </div>
                            <div class="col-md-6" style="position: relative;left: 305px;padding-top: 15px;">
                                <button type="button" class="btn btn-sm btn-success" onclick="update_contest_settings()">Apply Changes</button>
                                <button type="button" class="btn btn-sm btn-success" onclick="update_contest_settings()">Reset to Default</button>                           
                            </div>
                        </div>
                        <div class="form-group">                                                         
                            <div class=""  style="position: relative;left: 360px;padding-top: 60px;padding-bottom: 10px;">
                                <a class="btn btn-primary start" href="controllers/download_backup.jsp">
                                    <i class="fa fa-download"></i>
                                    <span>Download Backup</span>
                                </a>       
                                <button type="button" class="btn btn-primary start">
                                    <i class="fa fa-upload"></i>
                                    <span>Restore Backup</span>
                                </button> 
                            </div>
                        </div>
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


