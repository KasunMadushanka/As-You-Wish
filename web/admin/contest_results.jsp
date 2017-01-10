<%@ include file="../config/sessionCheckAdmin.jsp" %>
<%
    
    

    ResultSet rs = getCon().createStatement().executeQuery(""
            + "Select cnt.contest_id,c.first_name,c.partner_first_name,CONCAT(cn.year, '-',cn.month) as mon,cnt.votes "
            + "from customer c "
            + "inner join contestant cnt on c.customer_id=cnt.customer_id "
            + "inner join contest cn on cnt.contest_id=cn.contest_id "
            + "order by mon,cnt.votes desc");
    
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
            <%
                    String pageTitle = "contest";
                    String subPage = "results";
            %>
            <%@ include file="static/navbar.jsp" %>
            <!-- end #sidebar -->

            <!-- begin #content -->
            <div id="content" class="content">
                <!-- begin breadcrumb -->
                <ol class="breadcrumb pull-right">
                    <li><a href="javascript:;">Home</a></li>
                    <li><a href="javascript:;">Contest</a></li>
                    <li class="active">All Results</li>
                </ol>

                <h1 class="page-header">Contestants<small> results sorted by votes</small></h1>
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
                                            <th style="width: 200px;">Contest Month</th>
                                            <th style="width: 500px;">Couple</th>
                                            
                                            <th style="width: 100px;">Votes</th>
                                            <th style="width: 100px;">Percentage</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%  int i = 0;
                                            
                                            
                                                while (rs.next()) {
                                                    String ConId = rs.getString("cnt.contest_id");
                                                    ResultSet rs1 = getCon().createStatement().executeQuery("Select sum(votes) as total_votes from contestant where `contest_id` = '"+ConId+"'");
                                                    String Tot = "1";
                                                    if (rs1.first()) {
                                                        Tot = rs1.getString("total_votes");
                                                    }
                                                    
                                        %>
                                        <tr class="odd gradeX">
                                            <td><%= rs.getString("mon")%></td>
                                            <td><%= rs.getString("c.first_name") + " & " + rs.getString("c.partner_first_name")%></td> 
                                            
                                            <td><%= rs.getString("cnt.votes")%></td>
                                            <td><%=Math.round(Double.parseDouble(rs.getString("cnt.votes"))/Double.parseDouble(Tot)*100)+"%"%></td>
                                            <td>                                                                      
                                                <button type="button" class="btn btn-primary btn-sm" > Contact </button>                                                                                          
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


