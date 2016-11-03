<%
    
    
    ResultSet rs = getCon().createStatement().executeQuery("Select c.first_name,c.partner_first_name,cn.votes, from customer c inner join contestant cnt on c.customer_id=cnt.customer_id inner join contest cn on cnt.contest_id=cn.contest_id where cn.month='"++"' and year='"++"'");
%>

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
        <link href="../assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css" rel="stylesheet" />
        <link href="../assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link href="../assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="../assets/css/animate.min.css" rel="stylesheet" />
        <link href="../assets/css/style.min.css" rel="stylesheet" />
        <link href="../assets/css/style-responsive.min.css" rel="stylesheet" />
        <link href="../assets/css/theme/default.css" rel="stylesheet" id="theme" />
        <!-- ================== END BASE CSS STYLE ================== -->

        <!-- ================== BEGIN PAGE LEVEL CSS STYLE ================== -->
        <link href="../assets/plugins/jquery-jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" />
        <link href="../assets/plugins/bootstrap-calendar/css/bootstrap_calendar.css" rel="stylesheet" />
        <link href="../assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" />
        <link href="../assets/plugins/morris/morris.css" rel="stylesheet" />
        <!-- ================== END PAGE LEVEL CSS STYLE ================== -->

        <!-- ================== BEGIN BASE JS ================== -->
        <script src="../assets/plugins/pace/pace.min.js"></script>
        <script src="../assets/sweetalert-dev.js"></script>
        <link rel="stylesheet" href="../assets/sweetalert.css">
        <!-- ================== END BASE JS ================== -->

    </head>

    <body>

        <!-- begin #page-container -->
        <div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
            <!-- begin #header -->
            <%@ include file="../static/header.jsp" %>
            <!-- end #header -->

            <!-- begin #sidebar -->
            <%@ include file="../static/navbar.jsp" %>
            <!-- end #sidebar -->

            <!-- begin #content -->
            <div id="content" class="content">
                <!-- begin breadcrumb -->
                <ol class="breadcrumb pull-right">
                    <li><a href="javascript:;">Home</a></li>
                    <li><a href="javascript:;">Online Store</a></li>
                    <li class="active">Checkouts</li>
                </ol>

                <h1 class="page-header">Contestants<small> November 2016</small></h1>
                <!-- end page-header -->

                <!-- begin row -->
                <div class="row">
                    <!-- begin col-12 -->
                    <div class="col-md-12">
                        <!-- begin panel -->
                        <div class="panel panel-inverse">
                            <div class="panel-heading">
                                <div class="panel-heading-btn">
                                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-default" data-click="panel-expand"><i class="fa fa-expand"></i></a>
                                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-success" data-click="panel-reload"><i class="fa fa-repeat"></i></a>
                                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-warning" data-click="panel-collapse"><i class="fa fa-minus"></i></a>
                                    <a href="javascript:;" class="btn btn-xs btn-icon btn-circle btn-danger" data-click="panel-remove"><i class="fa fa-times"></i></a>
                                </div>
                                <h4 class="panel-title"> &nbsp;</h4>
                            </div>
                            <div class="panel-body">

                                <table id="data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Couple</th>
                                            <th>Wedding Date</th>
                                            <th>Mobile</th>
                                            <th>Email</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%while (rs.next()) {%>
                                        <tr class="odd gradeX">
                                            <td><%= rs.getString("first_name") + " & " + rs.getString("partner_first_name")%></td>
                                            <td><%= rs.getString("event_date")%></td>
                                            <td><%= rs.getString("mobile")%></td>
                                            <td><%= rs.getString("email")%></td>
                                            <td>                                                                      
                                                <button type="button" class="btn btn-primary btn-sm" ><i class="fa fa-pencil-square-o"></i> Contact </button>                                                                                          
                                            </td>
                                        </tr>
                                        <%
                                            }
                                        %>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                    </div>

                </div>

            </div>  

            <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i class="fa fa-angle-up"></i></a>

        </div>

        <script src="../assets/plugins/jquery/jquery-1.9.1.min.js"></script>
        <script src="../assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
        <script src="../assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
        <script src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>

        <script src="../assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="../assets/plugins/jquery-cookie/jquery.cookie.js"></script>

        <script src="../assets/plugins/DataTables/media/js/jquery.dataTables.js"></script>
        <script src="../assets/plugins/DataTables/media/js/dataTables.bootstrap.min.js"></script>
        <script src="../assets/plugins/DataTables/extensions/Responsive/js/dataTables.responsive.min.js"></script>
        <script src="../assets/js/table-manage-default.demo.min.js"></script>
        <script src="../assets/js/apps.min.js"></script>

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


