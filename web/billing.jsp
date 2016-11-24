<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "config/db_connection.jsp" %>

<%
    String id = request.getParameter("id");
    session.setAttribute("id", id);

    ResultSet rs = getCon().createStatement().executeQuery("Select pricing from vendor where vendor_id='" + id + "'");
    if (rs.first()) {
        session.setAttribute("pricing", rs.getString("pricing"));
    }
%>

<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>

        <script src="myjs/process_payment.js"></script>
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

            <header id="header" class="header">
                <div class="header-nav navbar-fixed-top header-dark navbar-white navbar-transparent navbar-sticky-animated animated-active">
                    <div class="header-nav-wrapper">
                        <div class="container">
                            <nav>
                                <div id="menuzord-right" class="menuzord red"> <a class="menuzord-brand pull-left flip font-playball text-theme-colored font-32" href="javascript:void(0)"><i class="fa fa-heart-o font-25"></i> As You Wish <i class="fa fa-heart-o font-25"></i></a>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </header>

            <div class="main-content">
                <!-- Section: inner-header -->
                <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/bg11.jpg">
                    <div class="container pt-120 pb-50">
                        <!-- Section Content -->
                        <div class="section-content pt-0">
                            <div class="row"> 
                                <div class="col-md-12">
                                    <h3 class="title text-white">Billing Details</h3>                           
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section>
                    <div class="container">
                        <div class="section-content">
                            <h3>Payment Information</h3>
                            <div class="payment-method">

                                <section>
                                    <br><hr>
                                    <label class="radio-inline">
                                        <input type="hidden" id="price" name="price">
                                        <input type="radio" name="rad" id="rad" value="visa" style=" padding:0px;margin-top: 15px;vertical-align:middle;"> <i class="fa fa-cc-visa fa-3x" aria-hidden="true" style=" vertical-align:bottom;" ></i>
                                    </label>
                                    <label class="radio-inline">
                                        <input type="radio" name="rad" id="rad" value="mastercard" style=" padding:0px;margin-top: 15px;vertical-align:middle;" ><i class="fa fa-cc-mastercard  fa-3x" aria-hidden="true" style=" vertical-align:bottom;"></i>
                                    </label>
                                    <br><hr>
                                </section>

                                <section>
                                    <input class="form-control" type="text" name="card_holder_name" id="card_holder_name" placeholder="Name on card">
                                    <br>
                                </section>

                                <div class="row">
                                    <div class="col-md-10">
                                        <input class="form-control" type="text" name="card_number" id="card_number" onkeypress="check_card_number(event)" placeholder="Card number">
                                    </div>
                                    <div class="col-md-2">
                                        <input class="form-control" type="text" name="cvv" id="cvv" onkeypress="check_cvv(event)" placeholder="CVV">
                                    </div>
                                    <br>
                                </div>

                                <div class="row">
                                    <br>
                                    <div class="col-md-2"> <p style="vertical-align: center"><b>Expiration date:</b></p></div>
                                    <div class="col-md-3">
                                        <select class="form-control" id="month" name="month">
                                            <option disabled="" selected="" value="0">Month</option>
                                            <option value="1">January</option>
                                            <option value="1">February</option>
                                            <option value="3">March</option>
                                            <option value="4">April</option>
                                            <option value="5">May</option>
                                            <option value="6">June</option>
                                            <option value="7">July</option>
                                            <option value="8">August</option>
                                            <option value="9">September</option>
                                            <option value="10">October</option>
                                            <option value="11">November</option>
                                            <option value="12">December</option>
                                        </select>
                                        <i></i>
                                    </div>
                                    <div class="col-md-3">
                                        <input class="form-control" type="number" placeholder="Year" id="year" name="year" value="2016">
                                    </div>
                                    <div class="col-md-4">
                                        <div class="text-right"> <button class="btn btn-lg btn-theme-colored" onclick="process_payment()">Proceed</button></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>


            <!-- Footer -->
            <footer id="footer" class="footer pb-0 bg-black-111">
                <%@ include file="/static/footer.jsp" %>
            </footer>
            <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
        </div>

        <script src="js/custom.js"></script>
        <script src="js/jquery.rustaMsgBox.js"></script>
    </body>

</html>
