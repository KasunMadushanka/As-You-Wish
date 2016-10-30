<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config/db_connection.jsp"%>

<%
    String id = request.getParameter("id");
    String service = request.getParameter("service");

    String company_name = null;

    ResultSet rs = getCon().createStatement().executeQuery("Select company_name from vendor where vendor_id='" + id + "'");
    if (rs.first()) {
        company_name = rs.getString("company_name");
    }

    if (session.getAttribute("type") == null) {
        session.setAttribute("type", "visitor");
    }

    session.setAttribute("page", "storefront");
    session.setAttribute("service_id", service);

    String contact_no = null, email = null, website_url = null, working_hours = null, address1 = null, address2 = null, city = null, about = null, vision = null, map_type = null;
    double latitude = 0, longitude = 0;
    int zoom_level = 0;

    ResultSet rs1 = getCon().createStatement().executeQuery("Select*  from service_registry where vendor_id='" + id + "' and service_id='" + service + "'");
    if (rs1.first()) {

        contact_no = rs1.getString("contact_no");
        email = rs1.getString("email");
        website_url = rs1.getString("website_url");
        working_hours = rs1.getString("working_hours");
        address1 = rs1.getString("address1");
        address2 = rs1.getString("address2");
        city = rs1.getString("city");
        about = rs1.getString("about");
        vision = rs1.getString("vision");
        latitude = rs1.getDouble("latitude");
        longitude = rs1.getDouble("longitude");
        zoom_level = (int) rs1.getInt("zoom_level");
        map_type = rs1.getString("map_type");

    }

    ArrayList blog_data = new ArrayList();

    ResultSet rs2 = getCon().createStatement().executeQuery("Select* from vendor_blog where vendor_id='" + id + "' and service_id='" + service + "'");
    while (rs2.next()) {

        String data[] = new String[7];

        data[0] = rs2.getString("date");
        data[1] = rs2.getString("time");
        data[2] = rs2.getString("title");
        data[3] = rs2.getString("content");
        data[4] = rs2.getString("image_url");
        data[5] = rs2.getString("comments");
        data[6] = rs2.getString("likes");

        blog_data.add(data);

    }

    ArrayList plans = new ArrayList();

    ResultSet rs3 = getCon().createStatement().executeQuery("Select* from vendor_pricing where pricing_id='" + id + "'");
    while (rs3.next()) {

        String[] plan = new String[2];

        plan[0] = rs3.getString("package_id");
        plan[1] = rs3.getString("title");

        plans.add(plan);
    }

    session.setAttribute("pricing_plans", plans);

%>

<!DOCTYPE html>
<html dir="ltr" lang="en">


    <head>
        <%@ include file="/static/head.jsp" %>

        <script src="myjs/update_storefront.js"></script>
        <script src="myjs/upload.js"></script>
        <script src="myjs/email.js"></script>   

        <script src = "https://maps.googleapis.com/maps/api/js?key=AIzaSyAfQ3cmkPUoYxnF_ogbX1WhbhCjZmJwKjs&sensor=false"></script>
        <script>
            latitude_value = '<%=latitude%>';
            longitude_value = '<%=longitude%>';
            zoom_level_value =<%=zoom_level%>;
            map_type = '<%=map_type%>';

            function initialize() {
                var mapOptions = {
                    center: new google.maps.LatLng(latitude_value, longitude_value),
                    zoom: zoom_level_value,
                    mapTypeId: google.maps.MapTypeId.map_type
                };
                var map = new google.maps.Map(
                        document.getElementById("map-canvas"),
                        mapOptions);
            }
            google.maps.event.addDomListener(window, 'load', initialize);

        </script>

    </head>

    <body class="has-side-panel side-panel-left fullwidth-page">

        <% if (session.getAttribute("type").equals("customer")) {%>
        <%@ include file="/side_panels/customer_side_panel.jsp"%>
        <%} else if (session.getAttribute("type").equals("vendor")) {%>
        <%@ include file="/side_panels/vendor_side_panel.jsp"%>
        <%}%> 

        <div id="wrapper" class="clearfix">

            <div id="preloader">
                <div id="spinner">
                    <div class="heart-preloader">
                        <i class="fa fa-heart font-36 infinite animated pulse"></i>
                    </div>
                </div>
            </div>

            <!-- Header -->
            <%if (session.getAttribute("type").equals("customer")) {%>
            <%@ include file="/static/customer_header.jsp"%>
            <%} else if (session.getAttribute("type").equals("vendor")) {%>
            <%@ include file="/static/vendor_header.jsp"%>
            <%} else if (session.getAttribute("type").equals("visitor")) {%>
            <%@ include file="/static/visitor_header.jsp"%>
            <%}%>

            <!-- Start main-content -->
            <div class="main-content">
                <!-- Section: inner-header -->
                <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/bg11.jpg">
                    <div class="container pt-120 pb-50">
                        <!-- Section Content -->
                        <div class="section-content pt-0">
                            <div class="row"> 
                                <div class="col-md-12">
                                    <h3 class="title text-white"><%=company_name%></h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section id="contact" class="divider bg-img-center-bottom" data-bg-img="images/bg/bg14.png">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-12 col-md-7">
                                <div class="image-carousel">
                                    <div class="item">
                                        <div class="thumb">
                                            <img src="images/bg/1.jpg" height="350">
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="thumb">
                                            <img src="images/bg/2.jpg" height="350">
                                        </div>
                                    </div>
                                    <div class="item">
                                        <div class="thumb">
                                            <img src="images/bg/3.jpg" height="350">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div id="map-canvas" class="col-sm-offset-9" style="width:300px;height:250px;"></div>

                            <div>
                                <div class="col-sm-offset-9">
                                    <div class="widget">
                                        <h4>Contact Details</h4>
                                        <ul class="xs-text-center mt-5">
                                            <li> <i class="fa fa-phone text-theme-colored mr-10"></i><span id="contact_no_content">+94 <%=contact_no%></span></li>
                                            <li> <i class="fa fa-envelope text-theme-colored mr-10"></i><span id="email_content"><%=email%></span></li>
                                            <li> <i class="fa fa-globe text-theme-colored mr-10"></i><span id="website_url_content"><a href="<%=website_url%>">Visit our web site</a></span></li>
                                            <li> <i class="fa fa-clock-o text-theme-colored mr-10"></i><span id="working_hours_content"><%=working_hours%></span></li>
                                            <li> <i class="fa fa-map-marker text-theme-colored mr-10"></i><span id="address_content"><%=address1%>, <%=address2%>, <%=city%></span></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="row">
                            <div class="section-title">
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3 text-center pb-30 wow fadeInUp animation-delay1">
                                        <h2>About Us</h2>
                                        <img src="images/section-title-after.png" alt="">
                                        <div id="about_content">
                                            <p><%=about%></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="section-title">
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3 text-center pb-30 wow fadeInUp animation-delay1">
                                        <h2>Our Vision</h2>
                                        <img src="images/section-title-after.png" alt="">
                                        <div id="vision_content">
                                            <p><%=vision%></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section>
                    <div class="container">
                        <div class="row">
                            <div class="section-title">
                                <div class="row">
                                    <div class="col-md-6 col-md-offset-3 text-center pb-30 wow fadeInUp animation-delay1">
                                        <h2>Pricing Plans</h2>
                                        <img src="images/section-title-after.png" alt="">
                                        <p>These are our pricing plans including all the modern features for your wedding.</p>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <%
                                ResultSet rs4 = getCon().createStatement().executeQuery("Select pr.title,pr.description,pr.price,pr.features from service_registry r left join vendor_package p on r.registry_id=p.registry_id left join vendor_pricing pr on p.package_id=pr.package_id where r.vendor_id='" + id + "' and r.service_id='" + service + "'");
                                while (rs4.next()) {
                            %>
                            <div class="col-xs-12 col-sm-3 col-md-3 hvr-float-shadow mb-sm-30">
                                <div class="pricing-table style1 bg-white-light border-10px text-center">
                                    <div class="pt-40 pb-60">                                    
                                        <h4 class="package-type"><%=rs4.getString("pr.title")%> Package</h4>
                                        <h3 class="price text-theme-colored mb-10"><span class="font-30">LKR </span><%=rs4.getString("pr.price")%></h3>
                                        <ul class="table-list bg-lightest pl-0">
                                            <%String[] features = rs4.getString("pr.features").split("/");
                                                for (int i = 0; i < features.length; i++) {
                                            %>
                                            <li><%=features[i]%></li>          
                                                <%}
                                                %>                                                                                                            
                                        </ul>
                                        <a class="btn btn-colored btn-theme-colored text-uppercase" href="#">Contact Now</a><br>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </section>
            </div>

            <section class="divider bg-lightest">
                <div class="row">
                    <div class="section-title">
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3 text-center pb-30 wow fadeInUp animation-delay1">
                                <h2>Event Calendar</h2>
                                <img src="images/section-title-after.png" alt="">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="section-content text-center">
                        <div class="row">
                            <div class="col-md-12">
                                <div id="full-event-calendar"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section id="gallery" class="bg-lighter">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3 text-center pb-30 wow fadeInUp animation-delay1">
                        <h2>Wedding Gallery</h2>
                        <img src="images/section-title-after.png">
                    </div>
                </div>
                <div class="container-fluid p-0">
                    <div class="section-content">
                        <div class="row">
                            <div class="col-md-12"> 

                                <!-- Portfolio Gallery Grid -->
                                <div id="grid" class="portfolio-gallery masonry grid-4 clearfix" data-lightbox="gallery">

                                    <!-- Portfolio Item Start -->
                                    <%for (int i = 1; i <= 8; i++) {%>
                                    <div class="portfolio-item">
                                        <a href="images/gallery/<%=i%>.jpg" data-lightbox="gallery-item" title="Title Here 1">
                                            <div class="thumb">
                                                <img class="img-fullwidth photo" src="images/gallery/<%=i%>.jpg" alt="project">
                                                <div class="overlay-shade"></div>
                                                <div class="text-holder">
                                                    <div class="title text-center">Wedding</div>
                                                </div>
                                                <div class="icons-holder">
                                                    <div class="icons-holder-inner">
                                                        <div class="social-icons icon-sm icon-dark icon-circled icon-theme-colored">
                                                            <i class="fa fa-plus text-white"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <%}%>
                                    <!-- Portfolio Item End -->

                                </div>
                                <!-- End Portfolio Gallery Grid --> 
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <section id="blog" class="divider bg-img-center-bottom" data-bg-img="images/bg/bg14.png">
                <div class="container">
                    <div class="section-title">
                        <div class="row">
                            <div class="col-md-6 col-md-offset-3 text-center wow fadeInUp animation-delay1">
                                <h2 class="title pattern-bottom">News Blog</h2>
                                <img src="images/section-title-after.png" alt="">
                                <p>So while it might seem impossible to sum up your ridiculously amazing, complicated, and fantastic wedding</p>
                            </div>
                        </div>
                    </div>
                    <div class="section-content">
                        <div class="row multi-row-clearfix">
                            <div class="blog-post">
                                <%
                                    int count = 0;
                                    if (blog_data.size() < 3) {
                                        count = blog_data.size();
                                    } else {
                                        count = 3;
                                    }
                                    for (int i = 0; i < count; i++) {
                                        String[] data = (String[]) blog_data.get(i);
                                %>

                                <div class="col-xs-12 col-sm-12 col-md-4 wow fadeInUp animation-delay1">
                                    <article class="post clearfix maxwidth500 mb-40">
                                        <div class="col-sm-12 col-md-12 p-0">
                                            <div class="entry-header">
                                                <div class="post-thumb">
                                                    <img class="img-responsive img-fullwidth" alt="" src="images/blog/blog-img1.jpg">
                                                </div>
                                                <div class="entry-date text-center font-playball">
                                                    <span><i class="fa fa-thumbs-o-up font-24 font-24"></i></span><br><%=data[5]%>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-12 p-0">
                                            <div class="entry-content p-30 pl-xs-15 pr-xs-15">
                                                <h3 class="entry-title sm-inline-block mt-0 mt-sm-30 mt-xs-0 pt-0"><a href="#"><%=data[2]%></a></h3>
                                                <div class="entry-meta mb-20">
                                                    <span>By Admin </span>
                                                    <span><i class="fa fa-comments-o text-theme-colored ml-10"></i><%=data[6]%>
                                                    </span>
                                                    <p><%=data[0]%> | <%=data[1]%></p>
                                                </div>
                                                <p class="mb-20"><%=data[3]%></p>
                                                <a class="text-theme-colored font-13" href="vendor_blog.jsp?id=<%=id%>&service=<%=service%>">Read more<i class="fa fa-angle-double-right"></i></a>
                                            </div>
                                        </div>
                                    </article>
                                </div>
                                <%}%>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <%if (!session.getAttribute("type").equals("vendor")) {%>  
            <section>
                <div class="row">
                    <div class="col-md-6 col-md-offset-3 text-center pb-30 wow fadeInUp animation-delay1">
                        <h2>Leave A Message</h2>
                        <img src="images/section-title-after.png" alt="">
                    </div>
                </div>
                <div>
                    <div class="container pt-0">
                        <div class="row">
                            <div class="col-md-12">
                                <!-- Contact Form -->
                                <form id="contact_form" name="contact_form">
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="form_subject">Subject</label>
                                                <input id="form_subject" name="form_subject" class="form-control required" type="text" placeholder="Enter Subject">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="form_message">Message</label>
                                        <textarea id="form_message" name="form_message" class="form-control required" rows="5" placeholder="Enter Message"></textarea>
                                    </div>
                                    <div class="form-group text-center">
                                        <input id="form_botcheck" name="form_botcheck" class="form-control" type="hidden" value="" />
                                        <button type="button" class="btn btn-dark btn-theme-colored btn-flat mr-5" onclick="send_email($('#email_content').html(), 'customer_message')">Send your message</button>
                                        <button type="reset" class="btn btn-default btn-flat btn-theme-colored">Reset</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <%}%>

        </div>
        <!-- end main-content -->

        <%if (session.getAttribute("type").equals("customer")) {%>
        <%@ include file="/static/customer_modal.jsp"%>
        <%} else if (session.getAttribute("type").equals("vendor")) {%>
        <%@ include file="/static/vendor_modal.jsp"%>
        <%}%>

        <!-- Footer -->
        <footer id="footer" class="footer pb-0 bg-black-111">
            <%@ include file="/static/footer.jsp" %>
        </footer>
        <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
    </div>

    <script src="js/calendar-events-data.js"></script>

    <script src="js/custom.js"></script>
    <script src="js/jquery.rustaMsgBox.js"></script>


</body>


</html>
