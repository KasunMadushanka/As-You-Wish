

<%@page import="java.util.ArrayList"%>
<%
    
    ResultSet rs1;
    String sql1 = "SELECT contest_id,`month`, `year` FROM contest";
    rs1 = getCon().createStatement().executeQuery(sql1);
    
    
    String title ="";
    String[] mon = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
    
   
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
    <script type="text/javascript" src="assets/js/jscharts.js"></script>
    
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
				<li><a href="javascript:;">Reports</a></li>
				<li class="active">Vote Results</li>
			</ol>
			<!-- end breadcrumb -->
			<!-- begin page-header -->
			<h1 class="page-header">Tick the Best<small> Results</small></h1>
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
                            <div class="col-md-7">
                                     <h4 class="title">
                                        <a> Overall Results </a>
                                        <br><br>
                                     </h4>
                                     
                            </div>
                            <div id="graph">Loading...</div>
                        </div>
                    </div>
                    <!-- end panel -->
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
   
        
        <script type="text/javascript">
            
            
            var vote =[];
            var contest=[];
            
            <%
            
            int count = 1;
            
            while(rs1.next()){
                int monNo = Integer.parseInt(rs1.getString("month"));
                title = rs1.getString("year")+"-"+mon[monNo-1];
                String ConId = rs1.getString("contest_id");
                String NoVotes = "";
                int pos =0;
                ResultSet rs;
                String sql = "SELECT * FROM `contestant` where contest_id = '"+ConId+"' order by `votes`";
                rs = getCon().createStatement().executeQuery(sql);
                while(rs.next()){
                    if(pos ==2){
                        NoVotes = NoVotes+rs.getString("votes");
                    }
                    else{
                        NoVotes = NoVotes+rs.getString("votes")+",";
                    }
                    pos++;
                    

                }
                %>

                    vote[<%= count-1 %>] = ['<%= title %>',<%= NoVotes %>]; 
                    
                    <% 
                        count++;
                

            }
            
            
        
        
        %>
	
        //alert(vote)
        //var cdf = [['Asia', 437, 520,345], ['Europe', 322, 390,345]];
	//var myData = new Array(['Asia', 437, 520,345], ['Europe', 322, 390,345], ['North America', 233, 286,345], ['Latin America', 110, 162,345], ['Africa', 34, 49,345], ['Middle East', 20, 31,345], ['Aus/Oceania', 19, 22,345]);
	var myChart = new JSChart('graph', 'bar');
	myChart.setDataArray(vote);
	myChart.setTitle('All Contest Results');
	myChart.setTitleColor('#8E8E8E');
	myChart.setAxisNameX('Contest Month');
	myChart.setAxisNameY('No of Votes');
	myChart.setAxisNameFontSize(12);
	myChart.setAxisNameColor('#999');
	myChart.setAxisValuesAngle(20);
	myChart.setAxisValuesColor('#777');
	myChart.setAxisColor('#B5B5B5');
	myChart.setAxisWidth(1);
	myChart.setBarValuesColor('#2F6D99');
	myChart.setAxisPaddingTop(60);
	myChart.setAxisPaddingBottom(60);
	myChart.setAxisPaddingLeft(45);
	myChart.setTitleFontSize(11);
	myChart.setBarColor('#3366FB', 1);//"#3366FB","#F8CC00","#F76600"
	myChart.setBarColor('#F8CC00', 2);
        myChart.setBarColor('#F76600', 3);
	myChart.setBarBorderWidth(0);
	myChart.setBarSpacingRatio(50);
	myChart.setBarOpacity(0.9);
	myChart.setFlagRadius(6);
	myChart.setLegendShow(false);
	myChart.setLegendPosition('right top');
	myChart.setLegendForBar(1, '2005');
	myChart.setLegendForBar(2, '2010');
	myChart.setSize(1200, 400);
	myChart.setGridColor('#C6C6C6');
	myChart.draw();
	
	
	
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

