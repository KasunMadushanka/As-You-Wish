
<%
    
    String id = "x";
    String type = "0";
    String UserId = "0";
    String UName = "";
    String uImg = "";
    
    if(request.getParameter("id") == null || request.getParameter("type") == "0"){
        id = "0";
    }
    else{
        id = request.getParameter("id");
    }
        
    if(request.getParameter("type") != null){
        type = request.getParameter("type");
    }
    
    ResultSet rs0;
    String sql0;
    if(Integer.parseInt(type) == 1){
        sql0 = "SELECT `company_name`,`image_url` FROM `vendor` WHERE `vendor_id` ='"+id+"'";
        rs0 = getCon().createStatement().executeQuery(sql0);
        if(rs0.first()){
            UName = rs0.getString("company_name");
            uImg = rs0.getString("image_url");
        }
    }
    else{
        sql0 = "SELECT `first_name`,`last_name`,`image_url` FROM `customer` WHERE `customer_id` = '"+id+"'";
        rs0 = getCon().createStatement().executeQuery(sql0);
        if(rs0.first()){
            UName = rs0.getString("first_name")+" "+rs0.getString("last_name");
            uImg = rs0.getString("image_url");
        }
    }
    
    
    
    
    
    ResultSet rs;
    String sql = "SELECT `user`,`userType` FROM `chat` WHERE `revId`='0' or `sendId`='0' group by `user`,`userType`";
    rs = getCon().createStatement().executeQuery(sql);
    
    ResultSet rs3;
    String sql3 = "SELECT * FROM `chat` WHERE `user` = '"+id+"' and userType='"+type+"' and (`sendId`= '0' or `revId`='0')";
    rs3 = getCon().createStatement().executeQuery(sql3);
    
    
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
				<li class="active">Chat Room</li>
			</ol>
			<!-- end breadcrumb -->
			<!-- begin page-header -->
			<h1 class="page-header">Chat Room <small></small></h1>
			<!-- end page-header -->
			
			<!-- begin row -->
			<div class="row">
			    <!-- begin col-12 -->
			    <div class="col-md-12">
			        <!-- begin panel -->
                                <div class="col-md-4" style="background: white">
                                    <%
                                        while(rs.next()){
                                            String userID = rs.getString("user");
                                            if(Integer.parseInt(rs.getString("userType"))==2){
                                                ResultSet rs2;
                                                String sql2 = "SELECT `first_name`,`last_name`,`image_url` FROM `customer` WHERE `customer_id` = '"+userID+"'";
                                                rs2 = getCon().createStatement().executeQuery(sql2);
                                                while(rs2.next()){ %>
                                                 
                                                    <tr>
                                                        <td class="email-sender" style="vertical-align:center;">
                                                            <br>
                                                            <a class="image"><img alt="" src="../<%= rs2.getString("image_url") %>" width="50" height="50" /></a> &nbsp;&nbsp; | &nbsp;&nbsp;
                                                            <a href="chat.jsp?id=<%= rs.getString("user") %>&&type=<%= rs.getString("userType")%>"><%= rs2.getString("first_name")+" "+rs2.getString("last_name") %></a>
                                                            <hr>
                                                        </td>
                                                    </tr>
                                                            
                                                        
                                               <% }
                                                        
                                                
                                            }
                                            else if(Integer.parseInt(rs.getString("userType"))==1){
                                                ResultSet rs2;
                                                String sql2 = "SELECT `company_name`,`image_url` FROM `vendor` WHERE `vendor_id` ='"+userID+"'";
                                                rs2 = getCon().createStatement().executeQuery(sql2);
                                                while(rs2.next()){ %>
                                                 
                                                    <tr>
                                                        <td class="email-sender" style="vertical-align:center;">
                                                            <br>
                                                            <a class="image"><img alt="" src="../<%= rs2.getString("image_url") %>" width="50" height="50" /></a> &nbsp;&nbsp; | &nbsp;&nbsp;
                                                            <a href="chat.jsp?id=<%= rs.getString("user") %>&&type=<%= rs.getString("userType")%>"><%= rs2.getString("company_name") %></a>
                                                            <hr>
                                                        </td>
                                                    </tr>
                                                            
                                                        
                                               <% }
                                                        
                                                
                                            }
                                        }
                                    %>
                                    
                                </div>
                                     <div class="col-md-8">
                                        <!-- begin panel -->
                                            <div class="panel panel-inverse" data-sortable-id="index-2">
                                                <div class="panel-heading">
                                                    <h4 class="panel-title">Chat History - <%= UName %> </h4>
                                                </div>
                                                <div class="panel-body bg-silver">
                                                    <div data-scrollbar="true" data-height="450px" id="check">
                                                        
                                                    </div>
                                                </div>
                                                <div class="panel-footer">
                                                    
                                                        <div class="input-group">
                                                            <input type="text" class="form-control input-sm" id="msg" name="message" placeholder="Enter your message here.">
                                                            <input type="hidden" id="revID" value="<%= id %>">
                                                            <input type="hidden" id="revType" value="<%= type %>">
                                                            
                                                            <span class="input-group-btn">
                                                                <button class="btn btn-primary btn-sm" id="sendMsg" type="button">Send</button>
                                                            </span>
                                                        </div>
                                                    
                                                </div>
                                            </div>
                                            <!-- end panel -->
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
                $('#myModal3').modal({
                    show: true
                });
                
                // Live Chat
                var uId2 = $("#revID").val();
                var rtype = $("#revType").val();
                $('#check').load('controllers/showChat.jsp?type='+rtype+'&convId='+uId2);
                        $.ajaxSetup({cache:false});
			setInterval(function() {
				$('#check').load('controllers/showChat.jsp?type='+rtype+'&convId='+uId2)
				var objDiv = document.getElementById("check");
				objDiv.scrollTop = objDiv.scrollHeight;
			},500 );
                
                
                $( "#sendMsg" ).click(function() {
                    var c = $("#msg").val()
                    var revID = $("#revID").val();
                    var sendID = 0;
                    var atype = $("#revType").val();
                    var uType = $("#revType").val();
                    //alert(c)
                    $.ajax({
                            type: "post",
                            url: "../controllers/insertChat.jsp", 
                            data:{msg2:c,rev:revID,sender:sendID,revType:atype,uType:uType},
                            success: function (msg) {
                                    $('#msg').val("");
                                    $('#check').load('controllers/showChat.jsp?type='+atype+'&convId='+revID)
                                  //alert(msg)
                                  //location.reload();
                                  
                            },
                            error: function (error) {
                                alert("Error")

                            }
                        });
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

