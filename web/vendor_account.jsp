<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config/db_connection.jsp"%>
<%
    String id = (String) session.getAttribute("id");
%>

<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>

        <script src="myjs/update_vendor.js"></script>
        <script src="js/bootstrap-filestyle.js"></script> 
        <script src="myjs/image_upload.js"></script>
        <script src="myjs/email.js"></script>

    </head>

    <body class="has-side-panel side-panel-left fullwidth-page">

        <%@ include file="/side_panels/vendor_side_panel.jsp"%>

        <div id="wrapper">

            <div id="preloader">
                <div id="spinner">
                    <div class="heart-preloader">
                        <i class="fa fa-heart font-36 infinite animated pulse"></i>
                    </div>
                </div>
            </div>

            <!-- Header -->
            <%@ include file="/static/vendor_header.jsp"%>

            <!-- Start main-content -->
            <div class="main-content">
                <!-- Section: inner-header -->
                <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/bg11.jpg">
                    <div class="container pt-120 pb-50">
                        <!-- Section Content -->
                        <div class="section-content pt-0">
                            <div class="row"> 
                                <div class="col-md-12">
                                    <h3 class="title text-white">My Account</h3>
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
                                            <h4 class="text-gray pt-10 mt-0 mb-30">Edit your personal details</h4>
                                            <hr>
                                        </div>
                                        <%ResultSet rs = getCon().createStatement().executeQuery("Select * from vendor where vendor_id='" + id + "'");
                                            if (rs.first()) {
                                        %>
                                        <div class="form-group">
                                            <center><img id="output" src="<%=rs.getString("image_url")%>" width="150" height="150" class="img-circle"/></center>
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
                                            <%if (rs.getString("title").equals("mr")) {%>
                                            <script>
                                                $("#mr").prop("checked", true);
                                            </script>
                                            <%} else {%>
                                            <script>
                                                $("#miss").prop("checked", true);
                                            </script>
                                            <%}%>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="first_name"><b>First Name*</b></label>
                                                <input id="first_name" name="first_name" class="form-control" type="text" value="<%=rs.getString("first_name")%>">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="last_name"><b>Last Name*</b></label>
                                                <input id="last_name" name="last_name" class="form-control" type="text" value="<%=rs.getString("last_name")%>">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="mobile"><b>Mobile (+94)*</b></label>
                                                <input id="mobile" name="mobile" onkeypress="check_mobile('mobile', event)" class="form-control" type="text" value="<%=rs.getString("mobile")%>">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="email"><b>Email*</b></label>
                                                <input id="email" name="email" class="form-control" onkeyup="check_email()" type="email" value="<%=rs.getString("email")%>" disabled="disabled">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="address1"><b>Address Line 1*</b></label>
                                                <input id="address1" name="address1" class="form-control" type="text" value="<%=rs.getString("address1")%>">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="address2"><b>Address Line 2</b></label>
                                                <input id="address2" name="address2" class="form-control" type="text" value="<%=rs.getString("address2")%>">
                                            </div>                               
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="city"><b>City*</b></label>
                                                <input id="city" name="city" class="form-control" type="text" value="<%=rs.getString("city")%>">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="postal_code"><b>Zip/Postal Code</b></label>
                                                <input id="postal_code" name="postal_code" class="form-control" type="text" value="<%=rs.getString("postal_code")%>">
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
                                                <input id="company_name" name="company_name" class="form-control" type="text" value="<%=rs.getString("company_name")%>">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="company_contact_no"><b>Contact No*</b></label>
                                                <input id="company_contact_no" name="company_contact_no" onkeypress="check_mobile('company_contact_no', event)" class="form-control" type="text" value="<%=rs.getString("company_contact_no")%>">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="company_email"><b>Email</b></label>
                                                <input id="company_email" name="company_email" class="form-control" type="text" value="<%=rs.getString("company_email")%>">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="company_website_url"><b>Web site URL</b></label>
                                                <input id="company_website_url" name="company_website_url" class="form-control" type="text" value="<%=rs.getString("company_website_url")%>">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="company_fb_page"><b>Facebook Page</b></label>
                                                <input id="company_fb_page" name="company_fb_page" class="form-control" type="email" value="<%=rs.getString("company_fb_page")%>">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="company_address1"><b>Address Line 1*</b></label>
                                                <input id="company_address1" name="company_address1" class="form-control" type="text" value="<%=rs.getString("company_address1")%>">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="company_address2"><b>Address Line 2</b></label>
                                                <input id="company_address2" name="company_address2" class="form-control" type="text" value="<%=rs.getString("company_address2")%>">
                                            </div>                               
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="company_city"><b>City*</b></label>
                                                <input id="company_city" name="company_city" class="form-control" type="text" value="<%=rs.getString("company_city")%>">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="company_postal_code"><b>Zip/Postal Code</b></label>
                                                <input id="company_postal_code" name="company_postal_code" class="form-control" type="text" value="<%=rs.getString("company_postal_code")%>">
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
                                                    <label for="service1"><b>
                                                            <input id="service1" name="service1"  onchange="check(this, this.id)" type="checkbox">
                                                            Reception Hall</b>
                                                    </label>
                                                </a>
                                            </div>
                                            <div class="col-xs-6 col-md-4">
                                                <a class="thumbnail">
                                                    <img src="images/event/9.jpg" alt="">
                                                    <label for="service2"><b>
                                                            <input id="service2" name="service2" onchange="check(this, this.id)" type="checkbox"/>
                                                            Cake Designers</b>
                                                    </label>                                     
                                                </a>
                                            </div>
                                            <div class="col-xs-6 col-md-4">
                                                <a class="thumbnail">
                                                    <img src="images/event/2.jpg" alt="">
                                                    <label for="service3"><b>
                                                            <input id="service3" name="service3" onchange="check(this, this.id)" type="checkbox">
                                                            Beauticians</b>
                                                    </label>                                                     
                                                </a>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-xs-6 col-md-4">
                                                <a class="thumbnail">
                                                    <img src="images/event/1.jpg" alt="">
                                                    <label for="service4"><b>
                                                            <input id="service4" name="service4" onchange="check(this, this.id)" type="checkbox">
                                                            Bridal Dresses</b>
                                                    </label>                                                 
                                                </a>
                                            </div>
                                            <div class="col-xs-6 col-md-4">
                                                <a class="thumbnail">
                                                    <img src="images/event/4.jpg" alt="">
                                                    <label for="service5"><b>
                                                            <input id="service5" name="service5" onchange="check(this, this.id)" type="checkbox">
                                                            Groom Suits</b>
                                                    </label>                                                     
                                                </a>
                                            </div>
                                            <div class="col-xs-6 col-md-4">
                                                <a class="thumbnail">
                                                    <img src="images/event/5.jpg" alt="">
                                                    <label for="service6"><b>
                                                            <input id="service6" name="service6" onchange="check(this, this.id)" type="checkbox">
                                                            Photography</b>
                                                    </label>                                                     
                                                </a>
                                            </div>

                                        </div>
                                        <div class="row">
                                            <div class="col-xs-6 col-md-4">
                                                <a class="thumbnail">
                                                    <img src="images/event/8.jpg" alt="">
                                                    <label for="service7"><b>
                                                            <input id="service6" name="service6" onchange="check(this, this.id)" type="checkbox">
                                                            Poruwa & Decorations</b>
                                                    </label>                                                      
                                                </a>
                                            </div>
                                            <div class="col-xs-6 col-md-4">
                                                <a class="thumbnail">
                                                    <img src="images/event/7.jpg" alt="">
                                                    <label for="service8"><b>
                                                            <input id="service8" name="service8" onchange="check(this, this.id)" type="checkbox">
                                                            Entertainment Groups</b>
                                                    </label>                                                      
                                                </a>
                                            </div>
                                            <div class="col-xs-6 col-md-4">
                                                <a class="thumbnail">
                                                    <img src="images/event/6.jpg" alt="">
                                                    <label for="service9"><b>
                                                            <input id="service9" name="service9" onchange="check(this, this.id)" type="checkbox">
                                                            Wedding Cars<br></b>
                                                    </label>                                                      
                                                </a>
                                            </div>
                                        </div>
                                        <%}
                                            ResultSet rs1 = getCon().createStatement().executeQuery("Select service_id from service_registry where vendor_id='" + id + "'");
                                            while (rs1.next()) {%>
                                        <script>
                                            $('#service' +<%=rs1.getString("service_id")%>).prop('checked', true);
                                        </script>
                                        <%}%>
                                        <div class="form-group">
                                            <button id="update_button" class="btn btn-dark btn-theme-colored btn-block mt-15">Save Changes</button>
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
