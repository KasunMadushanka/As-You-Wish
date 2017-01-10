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

        <link href="assets/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet" />
        <link href="assets/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet" />
        <link href="assets/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" />

        <link href="assets/plugins/jquery-file-upload/blueimp-gallery/blueimp-gallery.min.css" rel="stylesheet" />
        <link href="assets/plugins/jquery-file-upload/css/jquery.fileupload.css" rel="stylesheet" />
        <link href="assets/plugins/jquery-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" />

        <script src="assets/plugins/jquery/jquery-1.9.1.min.js"></script>
        <script src="myjs/backup.js"></script>

    </head>

    <body>

        <!-- begin #page-container -->
        <div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
            <!-- begin #header -->
            <%@ include file="static/header.jsp" %>
            <!-- end #header -->

            <!-- begin #sidebar -->
            <%
               String pageTitle = "backup";
               String subPage = "";
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
                            <%ResultSet rs = getCon().createStatement().executeQuery("Select* from backup_settings");
                                if (rs.first()) {%> 

                            <div class="form-group" style="padding-top: 30px;"> 
                                <label class="control-label col-md-2">Dropbox Upload</label>    
                                <div class="col-md-4">
                                    <input id="dropbox_status" name="dropbox_status" type="checkbox" data-render="switchery" data-theme="default" style="position: relative;left:100px;" />
                                </div>
                                <label class="control-label col-md-2">Scheduled Backups</label>    
                                <div class="col-md-4">
                                    <input id="backup_status" name="backup_status" type="checkbox" data-render="switchery" data-theme="default" style="position: relative;left:100px;" />
                                </div>
                                <script>
                                    if ('<%=rs.getString("dropbox_status")%>' === 'true') {
                                        $('#dropbox_status').prop('checked', true);
                                    }
                                    if ('<%=rs.getString("backup_status")%>' === 'true') {
                                        $('#backup_status').prop('checked', true);
                                    }
                                </script>
                            </div>
                            <div class="form-group">                                  
                                <label class="control-label col-md-2">App Key</label>
                                <div class="col-md-4">
                                    <input id="dropbox_app_key" name="dropbox_app_key" type="text" value="<%=rs.getString("dropbox_app_key")%>" class="form-control"/>
                                </div>             
                                <label class="control-label col-md-2">Schedule</label>
                                <div class="col-md-4"> 

                                    <select class="form-control" id="backup_schedule" name="backup_schedule">

                                        <option value="1" >1 hour</option>
                                        <option value="2" >3 hours</option>
                                        <option value="3" >6 hours</option>
                                        <option value="4" >12 hours</option>
                                        <option value="5" >24 hours</option> 
                                        <option value="6" >48 hours</option> 
                                    </select>
                                    <script>
                                        $('#backup_schedule').val('<%=rs.getString("backup_schedule")%>');
                                    </script>
                                </div>
                            </div>           
                            <div class="form-group">                             
                                <label class="control-label col-md-2">App Secret</label>
                                <div class="col-md-4">
                                    <input id="dropbox_app_secret" name="dropbox_app_secret" type="text" value="<%=rs.getString("dropbox_app_secret")%>" class="form-control"/>
                                </div>
                                <label class="control-label col-md-2">Backup Path</label>
                                <div class="col-md-4">

                                    <input id="backup_path" type="text" value="<%=rs.getString("backup_path")%>" class="form-control" />

                                </div>
                            </div>    
                    </div>          
                    <%}%>
                    </form>
                    <div class="form-group">                             
                        <div class="col-md-6" style="position: relative;left: 295px;padding-top: 15px;">
                            <button type="button" class="btn btn-sm btn-success" onclick="$('#modal-dropbox-connection').modal('show');window.open('controllers/dropbox_connection.jsp');">
                                <i class="fa fa-upload"></i>
                                <span>Upload Backup</span>
                            </button>     
                            <button type="button" class="btn btn-sm btn-success" onclick="update_dropbox_settings()">

                                <span>Apply Changes</span>
                            </button>                             
                        </div>
                        <div class="col-md-6" style="position: relative;left: 305px;padding-top: 15px;">
                            <button type="button" class="btn btn-sm btn-success" onclick="update_backup_settings()">Apply Changes</button>
                            <button type="button" class="btn btn-sm btn-success" onclick="reset_backup_settings()">Reset to Default</button>                           
                        </div>
                    </div>
                    <legend style="padding-top: 20px;"></legend>
                    <center><div class="form-group">                                                         
                        <div class=""  style="padding-bottom: 15px;">
                            <a class="btn btn-primary start" href="controllers/download_backup.jsp">
                                <i class="fa fa-download"></i>
                                <span>Download Backup</span>
                            </a>       
                            <span class="btn btn-primary fileinput-button">
                                <i class="fa fa-upload"></i>
                                <span>Restore Backup</span>
                                <input type="file" id="backup_file" name="backup_file">
                            </span>
                            <script>
                                function create_backup() {

                                    $.ajax({
                                        type: "post",
                                        url: "../BackupRestoreDatabase",
                                        data: "status=" + "backup",
                                        success: function (msg) {
                                            //image_upload(status);
                                        },
                                        error: function (error) {
                                            alert(error);

                                        }
                                    });

                                }

                                $("#backup_file").change(function () {

                                    $.ajax({
                                        type: "post",
                                        url: "../BackupRestoreDatabase",
                                        data: "status=" + "restore" + "&file=" + $('#backup_file').serialize(),
                                        success: function (msg) {
                                            //image_upload(status);
                                        },
                                        error: function (error) {
                                            alert(error);

                                        }
                                    });
                                });
                            </script>
                        </div>

                    </div></center>
                </div>

            </div>

        </div>

    </div>

    <div class="modal fade" id="modal-dropbox-connection">
        <div id="modal-comments" class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">Paste the code here</h4>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal form-bordered">
                        <div class="form-group" style="padding-top: 10px;">                              
                            <label class="control-label col-md-1">Code</label>
                            <div class="col-md-9">
                                <input id="dropbox_access_code" name="dropbox_access_code" type="text" class="form-control" />
                            </div>
                            <div class="col-md-2">
                                <button type="button" class="btn btn-sm btn-success" onclick="$('#modal-dropbox-connection').modal('hide');
                                        dropbox_upload();">
                                    <span>Submit</span>
                                </button>    
                            </div>
                        </div>   
                    </form>
                </div>
            </div>
        </div>
    </div>

    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>



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

    <script src="assets/plugins/jquery-file-upload/js/vendor/jquery.ui.widget.js"></script>
    <script src="assets/plugins/jquery-file-upload/js/vendor/tmpl.min.js"></script>
    <script src="assets/plugins/jquery-file-upload/js/vendor/load-image.min.js"></script>
    <script src="assets/plugins/jquery-file-upload/js/vendor/canvas-to-blob.min.js"></script>
    <script src="assets/plugins/jquery-file-upload/blueimp-gallery/jquery.blueimp-gallery.min.js"></script>
    <script src="assets/plugins/jquery-file-upload/js/jquery.iframe-transport.js"></script>
    <script src="assets/plugins/jquery-file-upload/js/jquery.fileupload.js"></script>
    <script src="assets/plugins/jquery-file-upload/js/jquery.fileupload-process.js"></script>
    <script src="assets/plugins/jquery-file-upload/js/jquery.fileupload-image.js"></script>
    <script src="assets/plugins/jquery-file-upload/js/jquery.fileupload-audio.js"></script>
    <script src="assets/plugins/jquery-file-upload/js/jquery.fileupload-video.js"></script>
    <script src="assets/plugins/jquery-file-upload/js/jquery.fileupload-validate.js"></script>
    <script src="assets/plugins/jquery-file-upload/js/jquery.fileupload-ui.js"></script>
    <script src="assets/js/form-multiple-upload.demo.min.js"></script>

    <script src="assets/js/form-plugins.demo.min.js"></script>
    <script src="assets/js/apps.min.js"></script>

    <script>
                                    $(document).ready(function () {
                                        App.init();
                                        FormSliderSwitcher.init();
                                        FormPlugins.init();
                                        FormMultipleUpload.init();
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


