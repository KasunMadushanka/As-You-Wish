<%
   
    ResultSet rs;
    String text = "";
    rs = getCon().createStatement().executeQuery("SELECT * FROM `website` WHERE `title` = 'legal' ");
    while(rs.next()){
        text = rs.getString("desc");
    }
    
    
  
    String id = request.getParameter("txt");
    //String 
   

   
 %>
//

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
	<link href="assets/plugins/bootstrap-wysihtml5/src/bootstrap-wysihtml5.css" rel="stylesheet" />
    
    
    
</head>
<body>
	<!-- begin #page-loader -->
	<div id="page-loader" class="fade in"><span class="spinner"></span></div>
	<!-- end #page-loader -->
	
	<!-- begin #page-container -->
	<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
		<!-- begin #header -->
		<%@ include file="static/header.jsp" %>
		<!-- end #header -->
		
		<!-- begin #sidebar -->
                <%
                    String pageTitle = "frontend";
                    String subPage = "legal";
                %>
		<%@ include file="static/navbar.jsp" %>
		<!-- end #sidebar -->
		
		<!-- begin #content -->
		<div id="content" class="content">
			<!-- begin breadcrumb -->
			<ol class="breadcrumb pull-right">
				<li><a href="index.jsp">Home</a></li>
				<li><a href="javascript:;">Front End</a></li>
				<li class="active">Legal Information</li>
			</ol>
			<!-- end breadcrumb -->
			<!-- begin page-header -->
			<h1 class="page-header">Legal Information </h1>
			<!-- end page-header -->
			
			<!-- begin row -->
			<div class="row">
                <!-- begin col-12 -->
                <div class="col-md-12">
			        <!-- begin panel -->
                                <form action="../controllers/insertWebpage.jsp" method="get">
                                    <div class="panel panel-inverse" data-sortable-id="form-wysiwyg-2">
						
                                        <div class="panel-heading">
                                            <h4 class="panel-title"></h4>
                                            <div class="row" style="padding-bottom:10px;">
                                                <button type="submit" id="legal" name="legal" class="btn btn-primary"><i class="fa fa-pencil-square-o"></i>  Update </button><br>	
                                            </div>
                                        </div>
                                        <div class="panel-body panel-form">
                                            <textarea class="textarea form-control" id="wysihtml5" name="termsDesc" placeholder="Enter text ..." rows="35"><%=text %></textarea>
                                        </div>
                                    </div>
                                </form>
                    <!-- end panel -->
                </div>
                <!-- end col-6 -->
            </div>
            <!-- end row -->
		</div>
		<!-- end #content -->
		
        <!-- begin theme-panel -->
        
        <!-- end theme-panel -->
		
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
	<script src="assets/plugins/ckeditor/ckeditor.js"></script>
	<script src="assets/plugins/bootstrap-wysihtml5/lib/js/wysihtml5-0.3.0.js"></script>
	<script src="assets/plugins/bootstrap-wysihtml5/src/bootstrap-wysihtml5.js"></script>
	<script src="assets/js/form-wysiwyg.demo.min.js"></script>
	<script src="assets/js/apps.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->
	
	<script>
		$(document).ready(function() {
			App.init();
			FormWysihtml5.init();
			
			
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

</html>

