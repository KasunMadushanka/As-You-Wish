<%@ include file="../config/sessionCheckAdmin.jsp" %>


<%
    ResultSet rs = getCon().createStatement().executeQuery("SELECT customer_id,first_name,partner_first_name,email,event_date "
            + "FROM `customer` WHERE confirmed='yes' and `customer_id` NOT IN ( SELECT cust_Id FROM video)");
   
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <%@ include file="static/head.jsp" %>
    </head>

    <body>

        <!-- begin #page-container -->
        <div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
            <%@ include file="static/header.jsp" %>
                <!-- end #header -->

                <!-- begin #sidebar -->
                <%
                    String pageTitle = "video";
                    String subPage = "setting_video";
                %>
                <%@ include file="static/navbar.jsp" %>
                <!-- end #sidebar -->

            <!-- begin #content -->
            <div id="content" class="content">
                <!-- begin breadcrumb -->
                <ol class="breadcrumb pull-right">
                    <li><a href="javascript:;">Home</a></li>
                    <li><a href="javascript:;">Video</a></li>
                    <li class="active">Up Coming Events</li>
                </ol>

                <h1 class="page-header">Weddings<small> </small></h1>
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
                                            <th>Email</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%while (rs.next()) {%>
                                        <tr class="odd gradeX"> 
                                            <% 
                                                String rsDate = rs.getString("event_Date");
                                                String rsName = rs.getString("first_name") + " & " + rs.getString("partner_first_name");
                                                String rsEmail = rs.getString("email");
                                            
                                                if (today.equals(rsDate)){ 
                                                    rsDate = "<p style='color: red'> <b>"+ rsDate+"</b></p>";
                                                    rsName = "<p style='color: red'> <b>"+ rsName+"</b></p>";
                                                    rsEmail = "<p style='color: red'> <b>"+ rsEmail+"</b></p>";
                                            %>
                                                <td> <%= rsName %> </td>        
                                                <td> <%= rsDate %> </td>
                                                <td> <%= rsEmail %> </td>   
                                            <% } else { %>
                                                <td><%= rsName %></td>
                                                <td> <%=rsDate %> </td>   
                                                <td><%= rsEmail %></td>
                                            <% } %>   
                                             
                                            <td>  
                                                <form  method="post" action="video_settings.jsp?id=<%= rs.getString("customer_id")%>">
                                                    
                                                    <button type="submit" class="btn btn-primary btn-sm" ><i class="fa fa-cog"></i> Settings </button>                                                                                         
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

