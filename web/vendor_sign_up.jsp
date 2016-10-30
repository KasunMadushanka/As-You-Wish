<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config/db_connection.jsp"%>
<%
    String pricing = request.getParameter("pricing");
%>

<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>

        <script src="myjs/vendor_sign_up.js"></script>
        <script src="js/bootstrap-filestyle.js"></script> 
        <script src="myjs/image_upload.js"></script>
        <script src="myjs/email.js"></script>
    </head>

    <body class="">
        <div id="wrapper">
           
            <div id="preloader">
                <div id="spinner">
                    <div class="heart-preloader">
                        <i class="fa fa-heart font-36 infinite animated pulse"></i>
                    </div>
                </div>
            </div>

            <!-- Header -->
               <%@ include file="/static/visitor_header.jsp"%>

            <!-- Start main-content -->
            <div class="main-content">
                <!-- Section: inner-header -->
                <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/bg11.jpg">
                    <div class="container pt-120 pb-50">
                        <!-- Section Content -->
                        <div class="section-content pt-0">
                            <div class="row"> 
                                <div class="col-md-12">
                                    <h3 class="title text-white"><span id="pricing"><%=pricing%></span> Plan Registration</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section>
                    <div class="container">
                        <div class="row">
                            <div class="col-md-10 col-md-offset-1">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#personal-tab" data-toggle="tab">Personal Details</a></li>
                                    <li><a href="#company-tab" data-toggle="tab">Company Details</a></li>
                                    <li><a href="#services-tab" data-toggle="tab">Your Services</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane fade in active p-15" id="personal-tab">
                                        <div class="icon-box mb-0 p-0">
                                            <a href="#" class="icon icon-bordered icon-rounded icon-sm pull-left mb-0 mr-10">
                                                <i class="pe-7s-user"></i>
                                            </a>
                                            <h4 class="text-gray pt-10 mt-0 mb-30">Add your personal details</h4>
                                            <hr>
                                        </div>
                                        <div class="form-group">
                                            <center><img id="output" src="images/user.png" width="150" height="150" class="img-circle"/></center>
                                            <script>
                                                var loadFile = function (event) {
                                                    var output = document.getElementById('output');
                                                    output.src = URL.createObjectURL(event.target.files[0]);
                                                };
                                            </script>
                                        </div>
                                        <div class="form-group">
                                            <form id="form_upload_vendor_profile">
                                                <center><input id="image_url" type="file" class="filestyle" data-input="false" name="file" accept="image/*" onchange="loadFile(event)"></center>
                                            </form>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-1">
                                                <label><b>Title*</b></label>
                                            </div>
                                            <div class="form-group col-md-1">
                                                <label><input id="mr" type="radio" name="title"><b>Mr</b></label>
                                            </div>
                                            <div class="form-group col-md-1">
                                                <label><input id="miss" type="radio" name="title"><b>Miss</b></label>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="first_name"><b>First Name*</b></label>
                                                <input id="first_name" name="first_name" class="form-control" type="text">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="last_name"><b>Last Name*</b></label>
                                                <input id="last_name" name="last_name" class="form-control" type="text">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="mobile"><b>Mobile (+94)*</b></label>
                                                <input id="mobile" name="mobile" onkeypress="check_mobile('mobile',event)" class="form-control" type="text">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="email"><b>Email*</b></label>
                                                <input id="email" name="email" class="form-control" onkeyup="check_email()" type="email">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="address1"><b>Address Line 1*</b></label>
                                                <input id="address1" name="address1" class="form-control" type="text">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="address2"><b>Address Line 2</b></label>
                                                <input id="address2" name="address2" class="form-control" type="text">
                                            </div>                               
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="city"><b>City*</b></label>
                                                <input id="city" name="city" class="form-control" type="text">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="postal_code"><b>Zip/Postal Code</b></label>
                                                <input id="postal_code" name="postal_code" class="form-control" type="text">
                                            </div>                         
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="password"><b>Password*</b></label>
                                                <input id="password" name="password" class="form-control" type="password">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="re-enter_password"><b>Re-enter Password*</b></label>
                                                <input id="re-enter_password" name="re-enter_password" class="form-control" type="password">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="tab-pane fade in p-15" id="company-tab">
                                        <div class="icon-box mb-0 p-0">
                                            <a href="#" class="icon icon-bordered icon-rounded icon-sm pull-left mb-0 mr-10">
                                                <i class="pe-7s-home"></i>
                                            </a>
                                            <h4 class="text-gray pt-10 mt-0 mb-30">Tell us about your business</h4>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <label for="company_name"><b>Company Name*</b></label>
                                                <input id="company_name" name="company_name" class="form-control" type="text">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="company_contact_no"><b>Contact No*</b></label>
                                                <input id="company_contact_no" name="company_contact_no" onkeypress="check_mobile('company_contact_no',event)" class="form-control" type="text">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="company_email"><b>Email</b></label>
                                                <input id="company_email" name="company_email" class="form-control" type="text">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="company_website_url"><b>Web site URL</b></label>
                                                <input id="company_website_url" name="company_website_url" class="form-control" type="text">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="company_fb_page"><b>Facebook Page</b></label>
                                                <input id="company_fb_page" name="company_fb_page" class="form-control" type="email">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="company_address1"><b>Address Line 1*</b></label>
                                                <input id="company_address1" name="company_address1" class="form-control" type="text">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="company_address2"><b>Address Line 2</b></label>
                                                <input id="company_address2" name="company_address2" class="form-control" type="text">
                                            </div>                               
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="company_city"><b>City*</b></label>
                                                <input id="company_city" name="company_city" class="form-control" type="text">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="company_postal_code"><b>Zip/Postal Code</b></label>
                                                <input id="company_postal_code" name="company_postal_code" class="form-control" type="text">
                                            </div>                         
                                        </div>
                                    </div>

                                    <div class="tab-pane fade in p-15" id="services-tab">
                                        <div class="icon-box mb-0 p-0">
                                            <a href="#" class="icon icon-bordered icon-rounded icon-sm pull-left mb-0 mr-10">
                                                <i class="pe-7s-cart"></i>
                                            </a>
                                            <h4 class="text-gray pt-10 mt-0 mb-30">Select what you're going to offer</h4>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <div class="col-xs-6 col-md-4">
                                                <a class="thumbnail">
                                                    <img src="images/event/10.jpg" alt="">
                                                    <label for="reception_hall_checkbox"><b>
                                                            <input id="reception_hall_checkbox" name="reception_hall_checkbox"  onchange="check(this, this.id)" type="checkbox">
                                                            Reception Hall</b>
                                                    </label>
                                                </a>
                                            </div>
                                            <div class="col-xs-6 col-md-4">
                                                <a class="thumbnail">
                                                    <img src="images/event/9.jpg" alt="">
                                                    <label for="cake_designers_checkbox"><b>
                                                            <input id="cake_designers_checkbox" name="cake_designers_checkbox" onchange="check(this, this.id)" type="checkbox"/>
                                                            Cake Designers</b>
                                                    </label>                                     
                                                </a>
                                            </div>
                                            <div class="col-xs-6 col-md-4">
                                                <a class="thumbnail">
                                                    <img src="images/event/2.jpg" alt="">
                                                    <label for="beauticians_checkbox"><b>
                                                            <input id="beauticians_checkbox" name="beauticians_checkbox" onchange="check(this, this.id)" type="checkbox">
                                                            Beauticians</b>
                                                    </label>                                                     
                                                </a>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-6 col-md-4">
                                                <a class="thumbnail">
                                                    <img src="images/event/1.jpg" alt="">
                                                    <label for="bridal_dresses_checkbox"><b>
                                                            <input id="bridal_dresses_checkbox" name="bridal_dresses_checkbox" onchange="check(this, this.id)" type="checkbox">
                                                            Bridal Dresses</b>
                                                    </label>                                                 
                                                </a>
                                            </div>
                                            <div class="col-xs-6 col-md-4">
                                                <a class="thumbnail">
                                                    <img src="images/event/4.jpg" alt="">
                                                    <label for="groom_suits_checkbox"><b>
                                                            <input id="groom_suits_checkbox" name="groom_suits_checkbox" onchange="check(this, this.id)" type="checkbox">
                                                            Groom Suits</b>
                                                    </label>                                                     
                                                </a>
                                            </div>
                                            <div class="col-xs-6 col-md-4">
                                                <a class="thumbnail">
                                                    <img src="images/event/5.jpg" alt="">
                                                    <label for="photography_checkbox"><b>
                                                            <input id="photography_checkbox" name="photography_checkbox" onchange="check(this, this.id)" type="checkbox">
                                                            Photography</b>
                                                    </label>                                                     
                                                </a>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-xs-6 col-md-4">
                                                <a class="thumbnail">
                                                    <img src="images/event/8.jpg" alt="">
                                                    <label for="decorations_checkbox"><b>
                                                            <input id="decorations_checkbox" name="decorations_checkbox" onchange="check(this, this.id)" type="checkbox">
                                                            Poruwa & Decorations</b>
                                                    </label>                                                      
                                                </a>
                                            </div>
                                            <div class="col-xs-6 col-md-4">
                                                <a class="thumbnail">
                                                    <img src="images/event/7.jpg" alt="">
                                                    <label for="ent_groups_checkbox"><b>
                                                            <input id="ent_groups_checkbox" name="ent_groups_checkbox" onchange="check(this, this.id)" type="checkbox">
                                                            Entertainment Groups</b>
                                                    </label>                                                      
                                                </a>
                                            </div>
                                            <div class="col-xs-6 col-md-4">
                                                <a class="thumbnail">
                                                    <img src="images/event/6.jpg" alt="">
                                                    <label for="wedding_cars_checkbox"><b>
                                                            <input id="wedding_cars_checkbox" name="wedding_cars_checkbox" onchange="check(this, this.id)" type="checkbox">
                                                            Wedding Cars<br></b>
                                                    </label>                                                      
                                                </a>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <button id="sign_up_button" class="btn btn-dark btn-theme-colored btn-block mt-15">Sign Up</button>
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
        <script src="js/custom.js"></script>
        <script src="js/jquery.rustaMsgBox.js"></script>
    </body>


</html>
