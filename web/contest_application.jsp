<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "config/db_connection.jsp" %>

<%
    String id = request.getParameter("id");

    ResultSet rs = getCon().createStatement().executeQuery("Select* from customer where customer_id='" + id + "'");
%>

<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>

        <script src="js/bootstrap-filestyle.js"></script>  
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

            <!-- Start main-content -->
            <div class="main-content">
                <!-- Section: inner-header -->
                <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/bg11.jpg">
                    <div class="container pt-120 pb-50">
                        <!-- Section Content -->
                        <div class="section-content pt-0">
                            <div class="row"> 
                                <div class="col-md-12">
                                    <h3 class="title text-white">Most Popular Couple - November 2016</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section>
                    <div class="container pt-0">
                        <div class="separator separator-medium-line separator-rouned pt-20">
                                <i class="fa fa-pencil"></i>
                            </div>
                        <%if (rs.first()) {%>
                        <div class="col-md-6">
                            <div class="form-group pt-40">
                                <center><img id="output" src="<%=rs.getString("image_url")%>" width="400" height="400" class="img-circle"/></center>
                                <script>
                                    var loadFile = function (event) {
                                        var output = document.getElementById('output');
                                        output.src = URL.createObjectURL(event.target.files[0]);
                                    };
                                </script>
                            </div>
                            <div class="form-group" >
                                <form id="form_upload_customer_profile">
                                    <center><input id="image_url" type="file" class="filestyle" data-input="false" name="file" accept="image/*" onchange="loadFile(event)"></center>
                                </form>
                            </div>
                            <div class="form-group" style="position: relative;top: 10px;">
                                <button id="submit_button" type="button" class="btn btn-dark btn-theme-colored btn-block mt-15" style="width: 500px;">Submit</button>
                            </div>     
                        </div>
                        <div class="col-md-6 pt-40">   
                            <div class="form-group col-md-12">
                                <label for="mobile"><b>Mobile (+94)*</b></label>
                                <input id="mobile" name="mobile" class="form-control" value="<%=rs.getString("mobile")%>" onkeypress="check_mobile(event)" type="text">
                            </div>
                            <div class="form-group col-md-12">
                                <label for="email"><b>Email*</b></label>
                                <input id="email" name="email" class="form-control" value="<%=rs.getString("email")%>" onkeyup="check_email()" type="email">
                            </div>                                                                                   
                            <div class="form-group col-md-12">
                                <label for="address1"><b>Address Line 1*</b></label>
                                <input id="address1" name="address1" class="form-control" value="<%=rs.getString("address1")%>" placeholder="Street address" type="text">
                            </div>
                            <div class="form-group col-md-12">
                                <label for="address2"><b>Address Line 2</b></label>
                                <input id="address2" name="address2" class="form-control" value="<%=rs.getString("address2")%>" placeholder="Apartment (optional)" type="text">
                            </div>                                                                         
                            <div class="form-group col-md-12">
                                <label for="city"><b>City*</b></label>
                                <input id="city" name="city" class="form-control" value="<%=rs.getString("city")%>" type="text">
                            </div>
                            <div class="form-group col-md-12">
                                <label for="postal_code"><b>Zip/Postal Code</b></label>
                                <input id="postal_code" name="postal_code" class="form-control" value="<%=rs.getString("postal_code")%>" type="text">
                            </div>
                        </div>       
                        <%}%>
                    </div>
                </section>
            </div>
            <!-- end main-content -->

            <!-- Footer -->
            <footer id="footer" class="footer pb-0 bg-black-111">
                <%@ include file="/static/footer.jsp"%>
            </footer>
            <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
        </div>
        <!-- end wrapper -->

        <!-- Footer Scripts -->
        <!-- JS | Custom script for all pages -->
        <script src="js/custom.js"></script>

    </body>

</html>