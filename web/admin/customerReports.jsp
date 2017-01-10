<%
   
    ResultSet rs;
    rs = getCon().createStatement().executeQuery("Select * from category");
    
    
    String id = request.getParameter("txt");
    
  
    //String edit = request.getParameter("edit");
    //String 
   

   
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
	<link href="assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css" rel="stylesheet" />
	<link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
	<link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
	<link href="assets/css/animate.min.css" rel="stylesheet" />
	<link href="assets/css/style.min.css" rel="stylesheet" />
	<link href="assets/css/style-responsive.min.css" rel="stylesheet" />
	<link href="assets/css/theme/default.css" rel="stylesheet" id="theme" />
	<!-- ================== END BASE CSS STYLE ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL STYLE ================== -->

	<link href="assets/plugins/bootstrap-datepicker/css/datepicker.css" rel="stylesheet" />
<!--	<link href="assets/plugins/bootstrap-datepicker/css/datepicker3.css" rel="stylesheet" />
-->
	<link href="assets/plugins/ionRangeSlider/css/ion.rangeSlider.css" rel="stylesheet" />
	<link href="assets/plugins/ionRangeSlider/css/ion.rangeSlider.skinNice.css" rel="stylesheet" />
	<link href="assets/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css" rel="stylesheet" />
	<link href="assets/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" />
	<link href="assets/plugins/password-indicator/css/password-indicator.css" rel="stylesheet" />
	<link href="assets/plugins/bootstrap-combobox/css/bootstrap-combobox.css" rel="stylesheet" />
	<link href="assets/plugins/bootstrap-select/bootstrap-select.min.css" rel="stylesheet" />
	<link href="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css" rel="stylesheet" />
	<link href="assets/plugins/jquery-tag-it/css/jquery.tagit.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap-daterangepicker/daterangepicker-bs3.css" rel="stylesheet" />
    <link href="assets/plugins/select2/dist/css/select2.min.css" rel="stylesheet" />
    <link href="assets/plugins/bootstrap-eonasdan-datetimepicker/build/css/bootstrap-datetimepicker.min.css" rel="stylesheet" />
	<!-- ================== END PAGE LEVEL STYLE ================== -->
	
	<!-- ================== BEGIN BASE JS ================== -->
	<script src="assets/plugins/pace/pace.min.js"></script>
	<!-- ================== END PAGE LEVEL CSS STYLE ================== -->
	
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
                <%
                    String pageTitle = "report";
                    String subPage = "custReport";
                %>
		<%@ include file="static/navbar.jsp" %>
		<!-- end #sidebar -->
		
		<!-- begin #content -->
		<div id="content" class="content">
			<!-- begin breadcrumb -->
			<ol class="breadcrumb pull-right">
				<li><a href="javascript:;">Home</a></li>
				<li class="active">Reports</li>
			</ol>
			<!-- end breadcrumb -->
			<!-- begin page-header -->
			<h1 class="page-header">Generate Reports </h1>
			<!-- end page-header -->
			
			<!-- begin row -->
			<div class="row">
			    <!-- begin col-12 -->
			    <div class="col-md-12">
			        <div class="result-container">
			            <ul class="result-list">
                                        <li>
                                            <form method="get" action="custList.jsp" target="_blank">
                                                <div class="col-md-2 result-image">
                                                    <a href="javascript:;"><img src="assets/img/reports/order.jpg" alt=""  height="225" /></a>
                                                </div>
                                                <div class="col-md-7 result-info">
                                                    <h4 class="title">
                                                        <br>
                                                        <a >Customer Purchase List</a></h4>
                                                    <p class="desc">
                                                        Get specific customer's purchase list given time period.
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">Customer Name:</label>
                                                            <div class="input-group">
                                                                <input list="dName" name="name" required class="form-control" data-size="10" data-live-search="true" placeholder="John Reese">
								<datalist id="dName">
                                                                    <%
									String sqlcoun = "select * from `customer`";
                                                                        ResultSet rscust;
                                                                        rscust = getCon().createStatement().executeQuery(sqlcoun);
                                                                        //first_name	last_name
                                                                        while(rscust.next()){ //cFName	cLName
										%>
                                                                                <option value="<%= rscust.getString("first_name")+" "+rscust.getString("last_name") %>" ><%= rscust.getString("first_name")+" "+rscust.getString("last_name") %></option>            

									<%  
                                                                                }
                                                                         %>
                                                                </datalist>

                                                        
                                                                </div>

                                                        </div>
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">Time Period:</label>
                                                            <div class="input-group input-daterange">
                                                                <input type="text" class="form-control" name="start" placeholder="Date Start" required/>
                                                                    <span class="input-group-addon">to</span>
                                                                    <input type="text" class="form-control" name="end" placeholder="Date End" required />
                                                                </div>
                                                        </div>
                                                    </p>
                                                </div>
                                                <div class="result-price col-md-3" >
                                                    <button class="btn btn-inverse btn-block" name="btn" value="custList" type="submit">Get Report</button>
                                                    <br><br><br>
                                                </div>
                                            </form>
                                        </li>
                                        <li>
                                            <form method="get" action="custReport.jsp" target="_blank">
                                                <div class="col-md-2 result-image">
                                                    <a href="javascript:;"><img src="assets/img/reports/customers.png" alt=""  height="225" /></a>
                                                </div>
                                                <div class="col-md-7">
                                                    <h4 class="title">
                                                        <br>
                                                        <a >Customers' Details</a></h4>
                                                    <p class="desc">
                                                        Get all customers' details who are having their occasion on given time period.
                                                        <div class="form-group">
                                                            <label class="col-md-4 control-label">Time Period:</label>
                                                            <div class="input-group input-daterange">
                                                                <input type="text" class="form-control" name="start" placeholder="Date Start" required />
                                                                    <span class="input-group-addon">to</span>
                                                                    <input type="text" class="form-control" name="end" placeholder="Date End" required />
                                                                </div>
                                                        </div>
                                                    </p>
                                                </div>
                                                <div class="result-price col-md-3" >
                                                    <button class="btn btn-inverse btn-block" type="submit">Get Report</button>
                                                    <br><br><br>
                                                </div>
                                            </form>
                                        </li>
                                        
                                        
                                        
                                </ul>
                        
                            </div>
			    </div>
			    <!-- end col-12 -->
			</div>
			<!-- end row -->
		</div>
		<!-- end #content -->
		
        		
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
	<script src="assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
	<script src="assets/plugins/ionRangeSlider/js/ion-rangeSlider/ion.rangeSlider.min.js"></script>
	<script src="assets/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
	<script src="assets/plugins/masked-input/masked-input.min.js"></script>
	<script src="assets/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
	<script src="assets/plugins/password-indicator/js/password-indicator.js"></script>
	<script src="assets/plugins/bootstrap-combobox/js/bootstrap-combobox.js"></script>
	<script src="assets/plugins/bootstrap-select/bootstrap-select.min.js"></script>
	<script src="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>
	<script src="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput-typeahead.js"></script>
	<script src="assets/plugins/jquery-tag-it/js/tag-it.min.js"></script>
        <script src="assets/plugins/bootstrap-daterangepicker/moment.js"></script>
        <script src="assets/plugins/bootstrap-daterangepicker/daterangepicker.js"></script>
        <script src="assets/plugins/select2/dist/js/select2.min.js"></script>
        <script src="assets/plugins/bootstrap-eonasdan-datetimepicker/build/js/bootstrap-datetimepicker.min.js"></script>
	<script src="assets/js/form-plugins.demo.min.js"></script>
	<script src="assets/js/apps.min.js"></script>
	<!-- ================== END BASE JS ================== -->
	
	<!-- ================== BEGIN PAGE LEVEL JS ================== -->
	<!-- ================== END PAGE LEVEL JS ================== -->
	
	<script>
		$(document).ready(function() {
			App.init();
                        FormPlugins.init();
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

