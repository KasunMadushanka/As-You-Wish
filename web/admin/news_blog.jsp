<%@page import="java.util.Calendar"%>
<%@ include file="../config/sessionCheckAdmin.jsp" %>
<%
%>

<!DOCTYPE html>

<html lang="en">

    <head>
        <%@ include file="static/head.jsp" %>

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


                <div style="position: relative;top:-30 px;left:400px;padding-bottom: 50px;">
                    <a href="#modal-dialog" class="btn btn-sm btn-success" data-toggle="modal">Write New Post</a>
                </div>
                <!-- end page-header -->

                <!-- begin timeline -->
                <ul class="timeline">
                    <%for (int i = 0; i < 10; i++) {%>
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

        <div class="modal fade" id="modal-dialog">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <h4 class="modal-title">Write New Post</h4>
                    </div>
                    <div class="modal-body">
                        <img id="output"/>
                        <script>
                            var loadFile = function (event) {
                                var output = document.getElementById('output');
                                output.src = URL.createObjectURL(event.target.files[0]);
                            };
                        </script>
                        <div class="form-group">
                            <label for="form_title"><b>Subject</b></label>
                            <input id="form_title" name="form_title" class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label for="form_content"><b>Content</b></label>
                            <textarea id="form_content" name="form_content" class="form-control" rows="5"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <form id="form_upload_couple_blog">
                            <center><input id="image_url" type="file" class="filestyle" data-input="false" name="file" accept="image/*" onchange="loadFile(event)"></center>
                        </form>
                        <a href="javascript:;" class="btn btn-sm btn-white" data-dismiss="modal">Close</a>
                        <a href="javascript:;" class="btn btn-sm btn-success">Post</a>
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

