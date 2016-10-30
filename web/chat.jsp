<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="config/db_connection.jsp" %>

<%
    ResultSet rs;
    String sql = "SELECT * FROM `chat` where user ='1'";
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
  <div id="preloader">
    <div id="spinner">
      <div class="heart-preloader">
        <i class="fa fa-heart font-36 infinite animated pulse"></i>
      </div>
    </div>
    <div id="disable-preloader" class="btn btn-default btn-sm">Disable Preloader</div>
  </div>
  
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

    <!-- Section: Blog -->
    <section>
      <div class="container mt-30 mb-30 pt-30 pb-30">
        <div class="row">
          <div class="col-md-9 blog-pull-right">
            <div class="container">
    <div class="row">
        <div class="col-md-10">
            <div class="panel panel-primary">
                <div class="panel-body">
                    <ul class="chat">
                        <% while (rs.next()) {
                            if(Integer.parseInt(rs.getString("sendId")) == 0){ %>
                                <li class="left clearfix"><span class="chat-img pull-left">
                                    <img src="http://placehold.it/50/55C1E7/fff&amp;text=U" alt="User Avatar" class="img-circle">
                                </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                            <strong class="primary-font">Admin</strong> <small class="pull-right text-muted">
                                                <span class="glyphicon glyphicon-time"></span><%= rs.getString("time") %></small>
                                        </div>
                                        <p>
                                            <%= rs.getString("msg") %>
                                        </p>
                                    </div>
                                </li>
                                                                 
                          <% }
                            else{ %>
                                 <li class="right clearfix"><span class="chat-img pull-right">
                                    <img src="http://placehold.it/50/FA6F57/fff&amp;text=ME" alt="User Avatar" class="img-circle">
                                </span>
                                    <div class="chat-body clearfix">
                                        <div class="header">
                                            <small class=" text-muted"><span class="glyphicon glyphicon-time"></span><%= rs.getString("time") %></small>
                                            <strong class="pull-right primary-font">Test 123</strong>
                                        </div>
                                        <p>
                                            <%= rs.getString("msg") %>
                                        </p>
                                    </div>
                                </li>                             
                            <% }
                                                            
                        }%>
                        
                                                
                    </ul>
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
                <div class="latest-posts">
                  <article class="post media-post clearfix pb-0 mb-10">
                      <a class="post-thumb" href="#"><img src="images/asd.png" alt=""></a>
                    <div class="post-right">
                        <h5 class="post-title mt-0" ><a href="#" style="vertical-align:text-bottom">Marie Fonseka</a></h5>
                      
                    </div>
                  </article>
                  <article class="post media-post clearfix pb-0 mb-10">
                      <a class="post-thumb" href="#"><img src="images/asd.png" alt=""></a>
                    <div class="post-right">
                        <h5 class="post-title mt-0" ><a href="#" style="vertical-align:text-bottom">Administrator</a></h5>
                      
                    </div>
                  </article>
                  <article class="post media-post clearfix pb-0 mb-10">
                      <a class="post-thumb" href="#"><img src="images/asd.png" alt=""></a>
                    <div class="post-right">
                        <h5 class="post-title mt-0" ><a href="#" style="vertical-align:text-bottom">Lassana Flora</a></h5>
                      
                    </div>
                  </article>
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
                            var c = $("#msg").val();
                            //alert(c);
                            $.ajax({
                                    type: "post",
                                    url: "controllers/insertChat2.jsp", 
                                    data:{msg2:"test"},
                                    success: function (msg) {
                                          //alert(msg)
                                          location.reload();
                                    },
                                    error: function (error) {
                                        //alert("Error")
        
                                    }
                                });
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