<%@ include file="../config/sessionCheckAdmin.jsp" %>

<%
    
    ResultSet rs;
    rs = getCon().createStatement().executeQuery("SELECT c.first_name,c.last_name,sr.request_id,v.first_name,v.last_name,v.company_name,vp.title,vp.price from customer c inner join "
            + "service_request sr on c.customer_id=sr.customer_id inner join vendor v on sr.vendor_id=v.vendor_id inner join vendor_pricing vp on sr.pricing_id=vp.pricing_id where sr.status='completed' order by sr.request_id desc");

    String id = request.getParameter("txt");
    //String 

    getCon().createStatement().executeUpdate("Update service_request set status='viewed' where status='completed'");

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
            <%                String pageTitle = "store";
                String subPage = "checkouts";
            %>
            <%@ include file="static/navbar.jsp" %>

            <div id="content" class="content">

                <ol class="breadcrumb pull-right">
                    <li><a href="javascript:;">Home</a></li>
                    <li><a href="javascript:;">Customer</a></li>
                    <li><a href="javascript:;">Service Requests</a></li>
                    <li class="active"></li>
                </ol>

                <h1 class="page-header">Accepted Requests<small> Ordered by Latest</small></h1>
                <!-- end page-header -->

                <!-- begin row -->
                <div class="row">
                 
                    <div class="col-md-12">
                        <!-- begin panel -->
                        <div class="panel panel-inverse">
                            <div class="panel-heading">
                                
                                <h4 class="panel-title"> &nbsp;</h4>
                            </div>
                            <div class="panel-body">

                                <table id="data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th width="250">Customer</th>
                                            <th width="250">Vendor</th>
                                            <th width="250">Company</th>                               
                                            <th width="200">Pricing Plan</th>
                                            <th width="120">Amount</th>
                                            <th></th>
                                           
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% while (rs.next()) {%>
                                        <tr class="odd gradeX">
                                            <td><%= rs.getString("c.first_name") + " " + rs.getString("c.last_name")%></td>
                                            <td><%= rs.getString("v.first_name") + " " + rs.getString("v.last_name")%></td>
                                            <td><%= rs.getString("v.company_name")%></td>
                                            <td><%= rs.getString("vp.title")%></td>
                                            <td><%= rs.getString("vp.price")%></td>
                                            <td> 
                                                <form  method="get" action="" target="_blank">
                                                    <input type="hidden" id="txt" name="txt" value="<%= rs.getString("request_id")%>">
                                                    <button type="submit" class="btn btn-primary btn-sm" ><i class="fa fa-pencil-square-o"></i> View Invoice </button>                                                         
                                                </form>
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
        <!-- ================== END PAGE LEVEL JS ================== -->

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

