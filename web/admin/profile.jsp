<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ include file="../config/sessionCheckAdmin.jsp" %>


<%
    
    String Name ="";
    String Pos ="";
    String id ="";
    String img ="";
    
    
    String Id = ""+session.getAttribute("admin_email");
     
    
    // People
    ResultSet rsPeople;
    String sql = "SELECT * From `adminac` where email = '"+Id+"'";
    rsPeople = getCon().createStatement().executeQuery(sql);
    
    while(rsPeople.next()){
        Name = rsPeople.getString("name");
        Pos = rsPeople.getString("pos");
        id = rsPeople.getString("admin_id");
        img = rsPeople.getString("img");
    }
    
 %>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->

<!-- Mirrored from seantheme.com/color-admin-v1.9/admin/html/extra_profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 19 Oct 2015 11:27:07 GMT -->
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
	
	<!-- ================== BEGIN BASE JS ================== -->
	<script src="assets/plugins/pace/pace.min.js"></script>
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
                    String pageTitle = "";
                    String subPage = "";
                %>
                <%@ include file="static/navbar.jsp" %>
                <!-- end #sidebar -->
		
		<!-- begin #content -->
		<div id="content" class="content">
			<!-- begin breadcrumb -->
			<ol class="breadcrumb pull-right">
				<li><a href="javascript:;">Account Settings</a></li>
				<li class="active">Profile Page</li>
			</ol>
			<!-- end breadcrumb -->
			<!-- begin page-header -->
			<h1 class="page-header">Profile Page <small></small></h1>
			<!-- end page-header -->
			<!-- begin profile-container -->
            <div class="profile-container">
                <!-- begin profile-section -->
                <div class="profile-section">
                    <!-- begin profile-left -->
                    <div class="profile-left">
                        <!-- begin profile-image -->
                        <div class="profile-image">
                            <img src="<%= img %>" width="100%"/>
                            <i class="fa fa-user hide"></i>
                        </div>
                        <!-- end profile-image -->
                        <div class="m-b-10">
                            <a href="#" class="btn btn-warning btn-block btn-sm">Change Picture</a>
                        </div>
                        <!-- begin profile-highlight -->
                        
                        <!-- end profile-highlight -->
                    </div>
                    <!-- end profile-left -->
                    <!-- begin profile-right -->
                    <div class="profile-right">
                        <!-- begin profile-info -->
                        <div class="profile-info">
                            <!-- begin table -->
                            <div class="table-responsive">
                                <table class="table table-profile">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>
                                                <h4><%= Name %> </h4>
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="highlight">
                                            <td class="field">Email</td>
                                            <td><%= Id %></td>
                                            <td>
                                                
                                            </td>
                                        </tr>
                                        <tr >
                                            <td class="field">Position</td>
                                            <td ><%= Pos %></td>
                                            <td>
                                                <a data-toggle="modal" data-target="#posNew" class="m-l-5"> <i class="fa fa-pencil fa-lg m-r-5"></i> Edit</a>
                                            </td>
                                        </tr>
					
                                        <tr>
                                            <td class="field">Password</td>
                                            <td><a data-toggle="modal" data-target="#PWNew">Change here</a></td>
                                            <input type="hidden" id="CID" value="<?php echo $email; ?>">
                                        </tr>
                                        
                                    </tbody>
                                </table>
                            </div>
                            <!-- end table -->
                        </div>
                        <!-- end profile-info -->
                    </div>
                    <!-- end profile-right -->
                </div>
                <!-- end profile-section -->
                <!-- begin profile-section -->
                
                <!-- end profile-section -->
            </div>
			<!-- end profile-container -->
		</div>
		<!-- end #content -->
		
<!--#################################################################################-->

<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" id="posNew" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
						<h4 id="myLargeModalLabel2" class="modal-title">Position</h4>
					</div>
					<div class="modal-body">
						<div class="row">
                                                    <form action="controllers/editProfile.jsp">
                                                        <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
									<div class="row input-group margin-bottom-20" style="padding-bottom:10px;">
										<span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                                                <input type="text" id="pos" name="pos" placeholder="Position" class="form-control" value="<%= Pos %>" required><br>
									</div>
									<div class="row">
                                                                            <button type="submit" class="btn btn-success btn-sm" style="float:right" id="newpos" name="btn" value="newpos" >Change Position</button>

									</div>
							</div>
                                                    </form>
						</div><!--/row-->
					</div>
				</div>
			</div>
    
		</div>





<!--	Password	-->
		<div class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" id="PWNew" aria-hidden="true">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">
					<div class="modal-header">
						<button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
						<h4 id="myLargeModalLabel2" class="modal-title"> New Password </h4>
					</div>
					<div class="modal-body">
						<div class="row">
                                                    <form action="controllers/editProfile.jsp">
                                                        <div class="col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2">
									<div class="input-group margin-bottom-20">
										<span class="input-group-addon"><i class="fa fa-key"></i></span>
                                                                                <input type="password" id="pwNew" name="pwNew" placeholder="New Password" class="form-control" required>
									</div>
									
                                                                        <div class="row" style="padding-top:10px;">
                                                                            <button type="submit" class="btn btn-success btn-sm" style="float:right" name="btn" value="newPw" > Change password </button>

									</div>
							</div>
                                                    </form>
						</div><!--/row-->
					</div>
				</div>
			</div>
		</div>



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
	<script src="assets/js/apps.min.js"></script>
	<!-- ================== END PAGE LEVEL JS ================== -->
	
	<script>
		$(document).ready(function() {
			App.init();
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

<!-- Mirrored from seantheme.com/color-admin-v1.9/admin/html/extra_profile.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 19 Oct 2015 11:27:08 GMT -->
</html>

