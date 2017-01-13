<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "config/db_connection.jsp" %>

<%
    String id = (String) session.getAttribute("id");
%>

<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>

        <script src="myjs/update_customer.js"></script>
        <script src="js/bootstrap-filestyle.js"></script>  
        <script src="myjs/image_upload.js"></script>
       
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
                                <div class="tab-content">
                                    <div class="tab-pane fade in active p-15" id="personal-tab">
                                        <div class="icon-box mb-0 p-0">
                                            <a href="#" class="icon icon-bordered icon-rounded icon-sm pull-left mb-0 mr-10">
                                                <i class="pe-7s-user"></i>
                                            </a>
                                            <h4 class="text-gray pt-10 mt-0 mb-30">Edit Your Account Details</h4>
                                            <hr>
                                        </div>
                                        <%ResultSet rs = getCon().createStatement().executeQuery("Select * from customer where customer_id='" + id + "'");
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
                                            <form id="form_upload_customer_profile">
                                                <center><input id="image_url" type="file" class="filestyle" data-input="false" name="file" accept="image/*" onchange="loadFile(event)"></center>
                                            </form>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-1">
                                                <label><b>Title</b></label>
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
                                                <label for="first_name"><b>First Name</b></label>
                                                <input id="first_name" name="first_name" class="form-control" type="text" value="<%=rs.getString("first_name")%>" required>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="last_name"><b>Last Name</b></label>
                                                <input id="last_name" name="last_name" class="form-control" type="text" value="<%=rs.getString("last_name")%>" required>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="partner_first_name"><b>Partner's First Name</b></label>
                                                <input id="partner_first_name" name="partner_first_name" class="form-control" type="text" value="<%=rs.getString("partner_first_name")%>">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="partner_last_name"><b>Partner's Last Name</b></label>
                                                <input id="partner_last_name" name="partner_last_name" class="form-control" type="text" value="<%=rs.getString("partner_last_name")%>">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="mobile"><b>Mobile (+94)</b></label>
                                                <input id="mobile" name="mobile" class="form-control" onkeypress="check_mobile(event)" type="text" value="<%=rs.getString("mobile")%>">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="email"><b>Email*</b></label>
                                                <input id="email" name="email" class="form-control" onkeyup="check_email()" type="email" value="<%=rs.getString("email")%>" disabled="disabled">
                                            </div>                               
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="address1"><b>Address Line 1</b></label>
                                                <input id="address1" name="address1" class="form-control" placeholder="Street address" type="text" value="<%=rs.getString("address1")%>">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="address2"><b>Address Line 2</b></label>
                                                <input id="address2" name="address2" class="form-control" placeholder="Apartment (optional)" type="text" value="<%=rs.getString("address2")%>">
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
                                                <label for="password"><b>New Password</b></label>
                                                <input id="password" name="password" class="form-control" type="password">                                           
                                            </div>                               
                                            <div class="form-group col-md-6">
                                                <label for="re-enter_password"><b>Re-enter Password</b></label>
                                                <input id="re-enter_password" name="re-enter_password" class="form-control" type="password" >
                                            </div>
                                        </div>
                                        <%}%>
                                        <div class="row">
                                            <span id="password_check"></span>
                                        </div>
                                        <div class="form-group">
                                            <button id="update_button" type="button" class="btn btn-dark btn-theme-colored btn-block mt-15">Save Changes</button>
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
                <%@ include file="/static/footer.jsp"%>
            </footer>>
            <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
        </div>
        <!-- end wrapper -->

        <!-- Footer Scripts -->
        <!-- JS | Custom script for all pages -->
        <script src="js/custom.js"></script>
        <script src="js/jquery.rustaMsgBox.js"></script>
    </body>

</html>
