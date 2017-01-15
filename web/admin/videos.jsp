<%@ include file="../config/sessionCheckAdmin.jsp" %>


<%
    
    
    
    ResultSet rs;
    rs = getCon().createStatement().executeQuery("SELECT video.*, customer.first_name ,customer.last_name,"
            + " customer.partner_first_name, customer.partner_last_name	FROM `video` "
            + "inner join customer on `cust_Id` = customer_id");
        
    
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
                    String subPage = "links";
                %>
                <%@ include file="static/navbar.jsp" %>
                <!-- end #sidebar -->

            <!-- begin #content -->
            <div id="content" class="content">
                <!-- begin breadcrumb -->
                <ol class="breadcrumb pull-right">
                    <li><a href="javascript:;">Home</a></li>
                    <li><a href="javascript:;">Video</a></li>
                    <li class="active">Videos Links</li>
                </ol>

                <h1 class="page-header">Wedding Video Links<small> </small></h1>
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
                                            <th>Link</th>
                                            <th>Preview</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%while (rs.next()) {
                                            String Link ="http://localhost:8084/AsYouWish/video.jsp?" 
                                                    +rs.getString("cust_Id")
                                                    +"?"+rs.getString("MaleName")
                                                    +"?"+rs.getString("FemaleName")
                                                    +"?"+rs.getString("title")
                                                    +"?"+rs.getString("text")
                                                    +"?"+rs.getString("imgCount")
                                                    +""+rs.getString("images");
                                            
                                            String Link2 ="" 
                                                    +rs.getString("cust_Id")
                                                    +"?"+rs.getString("MaleName")
                                                    +"?"+rs.getString("FemaleName")
                                                    +"?"+rs.getString("title")
                                                    +"?"+rs.getString("text")
                                                    +"?"+rs.getString("imgCount")
                                                    +""+rs.getString("images");
                                                    
                                        %>
                                        <tr class="odd gradeX"> 
                                            <td> <%= rs.getString("first_name")+" "+rs.getString("last_name")+" & "+rs.getString("partner_first_name")+" "+rs.getString("partner_last_name") %> </td>        
                                            <td> <%= Link %> </td>
                                            <td>
                                                <a href="<%= Link %>" ><button  class="btn btn-success btn-sm"><i class="fa fa-youtube-play"></i> Preview</button></a>
                                            </td>
                                            <td>  
                                                <form  method="get"  >
                                                    <input type="hidden" id="txt" name="txt" value="<%= rs.getString("cust_Id")%>">
                                                    <button type="submit" name="delCat" id="mf2"  onclick="return confirm('Are you sure you want to delete ?');" class="btn btn-warning btn-sm"><i class="fa fa-trash-o"></i> Delete</button>                                                                                         
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
                                    
        <%
        
        
        
            if (request.getParameter("delCat") != null) {
                String id = request.getParameter("txt");
                Statement stx = getCon().createStatement();
                int i2 = stx.executeUpdate("delete from video where cust_Id = '" + id + "'");

                if (i2 == 1) {
                    out.print("<script>swal({  title: 'Video Deleted!', text: '', type: 'success', confirmButtonText: 'Done!'}, function(){ window.location.href='videos.jsp'; });</script>");

                } else {
                    response.sendRedirect("../admin/error.jsp");
                }

            }
        
        
        
        
        
        
        %> 

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

