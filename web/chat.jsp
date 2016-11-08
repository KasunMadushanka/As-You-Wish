<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="config/db_connection.jsp" %>

<%
    
    String id = "x";
    String type = "0";
    String nameRev = "Administrator";
    String UserId = "1";
    String uType = "2";
    if(request.getParameter("id") == null || request.getParameter("type") == "0"){
        id = "0";
    }
    else{
        id = request.getParameter("id");
    }
    
    
    if(request.getParameter("type") != null){
        type = request.getParameter("type");
    }
    
    if(request.getParameter("name") != null){
        nameRev = request.getParameter("name");
    }
    
    if(request.getParameter("uType") != null){ 
        uType = request.getParameter("uType");
    }
    
    ResultSet rs;
    String sql = "SELECT * FROM `chat` WHERE `user` = '"+UserId+"' and (`revId` = '"+id+"' or `sendId` = '"+id+"') and userType='"+uType+"' ";///
    rs = getCon().createStatement().executeQuery(sql);


%>

<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>


<!-- Page Title -->
<title>Happy Wedding - Wedding Event & Planner Template</title>

<!-- Favicon and Touch Icons -->
<link href="images/favicon.png" rel="shortcut icon" type="image/png">
<link href="images/apple-touch-icon.png" rel="apple-touch-icon">
<link href="images/apple-touch-icon-72x72.png" rel="apple-touch-icon" sizes="72x72">
<link href="images/apple-touch-icon-114x114.png" rel="apple-touch-icon" sizes="114x114">
<link href="images/apple-touch-icon-144x144.png" rel="apple-touch-icon" sizes="144x144">

<!-- Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="css/jquery-ui.min.css" rel="stylesheet" type="text/css">
<link href="css/animate.css" rel="stylesheet" type="text/css">
<link href="css/css-plugin-collections.css" rel="stylesheet"/>
<!-- CSS | menuzord megamenu skins -->
<link id="menuzord-menu-skins" href="css/menuzord-skins/menuzord-bottom-trace.css" rel="stylesheet"/>
<!-- CSS | Main style file -->
<link href="css/style-main.css" rel="stylesheet" type="text/css">
<!-- CSS | Theme Color -->
<link href="css/colors/theme-skin-deep-pink.css" rel="stylesheet" type="text/css">
<!-- CSS | Preloader Styles -->
<link href="css/preloader.css" rel="stylesheet" type="text/css">
<!-- CSS | Custom Margin Padding Collection -->
<link href="css/custom-bootstrap-margin-padding.css" rel="stylesheet" type="text/css">
<!-- CSS | Responsive media queries -->
<link href="css/responsive.css" rel="stylesheet" type="text/css">
<!-- CSS | Style css. This is the file where you can place your own custom css code. Just uncomment it and use it. -->
<!-- <link href="css/style.css" rel="stylesheet" type="text/css"> -->
<!-- CSS | Chat -->
<link href="css/chat.css" rel="stylesheet" type="text/css">




<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
</head>
<body class="">
<div id="wrapper">
  <!-- preloader -->
  
  
  <!-- Header -->
 <header id="header" class="header">
                <div class="header-nav navbar-fixed-top header-dark navbar-white navbar-transparent navbar-sticky-animated animated-active">
                    <div class="header-nav-wrapper">
                        <div class="container">
                            <nav>
                                <div id="menuzord-right" class="menuzord red"> <a class="menuzord-brand pull-left flip font-playball text-theme-colored font-32" href="javascript:void(0)"><i class="fa fa-heart-o font-25"></i> As You Wish <i class="fa fa-heart-o font-25"></i></a>
                                    <ul class="menuzord-menu">
                                        <li><a href="index.jsp">Home</a></li>
                                        <li><a href="#features">Features</a></li>
                                        <li><a href="#vendors">Vendors</a></li>
                                        <li><a href="#events">Events</a></li>
                                        <li><a href="#blog">Blog</a></li>
                                        <li><a href="#about_us">About Us</a></li>
                                        <li><a href="contact.jsp">Contact</a></li>
                                        <li><a href="#" data-toggle="modal" data-target="#login-modal">Sign In</a></li>
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </header>
  
  <!-- Start main-content -->
  <div class="main-content">
    <!-- Section: inner-header -->
    <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/bg11.jpg">
      <div class="container pt-120 pb-50">
        <!-- Section Content -->
        <div class="section-content pt-100">
          <div class="row"> 
            <div class="col-md-12">
              <h3 class="title text-white">Chat Room</h3>
            </div>
          </div>
        </div>
      </div>
    </section>
    
    <div id="tab"> &nbsp;</div>
    <!-- Section: Blog -->
    <section >
      <div class="container mt-30 mb-30 pt-30 pb-30">
        <div class="row">
          <div class="col-md-9 blog-pull-right">
            <div class="container">
    <div class="row">
        <div class="col-md-10">
            <center><h3><%= nameRev %></h3></center>
            <input type="hidden" id="revID" value="<%= id %>">
            <input type="hidden" id="revType" value="<%= type %>">
            <div class="panel panel-primary">
                <div class="panel-body" id="check" style="height: 350px">
                    
                    
                    
                </div>
                <div class="panel-footer">
                    <div class="input-group">
                        <input id="btn-input" type="text"  class="form-control input-sm" placeholder="Type your message here...">
                        <span class="input-group-btn">
                            <button class="btn btn-warning btn-sm" id="sendMsg" >Send</button>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
          </div>
          <div class="col-sm-12 col-md-3">
            <div class="sidebar sidebar-left mt-sm-30">
              <div class="widget">
                <h5 class="widget-title line-bottom">Chat History </h5>
                <input type="hidden" name="userId" id="UserId" value="<%= UserId %>">
                <input type="hidden" name="userId" id="uType" value="<%= uType %>">
                <div class="latest-posts">
                  
                 <%
                     String sql2= "SELECT `revId`,`revType` FROM `chat` WHERE `user` ='"+UserId+"' and `revId` <> '"+UserId+"' group by `revId`,revType order by `time` desc";
                     ResultSet rs2 = getCon().createStatement().executeQuery(sql2);
                     while (rs2.next()){
                         int revID = Integer.parseInt(rs2.getString("revType"));
                         if(revID == 1){
                            String vId = rs2.getString("revId");
                            String sql3= "SELECT `company_name`,`image_url` FROM `vendor` WHERE `vendor_id` = '"+vId+"'";
                            ResultSet rs3 = getCon().createStatement().executeQuery(sql3);
                            while(rs3.next()){
                                String img = "images/asd.png";
                                if(rs3.getString("image_url") != null){
                                    img = rs3.getString("image_url");
                                }
                                String VName = rs3.getString("company_name");

                            %>
                            
                            <article class="post media-post clearfix pb-0 mb-10">
                                <a class="post-thumb" href="#"><img src="<%= img %>" width="50" height="50" alt=""></a>
                              <div class="post-right">
                                  <h5 class="post-title mt-0" ><a href="chat.jsp?id=<%= vId %>&&type=1&&name=<%= VName %>&&#tab" style="vertical-align:text-bottom"><%= VName %></a></h5>

                              </div>
                            </article>
                            
                            
                            
                            
                          <% }
                        }
                        else if(revID == 2){
                            String vId = rs2.getString("revId");
                            String sql3= "SELECT `first_name`,`last_name`,`image_url` FROM `customer` WHERE `customer_id` = '"+vId+"'";
                            ResultSet rs3 = getCon().createStatement().executeQuery(sql3);
                            while(rs3.next()){
                                String img = "images/asd2.png";
                                if(rs3.getString("image_url") != "" || rs3.getString("image_url") != null ){
                                    img = rs3.getString("image_url");
                                }
                                String VName = rs3.getString("first_name")+" "+rs3.getString("last_name");

                            %>
                            
                            <article class="post media-post clearfix pb-0 mb-10">
                                <a class="post-thumb"><img src="<%= img %>" width="50" height="50" alt=""></a>
                                <div class="post-right">
                                    <h5 class="post-title mt-0" ><a href="chat.jsp?id=<%= vId %>&&type=2&&name=<%= VName %>&&#tab" style="vertical-align:text-bottom"><%= VName %></a></h5>
                                </div>
                            </article>
                            
                            
                            
                            
                          <% }
                        }

                        else if(revID == 0){
                            String vId = rs2.getString("revId");
                                String img = "images/asd.png";
                                String VName = "Administrator";
                            %>
                            
                            <article class="post media-post clearfix pb-0 mb-10">
                                <a class="post-thumb" href="#"><img src="<%= img %>" alt=""></a>
                              <div class="post-right">
                                  <h5 class="post-title mt-0" ><a href="chat.jsp?id=<%= vId %>&&type=0&&name=<%= VName %>&&#tab" style="vertical-align:text-bottom"><%= VName %></a></h5>

                              </div>
                            </article>
                            
                            
                            
                            
                          <% 
                        }
                     
                     }
                 %>
                    
                </div>
              </div>
              
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
  <!-- end main-content -->
  
  <!-- Footer -->
  <footer id="footer" class="footer pb-0 bg-black-111">
                <%@ include file="/static/footer.jsp" %>
  </footer>
  <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
</div>
<!-- end wrapper -->

<!-- Footer Scripts -->
<!-- JS | Custom script for all pages -->
<!-- external javascripts -->
<script src="js/jquery-2.2.0.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<!-- JS | jquery plugin collection for this theme -->
<script src="js/jquery-plugin-collection.js"></script>
<script src="js/custom.js"></script>

<script>
		$(document).ready(function() {
			$( "#sendMsg" ).click(function() {
                            var c = $("#btn-input").val();
                            var revID = $("#revID").val();
                            var sendID = $("#UserId").val();
                            var atype = $("#revType").val();
                            var uType = $("#uType").val();
                            //alert(c);
                            //alert($("#msg").val());
                            
                            $.ajax({
                                    type: "post",
                                    url: "controllers/insertChat2.jsp", 
                                    data:{msg2:c,rev:revID,sender:sendID,revType:atype,uType:uType},
                                    success: function (msg) {
                                        $("#btn-input").val("");
                                        $('#check').load('controllers/showChat.jsp?type='+rtype+'&convId='+uId2+'&sendID='+sendID+'&rType='+atype);
                                        
                                          //location.reload();
                                    },
                                    error: function (error) {
                                        alert("Error");
        
                                    }
                                });
                         });
		});
                
                
                // Live Chat
                var uId2 = $("#revID").val();
                var sendID = $("#UserId").val();
                var rtype = $("#uType").val();
                var atype = $("#revType").val();
                $('#check').load('controllers/showChat.jsp?type='+rtype+'&convId='+uId2+'&sendID='+sendID+'&rType='+atype);
                        $.ajaxSetup({cache:false});
			setInterval(function() {
				$('#check').load('controllers/showChat.jsp?type='+rtype+'&convId='+uId2+'&sendID='+sendID+'&rType='+atype)
				var objDiv = document.getElementById("check");
				objDiv.scrollTop = objDiv.scrollHeight;
			},500 );
                                
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