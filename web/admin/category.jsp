<%
   
    ResultSet rs;
    rs = getCon().createStatement().executeQuery("Select * from category");
    
    
    String id = request.getParameter("txt");
    
  
    //String edit = request.getParameter("edit");
    //String 
   

   
 %>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

	
	
<head>
	<meta charset="utf-8" />
	<title>As You Wish | Admin Panel</title>
	<meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
	<meta content="" name="description" />
	<meta content="" name="author" />
	
	<!-- ================== BEGIN BASE CSS STYLE ================== -->
	<link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
	<link href="assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css" rel="stylesheet" />
	<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
	<link href="assets/css/animate.min.css" rel="stylesheet" />
	<link href="assets/css/style.min.css" rel="stylesheet" />
	<link href="assets/css/style-responsive.min.css" rel="stylesheet" />
	<link href="assets/css/theme/default.css" rel="stylesheet" id="theme" />
	<!-- ================== END BASE CSS STYLE ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL CSS STYLE ================== -->
    <link href="assets/plugins/jquery-jvectormap/jquery-jvectormap-1.2.2.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap-calendar/css/bootstrap_calendar.css" rel="stylesheet" />
    <link href="assets/plugins/gritter/css/jquery.gritter.css" rel="stylesheet" />
    <link href="assets/plugins/morris/morris.css" rel="stylesheet" />
	<!-- ================== END PAGE LEVEL CSS STYLE ================== -->
	
	<!-- ================== BEGIN BASE JS ================== -->
    <script src="assets/plugins/pace/pace.min.js"></script>
    <script src="assets/sweetalert-dev.js"></script>
    <link rel="stylesheet" href="assets/sweetalert.css">
	<!-- ================== END BASE JS ================== -->
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
				<li><a href="javascript:;">Online Store</a></li>
				<li class="active">Category</li>
			</ol>
			<!-- end breadcrumb -->
			<!-- begin page-header -->
			<h1 class="page-header">Item Category <small></small></h1>
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
                            <h4 class="panel-title">Data Table - Default</h4>
                        </div>
                        <div class="panel-body">
                            <button type="submit" class="btn btn-primary" data-toggle="modal" data-target="#myModal2"><i class="fa fa-plus"></i>  Add New Category</button><br><br>
                            
                            <table id="data-table" class="table table-striped table-bordered">
                                <thead>
                                    <tr>
                                        <th>Category ID</th>
                                        <th>Category Name</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%
                                        
                                        while(rs.next()){ %>
                                            <tr class="odd gradeX">
                                                <td>CAT00<%= rs.getString("catId") %></td>
                                                <td><%= rs.getString("catName") %></td>
                                                <td> 
                                                    <form  method="post">
                                                        <input type="hidden" id="txt" name="txt" value="<%= rs.getString("catId") %>">
                                                        <button type="submit" name="editCat" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#myModal1" ><i class="fa fa-pencil-square-o"></i> Edit</button>                                                         
                                                        <button type="submit" name="delCat" class="btn btn-warning btn-sm" onclick="return confirm('Are you sure to delete the category?')"><i class="fa fa-trash-o"></i> Delete</button>
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
                          <h4 class="modal-title">Insert New Category</h4>
                        </div>
                        <div class="modal-body">
                          <div class="row">
                <!-- begin col-6 -->
			    <div class="col-md-12">
			        <!-- begin panel -->
                                <div class="panel panel-inverse" data-sortable-id="form-validation-1">
                                    <div class="panel-body panel-form">
                                        <form class="form-horizontal form-bordered" action="../controllers/online_store/insertCat.jsp" method="get" enctype="multipart/form-data"  data-parsley-validate="true" name="demo-form1" >
                                               <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Category Name :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input class="form-control" type="text" id="Name" name="Name" data-parsley-required="true" required value="" /> 
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4"></label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <button type="submit" name="sbmitNewCat"  class="btn btn-primary">Add to database</button> 
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
           
<%
        
        if(id != null){
            String CatName = "";
            if(request.getParameter("editCat") != null){ 
            
                ResultSet rs2 = getCon().createStatement().executeQuery("Select * from category where catId = '"+id +"'");
                while(rs2.next()){
                    CatName = rs2.getString("catName");
                }

            %>
            
                
            <div class="modal fade" id="myModal1" role="dialog">
                 <div class="modal-dialog modal-lg">
                      <div class="modal-content">
                        <div class="modal-header">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4 class="modal-title">Edit Category</h4>
                        </div>
                        <div class="modal-body">
                          <div class="row">
                <!-- begin col-6 -->
			    <div class="col-md-12">
			        <!-- begin panel -->
                                <div class="panel panel-inverse" data-sortable-id="form-validation-1">
                                    <div class="panel-body panel-form">
                                        <form class="form-horizontal form-bordered" action="../controllers/online_store/updateCat.jsp" method="get" enctype="multipart/form-data"  data-parsley-validate="true" name="demo-form1" >
                                               <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4" for="email">Category Name :</label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <input type="hidden" name="catId" value="<%= id %>" />
                                                        <input class="form-control" type="text" id="Name" name="Name" data-parsley-required="true" required value="<%= CatName %>" /> 
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label class="control-label col-md-4 col-sm-4"></label>
                                                    <div class="col-md-6 col-sm-6">
                                                        <button type="submit" name="updateCat"  class="btn btn-primary">Update Category</button> 
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
                
                
        <%    }
        
        if(request.getParameter("delCat") != null){ 
            
            Statement st1= getCon().createStatement();
            int i=st1.executeUpdate("delete from category where catId = '"+ id +"'");
        
            if(i == 1){
                out.print("<script>swal({  title: 'Category Deleted!', text: '', type: 'success', confirmButtonText: 'Done!'}, function(){ window.location.href='category.jsp'; });</script>");

            }
            else{
                response.sendRedirect( "../admin/error.jsp");
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
		$(document).ready(function() {
			App.init();
			TableManageDefault.init();
		});
                $('#myModal1').modal({
                    show: true
                });
                
	</script>
	<script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','../../../../www.google-analytics.com/analytics.js','ga');
    
      ga('create', 'UA-53034621-1', 'auto');
      ga('send', 'pageview');
    </script>
</body>

<!-- Mirrored from seantheme.com/color-admin-v1.9/admin/html/table_manage.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 19 Oct 2015 11:23:32 GMT -->
</html>
