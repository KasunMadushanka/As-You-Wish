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

        <link rel="stylesheet" href="assets/css/switch/bootstrap-switch.css">
        <link rel="stylesheet" href="assets/css/switch/bootstrap-switch.min.css">

        <script src="assets/js/switch/bootstrap-switch.js"></script>
        <script src="assets/js/switch/bootstrap-switch.min.js"></script>
        

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

                <h1 class="page-header">Configuration</h1>

                <div class="row">
                    <!-- begin col-12 -->
                    <div class="col-md-12">
                        <!-- begin panel -->
                        <div class="panel panel-inverse">
                            <input type="checkbox" name="my-checkbox" checked>
                            <script>
                                $("[name='my-checkbox']").bootstrapSwitch();
                            </script>

                            <select class="form-control" id="service1_type" name="service1_type">
                                <option value="" disabled selected hidden>Duration</option>
                                <option value="1" >24 Hour</option>
                                <option value="2" >12 Hour</option>
                                <option value="3" >6 Hour</option>                          
                            </select>
                            <div class="panel-body">
                                <div class="form-group m-b-15">
                                    <input type="text" class="form-control input-lg" placeholder="Email Address" id="email" />
                                </div>
                                <div class="form-group m-b-15">
                                    <input type="password" class="form-control input-lg" placeholder="Password" id="password" />
                                </div>
                                <div class="checkbox m-b-30">
                                    <label>
                                        <input type="checkbox" id="rememberMe" /> Remember Me
                                    </label>
                                </div>
                                <div class="login-buttons">
                                    <button type="button" id="logIn" class="btn btn-success btn-block btn-lg" onclick="admin_login()">Sign me in</button>
                                </div>
                                <br>
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


