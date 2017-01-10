<%@ include file="../config/sessionCheckAdmin.jsp" %>

<%

    ResultSet rs;
    rs = getCon().createStatement().executeQuery("SELECT * FROM `supplier`");

    String id = request.getParameter("txt");
    //String 


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
                    String pageTitle = "store";
                    String subPage = "sup";
            %>
            <%@ include file="static/navbar.jsp" %>
            <!-- end #sidebar -->

            <!-- begin #content -->
            <div id="content" class="content">
                <!-- begin breadcrumb -->
                <ol class="breadcrumb pull-right">
                    <li><a href="javascript:;">Home</a></li>
                    <li><a href="javascript:;">Online Store</a></li>
                    <li class="active">Suppliers</li>
                </ol>
                <!-- end breadcrumb -->
                <!-- begin page-header -->
                <h1 class="page-header">All Suppliers<small> </small></h1>
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
                                <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#myModal2"><i class="fa fa-plus"></i>  Add New Supplier</button><br><br>

                                <table id="data-table" class="table table-striped table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Supplier Name</th>
                                            <th>Address</th>
                                            <th>Contact No</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%                                        while (rs.next()) {%>
                                        <tr class="odd gradeX">
                                            <td><%= rs.getString("sName")%></td>
                                            <td><%= rs.getString("sAdd")%></td>
                                            <td><%= rs.getString("sTel")%></td>

                                            <td> 
                                                <form  method="post">
                                                    <input type="hidden" id="txt" name="txt" value="<%= rs.getString("sId")%>">
                                                    <button type="submit" name="editCat" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal1" ><i class="fa fa-pencil-square-o"></i> Edit</button>                                                         
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
                        <!-- end panel -->
                    </div>
                    <!-- end col-12 -->
                </div>
                <!-- end row -->
            </div>
            <!-- end #content -->

            <!-- ###############################################          Model     ###################################################################################################################-->         
            <div class="modal fade" id="myModal2" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Insert New Supplier</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <!-- begin col-6 -->
                                <div class="col-md-12">
                                    <!-- begin panel -->
                                    <div class="panel panel-inverse" data-sortable-id="form-validation-1">
                                        <div class="panel-body panel-form">
                                            <form class="form-horizontal form-bordered" id="form_upload" action="../controllers/online_store/insertSupp.jsp" method="get" enctype="multipart/form-data"  data-parsley-validate="true" name="demo-form1" >
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Supplier Name :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="text" id="email" name="Name" data-parsley-required="true" required value="" /> 
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Address :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <textarea class="form-control" cols="5" rows="10" name="desc" ></textarea>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Contact No :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="number" id="rate" name="tel" placeholder="" data-parsley-required="true" required value="" /> 
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4"></label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <button type="submit" id="upload_button" name="sbmitItem"  class="btn btn-primary">Add to database</button> 
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <!-- end panel -->
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>



            <!-- ###############################################          Model     ###################################################################################################################-->         

            <%    if (id != null) {
                    String CatName = "";
                    if (request.getParameter("editCat") != null) {

                        String Name = "";
                        String Add = "";
                        String contact = "";

                        ResultSet rs3 = getCon().createStatement().executeQuery("Select * from supplier where sId = '" + id + "'");
                        while (rs3.next()) {
                            Name = rs3.getString("sName");
                            Add = rs3.getString("sAdd");
                            contact = rs3.getString("sTel");

                        }

            %>


            <div class="modal fade" id="myModal1" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                            <h4 class="modal-title">Edit Supplier</h4>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <!-- begin col-6 -->
                                <div class="col-md-12">
                                    <!-- begin panel -->
                                    <div class="panel panel-inverse" data-sortable-id="form-validation-1">
                                        <div class="panel-body panel-form">
                                            <form class="form-horizontal form-bordered" action="../controllers/online_store/updateSupp.jsp" method="get" enctype="multipart/form-data"  data-parsley-validate="true" name="demo-form1" >
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Supplier Name :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="text" id="email" name="Name" data-parsley-required="true" required value=" <%= Name%>" />
                                                        <input type="hidden" name="itemId" value="<%= id%>">
                                                    </div>
                                                </div>
                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Address :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <textarea class="form-control" cols="5" rows="10" name="desc" ><%= Add%></textarea>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Contact Number :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="number" id="rate" name="brand" placeholder="" data-parsley-required="true" required value="<%=contact%>" /> 
                                                    </div>

                                                </div>




                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4"></label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <button type="submit" name="updateItem"  class="btn btn-primary">Update Supplier</button> 
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="return confirm('Are you sure you want to delete ?');">Cancel</button>
                                                    </div>
                                                </div>

                                        </div>
                                        </form>
                                    </div>
                                    <!-- end panel -->
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>    
        <%    }

                if (request.getParameter("delCat") != null) {

                    Statement stx = getCon().createStatement();
                    int i2 = stx.executeUpdate("delete from `supplier` where sId = '" + id + "'");

                    if (i2 == 1) {
                        out.print("<script>swal({  title: 'Supplier Deleted!', text: '', type: 'success', confirmButtonText: 'Done!'}, function(){ window.location.href='Supplier.jsp'; });</script>");

                    } else {
                        response.sendRedirect("../admin/error.jsp");
                    }

                }

            }


        %>





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

