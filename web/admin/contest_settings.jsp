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
                    <li><a href="javascript:;">Couple Contest</a></li>
                    <li class="active">Settings</li>
                </ol>

                <h1 class="page-header">Configuration</h1>

                <div class="row">
                    <!-- begin col-12 -->
                    <div class="col-md-12">
                        <!-- begin panel -->
                        <div class="panel panel-inverse">



                            <div class="panel-body">
                                <div class="container" style="padding-left: 100px; padding-top: 50px;">
                                    <div class="row">
                                        <div class="form-group col-md-1">
                                            <label>State</label>
                                        </div>
                                        <div class="form-group col-md-1">
                                            <label><input id="mr" type="radio" name="title"> Active</label>
                                        </div>
                                        <div class="form-group col-md-1">
                                            <label><input id="miss" type="radio" name="title"> Inactive</label>
                                        </div>   
                                    </div>   
                                    <div class="row">
                                        <div class="form-group col-md-1">
                                            <label>Scheduling:</label>
                                        </div>
                                        <div class="form-group col-md-4">

                                            <select class="form-control" id="tradition" name="tradition">
                                                <option value="1" >1 Month</option>
                                                <option value="2" >2 Months</option>
                                                <option value="3" >3 Months</option>
                                                <option value="3" >6 Months</option>
                                            </select>
                                        </div>
                                        <div class="form-group col-md-1">
                                            <label>Date:</label>
                                        </div>

                                        <div class="form-group col-md-4">
                                            <input class="form-control" id="votes_allowed" name="votes_allowed" type="number">
                                        </div>
                                    </div>   
                                    <div class="row">
                                        <div class="form-group col-md-1">
                                            <label>Starting Time:</label>
                                        </div>

                                        <div class="form-group col-md-4">
                                            <input class="form-control" id="votes_allowed" name="votes_allowed" type="number">
                                        </div>
                                        <div class="form-group col-md-1">
                                            <label>Closing Time:</label>
                                        </div>

                                        <div class="form-group col-md-4">
                                            <input class="form-control" id="votes_allowed" name="votes_allowed" type="number">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-1">
                                            <label>Votes Allowed:</label>
                                        </div>
                                        <div class="form-group col-md-4">

                                            <input class="form-control" id="votes_allowed" name="votes_allowed" type="number">
                                        </div>
                                        <div class="form-group col-md-1">
                                            <label>Votes per Contestant:</label>
                                        </div>
                                        <div class="form-group col-md-4">

                                            <input class="form-control" id="votes_allowed" name="votes_allowed" type="number">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-1">
                                            <label>Number of Winners:</label>
                                        </div>
                                        <div class="form-group col-md-4">

                                            <input class="form-control" id="votes_allowed" name="votes_allowed" type="number">
                                        </div>
                                        <div class="form-group col-md-1">
                                            <label>No of Contestants:</label>
                                        </div>
                                        <div class="form-group col-md-4">

                                            <input class="form-control" id="votes_allowed" name="votes_allowed" type="number">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="form-group col-md-1">
                                            <label>Display:</label>
                                        </div>
                                        <div class="form-group col-md-1">
                                            <label><input id="mr" type="radio" name="title"> Positions</label>
                                        </div>
                                        <div class="form-group col-md-2">
                                            <label><input id="miss" type="radio" name="title"> Number of Votes</label>
                                        </div>  
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">

                            </div>

                            <br>
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


