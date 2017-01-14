<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>
    </head>
    <!-- Header -->
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
                                    <h3 class="title text-white">Help Center</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="divider bg-lightest">
                    <div class="container">

                            <div class="row">
                                <div class="col-md-4">

                                    <center>
                                        <strong style="font-size: 25px;">
                                            Your Profile and Settings
                                        </strong>
                                    </center>
                                    <br>
                                    <center><img src="images/help_center/profile.png" width="220" height="220"></center>
                                    <br>
                                    <p>
                                        Your profile tells who are you to us and community. You can give your relevant 
                                        information to our system needed to interact with you. You have the flexibility to change
                                        them at any time using My Account settings page. Being a member of As You Wish you are 
                                        given many more features to access through out the time you spend with As You Wish.
                                    </p>
                                </div>
                                <div class="col-md-4">

                                    <center>
                                        <strong style="font-size: 25px;">
                                            Blogging
                                        </strong>
                                    </center>
                                    <br>
                                    <center><img src="images/help_center/blogging.png" width="220" height="220"></center>
                                    <br>
                                    <ol type="a">                            
                                        <p>
                                           Blogging enables you to share your memories, challenges faced and and experiences
                                           you get while planning your wedding. You are given a full featured blog to make your
                                           stuff much easier.
                                          </p>
                                    </ol>
                                </div>
                                <div class="col-md-4">

                                    <center>
                                        <strong style="font-size: 25px;">
                                            Your Privacy
                                        </strong>
                                    </center>         
                                    <br>
                                    <center><img src="images/help_center/privacy-policy.png" width="220" height="220"></center>
                                    <br>
                                    <ol type="a">
                                        <li>
                                            You are always secure with As You Wish since we use reliable security techniques
                                            to make sure you are safe. If you want to know more please refer our page
                                            <a href="privacy_policy.jsp">privacy policy</a>
                                        </li>
                                    </ol>
                                </div>
                            </div>
                        <div class="row" style="padding-top: 30px;">
                                
                                <div class="col-md-6">
                                    <center>
                                        <strong style="font-size: 25px;">
                                            Messaging
                                        </strong>
                                    </center>
                                    <br>
                                    <center><img src="images/help_center/messaging.png" width="320" height="220"></center>
                                    <br>
                                    <p>
                                       When it comes to messaging As You Wish provides you a live online chat that brings you, vendors
                                       and us together as well as the email facility. You can resolve what ever issues you have contacting 
                                       us through them.
                                    </p>

                                </div>
                            
                            <div class="col-md-6">

                                    <center>
                                        <strong style="font-size: 25px;">
                                            Troubleshooting
                                        </strong>
                                    </center>      
                                    <br>
                                    <center><img src="images/help_center/pages.png" width="320" height="220"></center>
                                    <br>
                                    <p>
                                       If you experience any technical or any other issue on this web site please contact
                                       us and we are here to help you to resolve them at any time.
                                    </p>
                                </div>
                            </div>

                            </section>
                        </div>

                        <footer id="footer" class="footer pb-0 bg-black-111">
                            <%@ include file="/static/footer.jsp" %>
                        </footer>
                        <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
                    </div>
                    >
                    <script src="js/calendar-events-data.js"></script>
                    <!-- JS | Custom script for all pages -->
                    <script src="js/custom.js"></script>


                    </body>

                    </html>