
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.concurrent.TimeUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%
    
    String[] mon = {"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"};
    String[] mon2 = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
    List<String> wontedMon = new ArrayList();
        
    String due = "";   
    String due2 = "";
    
    String id = request.getParameter("conID");
    String start = request.getParameter("start");
    String end = request.getParameter("end");
    
    String[] day1 = start.split("/");
    String[] day2 = end.split("/");
    
    SimpleDateFormat myFormat = new SimpleDateFormat("yyyy-MMM");
    String inputString1 = day1[2]+"-"+mon[Integer.parseInt(day1[0])-1];
    String inputString2 = day2[2]+"-"+mon[Integer.parseInt(day2[0])-1];

    Date date1 = myFormat.parse(inputString1);
    Date date2 = myFormat.parse(inputString2);
    long diff = date2.getTime() - date1.getTime();
    int countdays = Integer.parseInt(""+TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS)/30);

    
    if(Integer.parseInt(day1[2]) == Integer.parseInt(day2[2])){
        if(Integer.parseInt(day1[0]) == Integer.parseInt(day2[0])){
            due = day2[2]+" - "+mon2[Integer.parseInt(day2[0])-1];
            wontedMon.add(day2[2]+"-"+mon[Integer.parseInt(day2[0])-1]);
        }
        else{
            String year = day1[2];
            int pos = Integer.parseInt(day1[0])-1;
            due = day2[2]+"-"+mon2[pos]+" to "+day2[2]+"-"+mon2[Integer.parseInt(day2[0])-1];
            for (int i = 0; i<=countdays ; i++){
                if((pos) > 11){
                      year = ""+(Integer.parseInt(year)+1);
                      pos = 0;
                }
                wontedMon.add(year+"-"+mon[pos]);
                pos++;
            }
        }
    }
    else{
            String year = day1[2];
            int pos = Integer.parseInt(day1[0])-1;
            due = day1[2]+"-"+mon2[pos]+" to "+day2[2]+"-"+mon2[Integer.parseInt(day2[0])-1];
            for (int i = 0; i<=countdays ; i++){
                if((pos) > 11){
                      year = ""+(Integer.parseInt(year)+1);
                      pos = 0;
                }
                wontedMon.add(year+"-"+mon[pos]);
                pos++;
            }
        }
    
    
    
    
    
    
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
                <%
                    String pageTitle = "report";
                    String subPage = "storeReport";
                %>
		<%@ include file="static/navbar.jsp" %>
		<!-- end #sidebar -->
		
		<!-- begin #content -->
		<div id="content" class="content">
			<!-- begin breadcrumb -->
			<ol class="breadcrumb pull-right">
				<li><a href="javascript:;">Home</a></li>
				<li><a href="javascript:;">Reports</a></li>
				<li class="active">Items Sales Report</li>
			</ol>
			<!-- end breadcrumb -->
			<!-- begin page-header -->
			<h1 >Items Sales Report </h1>
                        <h3>Duration: <%= due %></h3>
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
                
                
            
            var contest=[];
            var second =[];
            var myChart = new JSChart('graph', 'line');
            var month = [];
            
            <%
            
            
            
            for(int j =0; j< wontedMon.size();j++){
                %>
                    var vote =[];
                <%
                int count = 1;
                ResultSet rs2;
                String sql2 = "SELECT * FROM `items`";
                rs2 = getCon().createStatement().executeQuery(sql2);
                while(rs2.next()){
                    String Itemid = rs2.getString("itemId");
                    String ItemName = rs2.getString("itemName");
                    ResultSet rs3;
                    String sql3 = "SELECT * FROM `items_sales` WHERE `id` = '"+Itemid+"' and `month` = '"+wontedMon.get(j)+"'";
                    rs3 = getCon().createStatement().executeQuery(sql3);
                    if(rs3.first()){
                        String qty = rs3.getString("qty");
                    %>
                        vote[<%= count-1 %>] = ['<%= ItemName %>',<%= qty %>]; 
                    <%
                    }
                    else{
                        %>
                            vote[<%= count-1 %>] = ['<%= ItemName %>',0]; 
                        <%
                    }
                         count++;
                    
                }

                
                %>
                   second[<%= j %>] = vote;
                   month[<%= j %>] = '<%= wontedMon.get(j) %>';
	
                <%
                
                
            }
            
        %>
        
        var col = ["#FF0000","#00FF00","#0000FF","#FF00FF","#FFFF00","#00FFFF","#000000","#BBBBBB","#ff00de","#f6ff00","#ba00ff"];
        for(var r =0; r< second.length ;r++){
            //alert(second[r]);
            myChart.setDataArray(second[r], month[r]);
            
        }   
	//myChart.setDataArray(vote, 'blue');
	myChart.setSize(1200, 400);
        myChart.setTitle('All Items Sales Report');
	
	myChart.setAxisValuesNumberY(10);
        myChart.setAxisValuesNumberX(-1);
	//myChart.setShowXValues(true);
	myChart.setTitleColor('#454545');
	myChart.setAxisValuesColor('#454545');
        for(var r =0; r< second.length ;r++){
            myChart.setLineColor(col[r], month[r]);
           
        }
	myChart.setFlagColor('#9D16FC');
	myChart.setFlagRadius(2);
	myChart.setAxisPaddingRight(100);
	myChart.setLegendShow(true);
	myChart.setLegendPosition(1125, 80);
	myChart.setLegendForLine('blue', 'Click me');
	myChart.setLegendForLine('green', 'Click me');
	myChart.setLegendForLine('gray', 'Click me');
	myChart.draw();

        </script>
        

	
</body>

</html>

