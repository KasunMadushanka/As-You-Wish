
<%
    ResultSet rs;
    String sql = "SELECT * FROM `chat` where user ='1'";
    rs = getCon().createStatement().executeQuery(sql);


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
                    <li class="active">Chat Room</li>
                </ol>
                <!-- end breadcrumb -->
                <!-- begin page-header -->
                <h1 class="page-header">Chat Room <small></small></h1>
                <!-- end page-header -->

                <!-- begin row -->
                <div class="row">
                    <!-- begin col-12 -->
                    <div class="col-md-12">
                        <!-- begin panel -->
                        <div class="col-md-4" style="background: white">
                            <tr>
                                <td class="email-sender" style="vertical-align:center;">
                                    <br>
                                    <a class="image"><img alt="" src="assets/img/asd2.png" /></a> &nbsp;&nbsp; | &nbsp;&nbsp;
                                    <a href="">TEST 123</a>
                                    <hr>
                                </td>
                            </tr>
                        </div>
                        <div class="col-md-8">
                            <!-- begin panel -->
                            <div class="panel panel-inverse" data-sortable-id="index-2">
                                <div class="panel-heading">
                                    <h4 class="panel-title">Chat History - Test123 </h4>
                                </div>
                                <div class="panel-body bg-silver">
                                    <div data-scrollbar="true" data-height="450px">
                                        <ul class="chats">
                                            <% while (rs.next()) {
                                                                     if (Integer.parseInt(rs.getString("sendId")) == 0) {%>

                                            <li class="right">
                                                <span class="date-time"><%= rs.getString("time")%></span>
                                                <a href="javascript:;" class="name">Admin</a>
                                                <a href="javascript:;" class="image"><img alt="" src="assets/img/user-10.jpg" /></a>
                                                <div class="message">
                                                    <%= rs.getString("msg")%>
                                                </div>
                                            </li>

                                            <% } else {%>

                                            <li class="left">
                                                <span class="date-time"><%= rs.getString("time")%></span>
                                                <a href="javascript:;" class="name">Test 123</a>
                                                <a href="javascript:;" class="image"><img alt="" src="assets/img/asd2.png" /></a>
                                                <div class="message">
                                                    <%= rs.getString("msg")%>
                                                </div>
                                            </li>

                                            <% }

                                                                     }%>

                                        </ul>
                                    </div>
                                </div>
                                <div class="panel-footer">
                                    <form name="send_message_form" data-id="message-form">
                                        <div class="input-group">
                                            <input type="text" class="form-control input-sm" id="msg" name="message" placeholder="Enter your message here.">
                                            <span class="input-group-btn">
                                                <button class="btn btn-primary btn-sm" id="sendMsg" type="button">Send</button>
                                            </span>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- end panel -->
                        </div>
                        <!-- end panel -->
                    </div>
                    <!-- end col-12 -->
                </div>
                <!-- end row -->
            </div>
            <!-- end #content -->

            <!-- ###############################################          Model     ###################################################################################################################-->         

            <!-- ###############################################          Model     ###################################################################################################################-->         







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
        <!--[if lt IE 9]>
                <script src="assets/crossbrowserjs/html5shiv.js"></script>
                <script src="assets/crossbrowserjs/respond.min.js"></script>
                <script src="assets/crossbrowserjs/excanvas.min.js"></script>
        <![endif]-->
        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/plugins/jquery-cookie/jquery.cookie.js"></script>
        <!-- ================== END BASE JS ================== -->

        <!-- ================== BEGIN PAGE LEVEL JS ================== -->
        <script src="assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>
        <script src="assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
        <script src="assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
        <script src="assets/js/table-manage-default.demo.min.js"></script>
        <script src="assets/js/apps.min.js"></script>
        <!-- ================== END PAGE LEVEL JS ================== -->

        <script>
            $(document).ready(function () {
                App.init();
                TableManageDefault.init();
            });
            $('#myModal1').modal({
                show: true
            });
            $('#myModal3').modal({
                show: true
            });


            $("#sendMsg").click(function () {
                var c = $("#msg").val()
                //alert(c)
                $.ajax({
                    type: "post",
                    url: "../controllers/insertChat.jsp",
                    data: {msg2: c},
                    success: function (msg) {
                        //alert(msg)
                        location.reload();
                    },
                    error: function (error) {
                        //alert("Error")

                    }
                });
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

    <!-- Mirrored from seantheme.com/color-admin-v1.9/admin/html/table_manage.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 19 Oct 2015 11:23:32 GMT -->
</html>

