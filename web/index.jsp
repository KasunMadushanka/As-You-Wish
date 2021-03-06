<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config/db_connection.jsp"%>
<%
    session.setAttribute("type", "visitor");

    ArrayList data = new ArrayList();

    ResultSet rs = getCon().createStatement().executeQuery("Select* from customer where status='active'");
    while (rs.next()) {

        String[] details = new String[7];

        details[0] = rs.getString("customer_id");
        details[1] = rs.getString("first_name");
        details[2] = rs.getString("partner_first_name");
        details[3] = rs.getString("cover_image");
        details[4] = rs.getString("event_date");

        data.add(details);
    }

    Calendar cal = Calendar.getInstance();
    int day = cal.get(Calendar.DAY_OF_MONTH);

    cal.set(Calendar.SECOND, 59);
    cal.set(Calendar.HOUR_OF_DAY, 23);
    cal.set(Calendar.MINUTE, 59);

    int difference = (int) (cal.getTimeInMillis() - Calendar.getInstance().getTimeInMillis()) / 1000;

    boolean status = false;

    ResultSet rs1 = getCon().createStatement().executeQuery("Select status from contest_settings");
    if (rs1.first()) {
        if (rs1.getString("status").equals("active")) {
            status = true;
        }
    }

%>

<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>

        <link  href="css/login_modal.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="css/flipclock.css">

        <script src="js/flipclock.js"></script>	
        <%if (status) {%>
        <script>
            var clock;
            $(document).ready(function () {
                clock = $('.clock').FlipClock('<%=difference%>', {
                    countdown: true,
                    autoStart: true,
                    callbacks: {
                        stop: function () {

                        }
                    }
                });
            });
        </script>
        <%}%>
        <script src="js/login-modal.js"></script>  
        <script src="myjs/login.js"></script>  
        <script src="myjs/email.js"></script>   
    </head>

    <body class="">

        <div id="wrapper" class="clearfix">

            <div id="preloader">
                <div id="spinner">
                    <div class="heart-preloader">
                        <i class="fa fa-heart font-36 infinite animated pulse"></i>
                    </div>
                </div>
            </div>
            <!-- Header -->
            <header id="header" class="header">
                <div class="header-nav navbar-fixed-top header-dark navbar-white navbar-transparent navbar-sticky-animated animated-active">
                    <div class="header-nav-wrapper">
                        <div class="container">
                            <nav>
                                <div id="menuzord-right" class="menuzord red"> <a class="menuzord-brand pull-left flip font-playball text-theme-colored font-32" href="javascript:void(0)"><i class="fa fa-heart-o font-25"></i> As You Wish <i class="fa fa-heart-o font-25"></i></a>
                                    <ul class="menuzord-menu">
                                        <li class="active"><a href="#home">Home</a></li>
                                        <li><a href="#features">Features</a></li>
                                        <li><a href="#vendors">Vendors</a></li>
                                        <li><a href="#events">Events</a></li>
                                        <li><a href="#blog">Blog</a></li>
                                        <li><a href="#contests">Contests</a></li>
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
                <!-- Section: home -->
                <section id="home" class="divider no-bg">
                    <div class="maximage-slider">
                        <div id="maximage">
                            <img src="images/bg/bg30.jpg" alt=""/>
                            <img src="images/bg/bg26.jpg" alt=""/>
                            <img src="images/bg/bg34.jpg" alt=""/>
                        </div>
                        <div class="fullscreen-controls"> <a class="img-prev"><i class="pe-7s-angle-left"></i></a> <a class="img-next"><i class="pe-7s-angle-right"></i></a> </div>
                    </div>
                    <div class="display-table">
                        <div class="display-table-cell">
                            <div class="container pt-200 pb-50">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2 text-center pt-20 pb-50">
                                        <%if (status) {%>
                                        <img src="images/logo3.png" alt="" style="position: relative; top:60px; ">
                                        <div class="clock" style="position: relative;left: 135px; top: -20px"></div>
                                        <a class="btn btn-theme-colored" href="voting.jsp" style="position: relative;top: -20px; width: 450px; height: 50px; font-size: 20px;">Most Popular Couple January 2017</a>
                                        <%} else {%>
                                        <img src="images/logo3.png" style="position: relative; top:220px; padding-bottom: 180px;">
                                        <%}%>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section id="features" class="divider bg-img-center-bottom" data-bg-img="images/bg/bg9.png">
                    <div class="container">
                        <div class="section-title">
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3 text-center wow fadeInUp animation-delay1">
                                    <h2 class="title pattern-bottom">Plan Your Wedding Step by Step</h2>
                                    <p>Sign up for As You Wish to personalize your unique plan</p>
                                </div>
                            </div>
                        </div>
                        <div class="section-content">
                            <div class="row multi-row-clearfix">
                                <div class="events">
                                    <div class="col-xs-12 col-sm-12 col-md-3 wow fadeInUp animation-delay1">
                                        <article class="event clearfix maxwidth500 mb-30">
                                            <div class="col-xs-12 p-0">
                                                <div class="entry-header">
                                                    <div class="event-thumb">
                                                        <a href="vendor_list.jsp?service_id=1&service=Reception Halls">
                                                            <center><img class="img-responsive img-fullwidth" alt="" src="images/AYW/icons/vendor.png" style="width:40%; padding-top:15px;"></center>
                                                        </a>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 p-0">
                                                <div class="entry-content p-30 pl-xs-15 pr-xs-15">
                                                    <h4 class="entry-title sm-inline-block mt-0 mt-sm-30 pt-0" style="text-align:center">Search Vendors</h4>
                                                    <div class="entry-meta mt-10 mb-10">
                                                        <ul class="list-inline font-13">
                                                            <li style="text-align:center"> Find the best vendors all around the country...</li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-3 wow fadeInUp animation-delay1">
                                        <article class="event clearfix maxwidth500 mb-30">
                                            <div class="col-xs-12 p-0">
                                                <div class="entry-header">
                                                    <div class="event-thumb">
                                                        <a href="#" data-toggle="modal" data-target="#login-modal">
                                                            <center><img class="img-responsive img-fullwidth" alt="" src="images/AYW/icons/137354-200.png" style="width:40%; padding-top:15px;"></center>
                                                        </a>
                                                    </div>

                                                </div>
                                            </div>
                                            <div class="col-xs-12 p-0">
                                                <div class="entry-content p-30 pl-xs-15 pr-xs-15">
                                                    <h4 class="entry-title sm-inline-block mt-0 mt-sm-30 pt-0" style="text-align:center">Plan Your Wedding</h4>
                                                    <div class="entry-meta mt-10 mb-10">
                                                        <ul class="list-inline font-13">
                                                            <li style="text-align:center">Take the correct decisions with budget planning...</li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-3 wow fadeInUp animation-delay1">
                                        <article class="event clearfix maxwidth500 mb-30">
                                            <div class="col-xs-12 p-0">
                                                <div class="entry-header">
                                                    <div class="event-thumb">
                                                        <a href="#" data-toggle="modal" data-target="#login-modal">
                                                            <center><img class="img-responsive img-fullwidth" alt="" src="images/AYW/icons/window_form-512.png" style="width:40%; padding-top:15px;"></center>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 p-0">
                                                <div class="entry-content p-30 pl-xs-15 pr-xs-15">
                                                    <h4 class="entry-title sm-inline-block mt-0 mt-sm-30 pt-0" style="text-align:center">Wedding Blog</h4>
                                                    <div class="entry-meta mt-10 mb-10">
                                                        <ul class="list-inline font-13">
                                                            <li style="text-align:center"> Share the story of your journey with others...</li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-3 wow fadeInUp animation-delay1">
                                        <article class="event clearfix maxwidth500 mb-30">
                                            <div class="col-xs-12 p-0">
                                                <div class="entry-header">
                                                    <div class="event-thumb">
                                                        <a href="store.jsp">
                                                            <center><img class="img-responsive img-fullwidth" alt="" src="images/AYW/icons/cart.png" style="width:40%; padding-top:15px;"></center>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 p-0">
                                                <div class="entry-content p-30 pl-xs-15 pr-xs-15">
                                                    <h4 class="entry-title sm-inline-block mt-0 mt-sm-30 pt-0" style="text-align:center">Online Store</h4>
                                                    <div class="entry-meta mt-10 mb-10">
                                                        <ul class="list-inline font-13">
                                                            <li style="text-align:center"> Buy amazing gifts for wedding couples...</li>
                                                        </ul>
                                                    </div>

                                                </div>
                                            </div>
                                        </article>
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Section: vendors -->
                <section id="vendors" class="divider bg-img-center-bottom" data-bg-img="images/bg/bg9.png">
                    <div class="col-md-6 col-md-offset-3 text-center wow fadeInUp animation-delay1">
                        <h2 class="title pattern-bottom" style="padding-bottom:25px">Vendors</h2>
                        <p></p>
                    </div>
                    <div class="container pt-70" style="float:center">
                        <div class="row">
                            <div class="col-md-4 wow fadeInUp animation-delay1" style="padding-bottom:20px;">
                                <div class="couple">
                                    <div class="couple-thumb">                    
                                        <a href="vendor_list.jsp?service_id=1&service=Reception Halls" class="text-theme-colored font-13"> <img class="img-fullwidth" src="images/services/1.jpg" alt=""> </a>
                                    </div>
                                    <div class="couple-details">
                                       <a href="vendor_list.jsp?service_id=1&service=Reception Halls" class="text-theme-colored font-13"> <h4 class="title"><span>Reception Halls</span></h4> </a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 wow fadeInUp animation-delay1" style="padding-bottom:20px;">
                                <div class="couple">
                                    <div class="couple-thumb">                    
                                        <a href="vendor_list.jsp?service_id=2&service=Cake Designers" class="text-theme-colored font-13"> <img class="img-fullwidth" src="images/services/2.jpg" alt=""> </a>
                                    </div>
                                    <div class="couple-details">
                                       <a href="vendor_list.jsp?service_id=2&service=Cake Designers" class="text-theme-colored font-13"> <h4 class="title"><span>Cake Designers</span></h4> </a>
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4 wow fadeInUp animation-delay1" style="padding-bottom:20px;">
                                <div class="couple">
                                    <div class="couple-thumb">                    
                                        <a href="vendor_list.jsp?service_id=3&service=Beauticians" class="text-theme-colored font-13"> <img class="img-fullwidth" src="images/services/3.jpg" alt=""> </a>
                                    </div>
                                    <div class="couple-details">
                                        <a href="vendor_list.jsp?service_id=3&service=Beauticians" class="text-theme-colored font-13"> <h4 class="title"><span>Beauticians</span></h4> </a>
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4 wow fadeInUp animation-delay1" style="padding-bottom:20px;">
                                <div class="couple">
                                    <div class="couple-thumb">                    
                                        <a href="vendor_list.jsp?service_id=4&service=Bridal Dresses" class="text-theme-colored font-13"> <img class="img-fullwidth" src="images/services/4.jpg" alt=""> </a>
                                    </div>
                                    <div class="couple-details">
                                        <a href="vendor_list.jsp?service_id=4&service=Bridal Dresses" class="text-theme-colored font-13"> <h4 class="title"><span>Bridal Dresses</span></h4> </a>
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4 wow fadeInUp animation-delay1" style="padding-bottom:20px;">
                                <div class="couple">
                                    <div class="couple-thumb">                    
                                        <a href="vendor_list.jsp?service_id=5&service=Groom Suits" class="text-theme-colored font-13"> <img class="img-fullwidth" src="images/services/5.jpg" alt=""> </a>
                                    </div>
                                    <div class="couple-details">
                                        <a href="vendor_list.jsp?service_id=5&service=Groom Suits" class="text-theme-colored font-13"> <h4 class="title"><span>Groom Suits</span></h4> </a>
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4 wow fadeInUp animation-delay1" style="padding-bottom:20px;">
                                <div class="couple">
                                    <div class="couple-thumb">                    
                                        <a href="vendor_list.jsp?service_id=6&service=Photography" class="text-theme-colored font-13"> <img class="img-fullwidth" src="images/services/6.jpg" alt=""> </a>
                                    </div>
                                    <div class="couple-details">
                                        <a href="vendor_list.jsp?service_id=6&service=Photography" class="text-theme-colored font-13"> <h4 class="title"><span>Photography</span></h4> </a>
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4 wow fadeInUp animation-delay1" style="padding-bottom:20px;">
                                <div class="couple">
                                    <div class="couple-thumb">                    
                                        <a href="vendor_list.jsp?service_id=7&service=Poruwa & Decorations" class="text-theme-colored font-13"> <img class="img-fullwidth" src="images/services/7.jpg" alt=""> </a>
                                    </div>
                                    <div class="couple-details">
                                        <a href="vendor_list.jsp?service_id=7&service=Poruwa & Decorations" class="text-theme-colored font-13"> <h4 class="title"><span>Poruwa and Decorations</span></h4> </a>
                                    </div>
                                </div>

                            </div>
                            <div class="col-md-4 wow fadeInUp animation-delay1" style="padding-bottom:20px;">
                                <div class="couple">
                                    <div class="couple-thumb">                    
                                        <a href="vendor_list.jsp?service_id=8&service=Entertainment Groups" class="text-theme-colored font-13"> <img class="img-fullwidth" src="images/services/8.jpg" alt=""> </a>
                                    </div>
                                    <div class="couple-details">
                                        <a href="vendor_list.jsp?service_id=8&service=Entertainment Groups" class="text-theme-colored font-13"> <h4 class="title"><span>Entertainment Groups</span></h4> </a>
                                    </div>
                                </div>
                            </div>	
                            <div class="col-md-4 wow fadeInUp animation-delay1" style="padding-bottom:20px;">
                                <div class="couple">
                                    <div class="couple-thumb">                    
                                        <a href="vendor_list.jsp?service_id=9&service=Wedding Cars" class="text-theme-colored font-13"> <img class="img-fullwidth" src="images/services/9.jpg" alt=""> </a>
                                    </div>
                                    <div class="couple-details">
                                        <a href="vendor_list.jsp?service_id=9&service=Wedding Cars" class="text-theme-colored font-13"> <h4 class="title"><span> Wedding Cars </span></h4> </a>
                                    </div>
                                </div>


                            </div>
                        </div>
                    </div>
                </section>


                <!-- Divider: Funfact -->
                <section id="success" class="divider parallax layer-overlay overlay-theme-colored" data-stellar-background-ratio="0.5" data-bg-img="images/bg/bg21.jpg">
                    <div class="container pt-120 pb-120 pb-sm-60 pt-sm-60">
                        <div class="row">
                            <div class="col-xs-12 col-sm-6 col-md-3 wow fadeInUp animation-delay1">
                                <div class="funfact text-center mb-sm-30">
                                    <h2 class="animate-number text-white" data-value="1704" data-animation-duration="2000">0</h2>
                                    <h4 class="title text-white">Registered Customers</h4>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-3 wow fadeInUp animation-delay2">
                                <div class="funfact text-center mb-sm-30">
                                    <h2 class="animate-number text-white" data-value="264" data-animation-duration="2000">0</h2>
                                    <h4 class="title text-white">Wedding Events</h4>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-3 wow fadeInUp animation-delay3">
                                <div class="funfact text-center mb-sm-30">
                                    <h2 class="animate-number text-white" data-value="763" data-animation-duration="2000">0</h2>
                                    <h4 class="title text-white">Vendors</h4>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-6 col-md-3 wow fadeInUp animation-delay4">
                                <div class="funfact text-center mb-sm-30">
                                    <h2 class="animate-number text-white" data-value="10565" data-animation-duration="2000">0</h2>
                                    <h4 class="title text-white">Total Visiters</h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section id="events"  data-bg-img="images/bg/bg22.png">
                    <div class="container">
                        <div class="section-title">
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3 text-center pb-30 wow fadeInUp animation-delay1">
                                    <h2>As You Wish Our Story</h2>
                                </div>
                            </div>
                        </div>
                        <div class="section-content text-center">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row multi-row-clearfix">
                                        <div class="products">
                                            <%for (int m = 0; m < 3; m++) {
                                                    String[] fields = (String[]) data.get(m);%>
                                            <div class="col-sm-6 col-md-4 col-lg-4 mb-30">
                                                <div> <img alt="" src="<%=fields[3]%>" class="img-responsive img-circle">
                                                    <div class="overlay"></div>
                                                </div>
                                                <div class="product-details text-center">
                                                    <h3 class="entry-title"><%=fields[1]%>  <img src="images/wedding-ring3.png"> <%=fields[2]%></h3>

                                                    <div>
                                                        <a class="btn btn-default" href="couple_blog.jsp?id=<%=fields[0]%>">View Blog</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <center><a href="blog_list.jsp">View all blogs</a></center>
                        </div>
                    </div>
                </section>

                <!-- Divider: call to action -->
                <section class="divider parallax layer-overlay overlay-white-7" data-stellar-background-ratio="0.5" data-bg-img="images/bg/bg-sm5.jpg">
                    <div class="container pt-120 pb-120">
                        <div class="col-md-12 text-center wow fadeInUp animation-delay1">
                            <i class="fa fa-pied-piper-alt font-72 text-theme-colored"></i>
                            <h2 class="mb-30">We strive to be the best at what we do</h2>
                        </div>
                    </div>
                </section>

                <!-- Section: Blog -->
                <section id="blog" class="divider bg-img-center-bottom" data-bg-img="images/bg/bg14.png">
                    <div class="container">
                        <div class="section-title">
                            <div class="row">
                                <div class="col-md-6 col-md-offset-3 text-center wow fadeInUp animation-delay1">
                                    <h2 class="title pattern-bottom">News Blog</h2>

                                </div>
                            </div>
                        </div>
                        <div class="section-content">
                            <div class="row multi-row-clearfix">
                                <div class="blog-post">
                                    <%int i = 0;
                                        ResultSet rs2 = getCon().createStatement().executeQuery("Select nb.*,ad.name from news_blog nb inner join adminac ad on nb.admin_id=ad.admin_id order by nb.post_id desc");
                                        while (rs2.next() && i < 3) {
                                            i++;
                                    %>
                                    <div class="col-xs-12 col-sm-12 col-md-4 wow fadeInUp animation-delay1">
                                        <article class="post clearfix maxwidth500 mb-40">
                                            <div class="col-sm-12 col-md-12 p-0">
                                                <div class="entry-header">
                                                    <div class="post-thumb">
                                                        <img class="img-fullwidth" alt="" src="<%="admin/" + rs2.getString("nb.image_url")%>" height="220">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-12 p-0">
                                                <div class="entry-content p-30 pl-xs-15 pr-xs-15">
                                                    <h3 class="entry-title sm-inline-block mt-0 mt-sm-30 mt-xs-0 pt-0"><%=rs2.getString("nb.title")%></h3>
                                                    <div class="entry-meta mb-20">
                                                        <span><%=rs2.getString("ad.name")%></span>
                                                        <span><i class="fa fa-comments-o text-theme-colored ml-10"></i> <%=rs2.getString("nb.comments")%>
                                                        </span>
                                                    </div>
                                                    <p class="mb-20"><%=rs2.getString("nb.content")%></p>

                                                </div>
                                            </div>
                                        </article>
                                    </div>
                                    <%}%>

                                </div>

                            </div>
                            <center><a class="text-theme-colored font-13" href="news_blog.jsp">Read more <i class="fa fa-angle-double-right"></i></a></center>
                        </div>
                    </div>
                </section>

                <section id="contests" class="divider bg-img-center-bottom" data-bg-img="images/bg/bg9.png">
                    <div class="container pb-30">
                        <div class="section-title">
                            <div class="row">
                                <%
                                    Calendar now = Calendar.getInstance();
                                    int year = now.get(Calendar.YEAR);
                                    int month = now.get(Calendar.MONTH);
                                    String[] monthName = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"};
                                    if (month == 0) {
                                        year -= 1;
                                        month = 11;
                                    }
                                %>
                                <div class="col-md-8 col-md-offset-2 text-center wow fadeInUp animation-delay1">
                                    <h2 class="title pattern-bottom">Most Popular Couple <%= monthName[month] + " " + year%></h2>

                                </div>
                            </div>
                        </div>
                        <div class="section-content">
                            <div class="row">
                                <div class="col-md-12">
                                    <%
                                        ArrayList images = new ArrayList();
                                        String qu = "select couple_image from contestant where "
                                                + "`contest_id` = (select `contest_id` from contest where year = '" + year + "' and month = '" + month + "')"
                                                + "order by votes desc limit 3";
//                                        
                                        ResultSet rs3 = getCon().createStatement().executeQuery(qu);
                                        while (rs3.next()) {
                                            images.add(rs3.getString("couple_image"));
                                        }%>
                                    <div class="col-sm-6 col-md-4 col-lg-4 mb-30">

                                        <div> <br><br><center><img src="<%=images.get(1)%>" style="vertical-align: bottom" class="img-circle" width="250" height="250"></center>
                                        </div>
                                        <h3 style="position: relative;text-align:center;">1<sup>st</sup> Runner Up</h3>
                                    </div>
                                    <div class="col-sm-6 col-md-4 col-lg-4 mb-30">                                     
                                        <div><center> <img alt="" src="<%=images.get(0)%>" class="img-circle" width="350" height="350"></center>

                                        </div>
                                        <h3 style="position: relative;left: 130px;">Winner</h3>
                                    </div>
                                    <div class="col-sm-6 col-md-4 col-lg-4 mb-30">                                 
                                        <div> <br><br><center><img alt="" src="<%=images.get(2)%>" class="img-circle" width="250" height="250"></center>

                                        </div>
                                        <h3 style="position: relative;left: 100px;">2<sup>nd</sup> Runner Up</h3>
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

        <%@ include file="/static/login_modal.jsp" %>

        <script src="js/custom.js"></script>
        <script src="js/jquery.rustaMsgBox.js"></script>

    </body>

</html>
