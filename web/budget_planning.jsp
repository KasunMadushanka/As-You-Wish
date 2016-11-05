<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = "1";
%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>
        <script src="myjs/request.js"></script>
    </head>

    <body class="has-side-panel side-panel-left fullwidth-page">

        <%@ include file="/side_panels/customer_side_panel.jsp"%>

        <div id="wrapper">

            <div id="preloader">
                <div id="spinner">
                    <div class="heart-preloader">
                        <i class="fa fa-heart font-36 infinite animated pulse"></i>
                    </div>
                </div>
            </div>

            <!-- Header -->
            <%@ include file="/static/customer_header.jsp"%>

            <!-- Start main-content -->
            <div class="main-content">
                <!-- Section: inner-header -->
                <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/bg11.jpg">
                    <div class="container pt-120 pb-50">
                        <!-- Section Content -->
                        <div class="section-content pt-0">
                            <div class="row"> 
                                <div class="col-md-12">
                                    <h3 class="title text-white">Tell Us About Your Wedding Plan</h3>                           
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
                                    <li class="active"><a href="#outline-tab" data-toggle="tab">Your Plan</a></li>
                                    <li><a href="#services-tab" data-toggle="tab">Services</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane fade in active p-15" id="outline-tab">
                                        <h4 class="text-gray mt-0 pt-5">Let Us know what's on your mind</h4>
                                        <hr>
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <label for="tradition"><b>Tradition*</b></label>
                                                <select class="form-control" id="tradition" name="tradition">
                                                    <option value="1" >Kandyan</option>
                                                    <option value="2" >Western</option>
                                                    <option value="3" >Tamil</option>
                                                    <option value="3" >Muslim</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <div class="form-group mb-10">
                                                    <label for="date"><b>Date</b></label>
                                                    <input id="date" name="date" class="form-control required date-picker" type="text" placeholder="Wedding Date" aria-required="true">
                                                </div>
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="time"><b>Time</b></label>
                                                <input id="time" name="time" class="form-control" type="text"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-6">
                                                <label for="duration"><b>Duration</b></label>
                                                <input id="duration" name="duration" class="form-control" type="text" placeholder="Hours">
                                            </div>
                                            <div class="form-group col-md-6">
                                                <label for="no_of_guests"><b>Number Of Guests*</b></label>
                                                <input id="no_of_guests" name="no_of_guests" class="form-control" onkeypress="validate_number(event)" type="text"/>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <label for="theme"><b>Theme Preferences</b></label>
                                                <textarea id="theme" name="theme" class="form-control" rows="5"></textarea>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group col-md-12">
                                                <label for="additional_details"><b>Additional Details</b></label>
                                                <textarea id="additional_details" name="additional_details" class="form-control" rows="5"></textarea>
                                            </div>
                                        </div>

                                    </div>
                                    <div class="tab-pane fade in p-15" id="services-tab">
                                        <h4 class="text-gray pt-10 mt-0 mb-30">Select which services you need</h4>
                                        <hr>
                                        <div class="row pt-20">
                                            <div class="col-xs-6 col-md-4">
                                                <div class="card effect__click">
                                                    <div class="card__front bg-theme-colored">
                                                        <img src="images/services/reception_halls.jpg" width="280" height="300">
                                                        <div class="card__text">
                                                            <div class="display-table-parent">
                                                                <div class="display-table">
                                                                    <div class="display-table-cell">
                                                                        <h3 class="icon-box-title text-white">Reception Halls</h3>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card__back" data-bg-color="#e0e0e0">
                                                        <div class="card__text">
                                                            <div class="display-table-parent p-10">
                                                                <div class="display-table">
                                                                    <div class="display-table-cell">
                                                                        <h4 class="text-uppercase"></h4>
                                                                        <div class="form-group">
                                                                            <label for="service1_checkbox"><b>
                                                                                    <input id="service1_checkbox" name="service1_checkbox"  onchange="enable_content('service1_checkbox', 'service1_content')" type="checkbox">
                                                                                    Reception Halls</b>
                                                                            </label>
                                                                        </div>
                                                                        <div id="service1_content">
                                                                            <div class="pl-5 pr-5"> 
                                                                                <select class="form-control" id="service1_type" name="service1_type">
                                                                                    <option value="" disabled selected hidden>Venue</option>
                                                                                    <option value="1" >Any</option>
                                                                                    <option value="2" >Hotel Venue</option>
                                                                                    <option value="3" >Restaurant Hall</option>
                                                                                    <option value="4" >Outdoor Venue</option>
                                                                                    <option value="5" >Historical Venue</option>
                                                                                </select>
                                                                            </div>
                                                                            <div class="pt-5 pl-5 pr-5"> 
                                                                                <select class="form-control" id="service1_city" name="service1_city">
                                                                                    <option value="" disabled selected hidden>Location</option>
                                                                                    <option value="1" >Any</option>
                                                                                    <option value="2" >Colombo</option>
                                                                                    <option value="3" >Gampaha</option>
                                                                                    <option value="4" >Kalutara</option>
                                                                                    <option value="5" >Galle</option>
                                                                                    <option value="6" >Matara</option>
                                                                                    <option value="7" >Hambantota</option>
                                                                                    <option value="8" >Kandy</option>
                                                                                    <option value="9" >Nuwara Eliya</option>
                                                                                    <option value="10" >Matale</option>
                                                                                    <option value="11" >Badulla</option>
                                                                                    <option value="12" >Kurunegala</option>
                                                                                    <option value="13" >Anuradhapura</option>
                                                                                    <option value="14" >Polonnaruwa</option>     
                                                                                    <option value="15" >Monaragala</option>     
                                                                                    <option value="16" >Kegalle</option>
                                                                                    <option value="17" >Ratnapura</option>
                                                                                    <option value="18" >Trincomalee</option>
                                                                                    <option value="19" >Jaffna</option>
                                                                                    <option value="20" >Puttalam</option>
                                                                                </select>
                                                                            </div>
                                                                            <div class="pt-5 pb-5 pl-5 pr-5">
                                                                                <input id="service1_budget" name="service1_budget" class="form-control" placeholder="budget per guest (LKR)" onkeypress="validate_number(event)" type="text">                                        
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label style="position: relative;left: -28px;"><b>Budget:</b></label>
                                                                                <label  for="service1_around_budget_checkbox" style="position: relative;left: 12px;">
                                                                                    <input id="service1_around_budget_checkbox" name="service1_budget_option" type="radio" checked>
                                                                                    <b>Around</b>
                                                                                </label>
                                                                                <label for="service1_below_budget_checkbox" style="position: relative;left: 25px;">
                                                                                    <input id="service1_below_budget_checkbox" name="service1_budget_option" type="radio">
                                                                                    <b>Below</b>
                                                                                </label>        
                                                                                <label style="position: relative;left: -40px;"><b>Decoration:</b></label>
                                                                                <label for="service1_decorations_checkbox1" style="position: relative;left: -27px;">
                                                                                    <input id="service1_decorations_checkbox1" name="service1_decorations_checkbox" type="radio">
                                                                                    <b>Yes</b>
                                                                                </label>
                                                                                <label for="service1_decorations_checkbox2" style="position: relative;left: 14px;">
                                                                                    <input id="service1_decorations_checkbox2" name="service1_decorations_checkbox" type="radio" checked>
                                                                                    <b>No</b>
                                                                                </label>  
                                                                            </div>                                                                               
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-md-4">
                                                <div class="card effect__click">
                                                    <div class="card__front bg-theme-colored">
                                                        <img src="images/services/cake_designers.jpg" width="280" height="300">
                                                        <div class="card__text">
                                                            <div class="display-table-parent">
                                                                <div class="display-table">
                                                                    <div class="display-table-cell">
                                                                        <h3 class="icon-box-title text-white">Cake Designers</h3>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card__back" data-bg-color="#e0e0e0">
                                                        <div class="card__text">
                                                            <div class="display-table-parent p-10">
                                                                <div class="display-table">
                                                                    <div class="display-table-cell">
                                                                        <h4 class="text-uppercase"></h4>
                                                                        <div class="form-group">
                                                                            <label for="service2_checkbox"><b>
                                                                                    <input id="service2_checkbox" name="service2_checkbox"  onchange="enable_content('service2_checkbox', 'service2_content')" type="checkbox">
                                                                                    Cake Designers</b>
                                                                            </label>
                                                                        </div>
                                                                        <div id="service2_content">
                                                                            <div class="pl-5 pr-5"> 
                                                                                <select class="form-control" id="service2_type" name="service2_type" place>
                                                                                    <option value="" disabled selected hidden>Cake design</option>
                                                                                    <option value="1" >Any</option>
                                                                                    <option value="2" >Buttercream</option>
                                                                                    <option value="3" >Elegant</option>
                                                                                    <option value="4" >Floral</option>
                                                                                    <option value="5" >Hall</option>
                                                                                    <option value="4" >Modern</option>
                                                                                    <option value="5" >Vintage</option>
                                                                                </select>
                                                                            </div>
                                                                            <div class="pt-5 pl-5 pr-5"> 
                                                                                <select class="form-control" id="service2_city" name="service2_city">
                                                                                    <option value="" disabled selected hidden>Location</option>
                                                                                    <option value="1" >Any</option>
                                                                                    <option value="2" >Colombo</option>
                                                                                    <option value="3" >Gampaha</option>
                                                                                    <option value="4" >Kalutara</option>
                                                                                    <option value="5" >Galle</option>
                                                                                    <option value="6" >Matara</option>
                                                                                    <option value="7" >Hambantota</option>
                                                                                    <option value="8" >Kandy</option>
                                                                                    <option value="9" >Nuwara Eliya</option>
                                                                                    <option value="10" >Matale</option>
                                                                                    <option value="11" >Badulla</option>
                                                                                    <option value="12" >Kurunegala</option>
                                                                                    <option value="13" >Anuradhapura</option>
                                                                                    <option value="14" >Polonnaruwa</option>     
                                                                                    <option value="15" >Monaragala</option>     
                                                                                    <option value="16" >Kegalle</option>
                                                                                    <option value="17" >Ratnapura</option>
                                                                                    <option value="18" >Trincomalee</option>
                                                                                    <option value="19" >Jaffna</option>
                                                                                    <option value="20" >Puttalam</option>
                                                                                </select>
                                                                            </div>
                                                                            <div class="pt-5 pb-15 pl-5 pr-5">
                                                                                <input id="service2_budget" name="cake_designers_budget" class="form-control" placeholder="budget (LKR)" onkeypress="validate_number(event)" type="text">                                        
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label style="position: relative;left: -28px;"><b>Budget:</b></label>
                                                                                <label  for="service2_around_budget_checkbox" style="position: relative;left: 12px;">
                                                                                    <input id="service2_around_budget_checkbox" name="service2_budget_option" type="radio" checked>
                                                                                    <b>Around</b>
                                                                                </label>
                                                                                <label for="service2_below_budget_checkbox" style="position: relative;left: 25px;">
                                                                                    <input id="service2_below_budget_checkbox" name="service2_budget_option" type="radio">
                                                                                    <b>Below</b>
                                                                                </label>        
                                                                            </div>
                                                                        </div>
                                                                    </div>                                         
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-md-4">
                                                <div class="card effect__click">
                                                    <div class="card__front bg-theme-colored">
                                                        <img src="images/services/beauticians.jpg" width="280" height="300">
                                                        <div class="card__text">
                                                            <div class="display-table-parent">
                                                                <div class="display-table">
                                                                    <div class="display-table-cell">
                                                                        <h3 class="icon-box-title text-white">Beauticians</h3>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card__back" data-bg-color="#e0e0e0">
                                                        <div class="card__text">
                                                            <div class="display-table-parent p-10">
                                                                <div class="display-table">
                                                                    <div class="display-table-cell">
                                                                        <h4 class="text-uppercase"></h4>
                                                                        <div class="form-group">
                                                                            <label for="service3_checkbox"><b>
                                                                                    <input id="service3_checkbox" name="service3_checkbox"  onchange="enable_content('service3_checkbox', 'service3_content')" type="checkbox">
                                                                                    Beauticians</b>
                                                                            </label>
                                                                        </div>
                                                                        <div id="service3_content">
                                                                            <div class="pl-5 pr-5"> 
                                                                                <select class="form-control" id="service3_type" name="service3_type">
                                                                                    <option value="" disabled selected hidden>Your preference</option>
                                                                                    <option value="1" >Any</option>                                                                                                                      
                                                                                </select>
                                                                            </div>
                                                                            <div class="pt-5 pl-5 pr-5"> 
                                                                                <select class="form-control" id="service3_city" name="service3_city">
                                                                                    <option value="" disabled selected hidden>Location</option>
                                                                                    <option value="1" >Any</option>
                                                                                    <option value="2" >Colombo</option>
                                                                                    <option value="3" >Gampaha</option>
                                                                                    <option value="4" >Kalutara</option>
                                                                                    <option value="5" >Galle</option>
                                                                                    <option value="6" >Matara</option>
                                                                                    <option value="7" >Hambantota</option>
                                                                                    <option value="8" >Kandy</option>
                                                                                    <option value="9" >Nuwara Eliya</option>
                                                                                    <option value="10" >Matale</option>
                                                                                    <option value="11" >Badulla</option>
                                                                                    <option value="12" >Kurunegala</option>
                                                                                    <option value="13" >Anuradhapura</option>
                                                                                    <option value="14" >Polonnaruwa</option>     
                                                                                    <option value="15" >Monaragala</option>     
                                                                                    <option value="16" >Kegalle</option>
                                                                                    <option value="17" >Ratnapura</option>
                                                                                    <option value="18" >Trincomalee</option>
                                                                                    <option value="19" >Jaffna</option>
                                                                                    <option value="20" >Puttalam</option>
                                                                                </select>
                                                                            </div>
                                                                            <div class="pt-5 pb-5 pl-5 pr-5">
                                                                                <input id="service3_budget" name="service3_budget" class="form-control" placeholder="budget (LKR)" onkeypress="validate_number(event)" type="text">                                        
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label style="position: relative;left: -28px;"><b>Budget:</b></label>
                                                                                <label  for="service3_around_budget_checkbox" style="position: relative;left: 12px;">
                                                                                    <input id="service3_around_budget_checkbox" name="service3_budget_option" type="radio" checked>
                                                                                    <b>Around</b>
                                                                                </label>
                                                                                <label for="service3_below_budget_checkbox" style="position: relative;left: 25px;">
                                                                                    <input id="service3_below_budget_checkbox" name="service3_budget_option" type="radio">
                                                                                    <b>Below</b>
                                                                                </label>        
                                                                            </div>  
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div class="row pt-20">
                                            <div class="col-xs-6 col-md-4">
                                                <div class="card effect__click">
                                                    <div class="card__front bg-theme-colored">
                                                        <img src="images/services/bridal_dresses.jpg" width="280" height="300">
                                                        <div class="card__text">
                                                            <div class="display-table-parent">
                                                                <div class="display-table">
                                                                    <div class="display-table-cell">

                                                                        <h3 class="icon-box-title text-white">Bridal Dresses</h3>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card__back" data-bg-color="#e0e0e0">
                                                        <div class="card__text">
                                                            <div class="display-table-parent p-10">
                                                                <div class="display-table">
                                                                    <div class="display-table-cell">
                                                                        <h4 class="text-uppercase"></h4>
                                                                        <div class="form-group">
                                                                            <label for="service4_checkbox"><b>
                                                                                    <input id="service4_checkbox" name="service4_checkbox"  onchange="enable_content('service4_checkbox', 'service4_content')" type="checkbox">
                                                                                    Bridal Dresses</b>
                                                                            </label>
                                                                        </div>
                                                                        <div id="service4_content">
                                                                            <div class="pl-5 pr-5"> 
                                                                                <select class="form-control" id="service4_type" name="service4_type">
                                                                                    <option value="" disabled selected hidden>Dress preference</option>
                                                                                    <option value="1" >Any</option>
                                                                                    <option value="2" >Saree</option>
                                                                                    <option value="3" >Ballgown</option>
                                                                                    <option value="4" >A-Line</option>
                                                                                    <option value="5" >Trumpet</option>
                                                                                    <option value="5" >Mermaid</option>
                                                                                    <option value="5" >Sheath</option>
                                                                                </select>
                                                                            </div>
                                                                            <div class="pt-5 pl-5 pr-5"> 
                                                                                <select class="form-control" id="service4_city" name="service4_city">
                                                                                    <option value="" disabled selected hidden>Location</option>
                                                                                    <option value="1" >Any</option>
                                                                                    <option value="2" >Colombo</option>
                                                                                    <option value="3" >Gampaha</option>
                                                                                    <option value="4" >Kalutara</option>
                                                                                    <option value="5" >Galle</option>
                                                                                    <option value="6" >Matara</option>
                                                                                    <option value="7" >Hambantota</option>
                                                                                    <option value="8" >Kandy</option>
                                                                                    <option value="9" >Nuwara Eliya</option>
                                                                                    <option value="10" >Matale</option>
                                                                                    <option value="11" >Badulla</option>
                                                                                    <option value="12" >Kurunegala</option>
                                                                                    <option value="13" >Anuradhapura</option>
                                                                                    <option value="14" >Polonnaruwa</option>     
                                                                                    <option value="15" >Monaragala</option>     
                                                                                    <option value="16" >Kegalle</option>
                                                                                    <option value="17" >Ratnapura</option>
                                                                                    <option value="18" >Trincomalee</option>
                                                                                    <option value="19" >Jaffna</option>
                                                                                    <option value="20" >Puttalam</option>
                                                                                </select>
                                                                            </div>
                                                                            <div class="pt-5 pb-5 pl-5 pr-5">
                                                                                <input id="service4_budget" name="service4_budget" class="form-control" placeholder="budget (LKR)" onkeypress="validate_number(event)" type="text">                                        
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label style="position: relative;left: -28px;"><b>Budget:</b></label>
                                                                                <label  for="service4_around_budget_checkbox" style="position: relative;left: 12px;">
                                                                                    <input id="service4_around_budget_checkbox" name="service4_budget_option" type="radio" checked>
                                                                                    <b>Around</b>
                                                                                </label>
                                                                                <label for="service4_below_budget_checkbox" style="position: relative;left: 25px;">
                                                                                    <input id="service4_below_budget_checkbox" name="service4_budget_option" type="radio">
                                                                                    <b>Below</b>
                                                                                </label>        
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-md-4">
                                                <div class="card effect__click">
                                                    <div class="card__front bg-theme-colored">
                                                        <img src="images/services/groom_suits.jpg" width="280" height="300">
                                                        <div class="card__text">
                                                            <div class="display-table-parent">
                                                                <div class="display-table">
                                                                    <div class="display-table-cell">                                                                    
                                                                        <h3 class="icon-box-title text-white">Groom Suits</h3>                                                                      
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card__back" data-bg-color="#e0e0e0">
                                                        <div class="card__text">
                                                            <div class="display-table-parent p-10">
                                                                <div class="display-table">
                                                                    <div class="display-table-cell">
                                                                        <h4 class="text-uppercase"></h4>
                                                                        <div class="form-group">
                                                                            <label for="service5_checkbox"><b>
                                                                                    <input id="service5_checkbox" name="service5_checkbox"  onchange="enable_content('service5_checkbox', 'service5_content')" type="checkbox">
                                                                                    Groom Suits</b>
                                                                            </label>
                                                                        </div>
                                                                        <div id="service5_content">
                                                                            <div class="pl-5 pr-5"> 
                                                                                <select class="form-control" id="service5_type" name="service5_type">
                                                                                    <option value="" disabled selected hidden>Suit preference</option>
                                                                                    <option value="1" >Any</option>
                                                                                    <option value="2" >Modern Day Suit</option>
                                                                                    <option value="3" >Casual Suit/Jacket</option>
                                                                                    <option value="4" >White Tie and Tails</option>
                                                                                    <option value="5" >Waistcoat & Bow tie/tie</option>
                                                                                    <option value="5" > Slim Cut 3 Piece Suit</option>                                                                                   
                                                                                </select>
                                                                            </div>
                                                                            <div class="pt-5 pl-5 pr-5"> 
                                                                                <select class="form-control" id="service5_city" name="service5_city">
                                                                                    <option value="" disabled selected hidden>Location</option>
                                                                                    <option value="1" >Any</option>
                                                                                    <option value="2" >Colombo</option>
                                                                                    <option value="3" >Gampaha</option>
                                                                                    <option value="4" >Kalutara</option>
                                                                                    <option value="5" >Galle</option>
                                                                                    <option value="6" >Matara</option>
                                                                                    <option value="7" >Hambantota</option>
                                                                                    <option value="8" >Kandy</option>
                                                                                    <option value="9" >Nuwara Eliya</option>
                                                                                    <option value="10" >Matale</option>
                                                                                    <option value="11" >Badulla</option>
                                                                                    <option value="12" >Kurunegala</option>
                                                                                    <option value="13" >Anuradhapura</option>
                                                                                    <option value="14" >Polonnaruwa</option>     
                                                                                    <option value="15" >Monaragala</option>     
                                                                                    <option value="16" >Kegalle</option>
                                                                                    <option value="17" >Ratnapura</option>
                                                                                    <option value="18" >Trincomalee</option>
                                                                                    <option value="19" >Jaffna</option>
                                                                                    <option value="20" >Puttalam</option>
                                                                                </select>
                                                                            </div>
                                                                            <div class="pt-5 pb-5 pl-5 pr-5">
                                                                                <input id="service5_budget" name="service5_budget" class="form-control" placeholder="budget (LKR)" onkeypress="validate_number(event)" type="text">                                        
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label style="position: relative;left: -28px;"><b>Budget:</b></label>
                                                                                <label  for="service5_around_budget_checkbox" style="position: relative;left: 12px;">
                                                                                    <input id="service5_around_budget_checkbox" name="service5_budget_option" type="radio" checked>
                                                                                    <b>Around</b>
                                                                                </label>
                                                                                <label for="service5_below_budget_checkbox" style="position: relative;left: 25px;">
                                                                                    <input id="service5_below_budget_checkbox" name="service5_budget_option" type="radio">
                                                                                    <b>Below</b>
                                                                                </label>        
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-md-4">
                                                <div class="card effect__click">
                                                    <div class="card__front bg-theme-colored">
                                                        <img src="images/services/photography.jpg" width="280" height="300">
                                                        <div class="card__text">
                                                            <div class="display-table-parent">
                                                                <div class="display-table">
                                                                    <div class="display-table-cell">
                                                                        <h3 class="icon-box-title text-white">Photography</h3>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card__back" data-bg-color="#e0e0e0">
                                                        <div class="card__text">
                                                            <div class="display-table-parent p-10">
                                                                <div class="display-table">
                                                                    <div class="display-table-cell">
                                                                        <h4 class="text-uppercase"></h4>
                                                                        <div class="form-group">
                                                                            <label for="service6_checkbox"><b>
                                                                                    <input id="service6_checkbox" name="service6_checkbox"  onchange="enable_content('service6_checkbox', 'service6_content')" type="checkbox">
                                                                                    Photography</b>
                                                                            </label>
                                                                        </div>
                                                                        <div id="service6_content">
                                                                            <div class="pl-5 pr-5"> 
                                                                                <select class="form-control" id="service6_type" name="service6_type">
                                                                                    <option value="" disabled selected hidden>Select your favorite</option>
                                                                                    <option value="1" >Any</option>
                                                                                    <option value="2" >Digital</option>
                                                                                    <option value="3" >Film</option>
                                                                                    <option value="4" >Classic</option>
                                                                                    <option value="5" >Artistic</option>
                                                                                    <option value="5" >Lifestyle</option>
                                                                                    <option value="5" >Dramatic</option>
                                                                                    <option value="5" >Documentory</option>
                                                                                </select>
                                                                            </div>
                                                                            <div class="pt-5 pl-5 pr-5"> 
                                                                                <select class="form-control" id="service6_city" name="service6_city">
                                                                                    <option value="" disabled selected hidden>Location</option>
                                                                                    <option value="1" >Any</option>
                                                                                    <option value="2" >Colombo</option>
                                                                                    <option value="3" >Gampaha</option>
                                                                                    <option value="4" >Kalutara</option>
                                                                                    <option value="5" >Galle</option>
                                                                                    <option value="6" >Matara</option>
                                                                                    <option value="7" >Hambantota</option>
                                                                                    <option value="8" >Kandy</option>
                                                                                    <option value="9" >Nuwara Eliya</option>
                                                                                    <option value="10" >Matale</option>
                                                                                    <option value="11" >Badulla</option>
                                                                                    <option value="12" >Kurunegala</option>
                                                                                    <option value="13" >Anuradhapura</option>
                                                                                    <option value="14" >Polonnaruwa</option>     
                                                                                    <option value="15" >Monaragala</option>     
                                                                                    <option value="16" >Kegalle</option>
                                                                                    <option value="17" >Ratnapura</option>
                                                                                    <option value="18" >Trincomalee</option>
                                                                                    <option value="19" >Jaffna</option>
                                                                                    <option value="20" >Puttalam</option>
                                                                                </select>
                                                                            </div>
                                                                            <div class="pt-5 pb-5 pl-5 pr-5">
                                                                                <input id="service6_budget" name="service6_budget" class="form-control" placeholder="budget (LKR)" onkeypress="validate_number(event)" type="text">                                        
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label style="position: relative;left: -28px;"><b>Budget:</b></label>
                                                                                <label  for="service6_around_budget_checkbox" style="position: relative;left: 12px;">
                                                                                    <input id="service6_around_budget_checkbox" name="service6_budget_option" type="radio" checked>
                                                                                    <b>Around</b>
                                                                                </label>
                                                                                <label for="service6_below_budget_checkbox" style="position: relative;left: 25px;">
                                                                                    <input id="service6_below_budget_checkbox" name="service6_budget_option" type="radio">
                                                                                    <b>Below</b>
                                                                                </label>        
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row pt-20">
                                            <div class="col-xs-6 col-md-4">
                                                <div class="card effect__click">
                                                    <div class="card__front bg-theme-colored">
                                                        <img src="images/services/poruwa.jpg" width="280" height="300">
                                                        <div class="card__text">
                                                            <div class="display-table-parent">
                                                                <div class="display-table">
                                                                    <div class="display-table-cell">

                                                                        <h3 class="icon-box-title text-white">Poruwa & Decorations</h3>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card__back" data-bg-color="#e0e0e0">
                                                        <div class="card__text">
                                                            <div class="display-table-parent p-10">
                                                                <div class="display-table">
                                                                    <div class="display-table-cell">
                                                                        <h4 class="text-uppercase"></h4>
                                                                        <div class="form-group">
                                                                            <label for="service7_checkbox"><b>
                                                                                    <input id="service7_checkbox" name="service7_checkbox"  onchange="enable_content('service7_checkbox', 'service7_content')" type="checkbox">
                                                                                    Poruwa & Decorations</b>
                                                                            </label>
                                                                        </div>
                                                                        <div id="service7_content">
                                                                            <div class="pl-5 pr-5"> 
                                                                                <select class="form-control" id="service7_type" name="service7_type">
                                                                                    <option value="" disabled selected hidden>Poruwa type</option>
                                                                                    <option value="1" >Any</option>
                                                                                    <option value="2" >Natural</option>
                                                                                    <option value="3" >Artificial</option>                                  
                                                                                </select>
                                                                            </div>
                                                                            <div class="pt-5 pl-5 pr-5"> 
                                                                                <select class="form-control" id="service7_city" name="service7_city">
                                                                                    <option value="" disabled selected hidden>Location</option>
                                                                                    <option value="1" >Any</option>
                                                                                    <option value="2" >Colombo</option>
                                                                                    <option value="3" >Gampaha</option>
                                                                                    <option value="4" >Kalutara</option>
                                                                                    <option value="5" >Galle</option>
                                                                                    <option value="6" >Matara</option>
                                                                                    <option value="7" >Hambantota</option>
                                                                                    <option value="8" >Kandy</option>
                                                                                    <option value="9" >Nuwara Eliya</option>
                                                                                    <option value="10" >Matale</option>
                                                                                    <option value="11" >Badulla</option>
                                                                                    <option value="12" >Kurunegala</option>
                                                                                    <option value="13" >Anuradhapura</option>
                                                                                    <option value="14" >Polonnaruwa</option>     
                                                                                    <option value="15" >Monaragala</option>     
                                                                                    <option value="16" >Kegalle</option>
                                                                                    <option value="17" >Ratnapura</option>
                                                                                    <option value="18" >Trincomalee</option>
                                                                                    <option value="19" >Jaffna</option>
                                                                                    <option value="20" >Puttalam</option>
                                                                                </select>
                                                                            </div>
                                                                            <div class="pt-5 pb-5 pl-5 pr-5">
                                                                                <input id="service7_budget" name="service7_budget" class="form-control" placeholder="budget (LKR)" onkeypress="validate_number(event)" type="text">                                        
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label style="position: relative;left: -28px;"><b>Budget:</b></label>
                                                                                <label  for="service7_around_budget_checkbox" style="position: relative;left: 12px;">
                                                                                    <input id="service7_around_budget_checkbox" name="service7_budget_option" type="radio" checked>
                                                                                    <b>Around</b>
                                                                                </label>
                                                                                <label for="service7_below_budget_checkbox" style="position: relative;left: 25px;">
                                                                                    <input id="service7_below_budget_checkbox" name="service7_budget_option" type="radio">
                                                                                    <b>Below</b>
                                                                                </label>        
                                                                            </div>  
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-md-4">
                                                <div class="card effect__click">
                                                    <div class="card__front bg-theme-colored">
                                                        <img src="images/services/entertainment_groups.jpg" width="280" height="300">
                                                        <div class="card__text">
                                                            <div class="display-table-parent">
                                                                <div class="display-table">
                                                                    <div class="display-table-cell">

                                                                        <h3 class="icon-box-title text-white">Entertainment Groups</h3>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card__back" data-bg-color="#e0e0e0">
                                                        <div class="card__text">
                                                            <div class="display-table-parent p-10">
                                                                <div class="display-table">
                                                                    <div class="display-table-cell">
                                                                        <h4 class="text-uppercase"></h4>
                                                                        <div class="form-group">
                                                                            <label for="service8_checkbox"><b>
                                                                                    <input id="service8_checkbox" name="service8_checkbox"  onchange="enable_content('service8_checkbox', 'service8_content')" type="checkbox">
                                                                                    Entertainment Groups</b>
                                                                            </label>
                                                                        </div>
                                                                        <div id="service8_content">
                                                                            <div class="pl-5 pr-5"> 
                                                                                <select class="form-control" id="service8_type" name="service8_type">
                                                                                    <option value="" disabled selected hidden>Select group</option>
                                                                                    <option value="1" >Any</option>
                                                                                    <option value="2" >Singing</option>
                                                                                    <option value="3" >Dancing</option>
                                                                                                                              
                                                                                </select>
                                                                            </div>
                                                                            <div class="pt-5 pl-5 pr-5"> 
                                                                                <select class="form-control" id="service8_city" name="service8_city">
                                                                                    <option value="" disabled selected hidden>Location</option>
                                                                                    <option value="1" >Any</option>
                                                                                    <option value="2" >Colombo</option>
                                                                                    <option value="3" >Gampaha</option>
                                                                                    <option value="4" >Kalutara</option>
                                                                                    <option value="5" >Galle</option>
                                                                                    <option value="6" >Matara</option>
                                                                                    <option value="7" >Hambantota</option>
                                                                                    <option value="8" >Kandy</option>
                                                                                    <option value="9" >Nuwara Eliya</option>
                                                                                    <option value="10" >Matale</option>
                                                                                    <option value="11" >Badulla</option>
                                                                                    <option value="12" >Kurunegala</option>
                                                                                    <option value="13" >Anuradhapura</option>
                                                                                    <option value="14" >Polonnaruwa</option>     
                                                                                    <option value="15" >Monaragala</option>     
                                                                                    <option value="16" >Kegalle</option>
                                                                                    <option value="17" >Ratnapura</option>
                                                                                    <option value="18" >Trincomalee</option>
                                                                                    <option value="19" >Jaffna</option>
                                                                                    <option value="20" >Puttalam</option>
                                                                                </select>
                                                                            </div>
                                                                            <div class="pt-5 pb-5 pl-5 pr-5">
                                                                                <input id="service8_budget" name="service8_budget" class="form-control" placeholder="budget (LKR)" onkeypress="validate_number(event)" type="text">                                        
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label style="position: relative;left: -28px;"><b>Budget:</b></label>
                                                                                <label  for="service8_around_budget_checkbox" style="position: relative;left: 12px;">
                                                                                    <input id="service8_around_budget_checkbox" name="service8_budget_option" type="radio" checked>
                                                                                    <b>Around</b>
                                                                                </label>
                                                                                <label for="service8_below_budget_checkbox" style="position: relative;left: 25px;">
                                                                                    <input id="service8_below_budget_checkbox" name="service8_budget_option" type="radio">
                                                                                    <b>Below</b>
                                                                                </label>        
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-md-4">
                                                <div class="card effect__click">
                                                    <div class="card__front bg-theme-colored">
                                                        <img src="images/services/wedding_cars.jpg" width="280" height="300">
                                                        <div class="card__text">
                                                            <div class="display-table-parent">
                                                                <div class="display-table">
                                                                    <div class="display-table-cell">

                                                                        <h3 class="icon-box-title text-white">Wedding Cars</h3>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="card__back" data-bg-color="#e0e0e0">
                                                        <div class="card__text">
                                                            <div class="display-table-parent p-10">
                                                                <div class="display-table">
                                                                    <div class="display-table-cell">
                                                                        <h4 class="text-uppercase"></h4>
                                                                        <div class="form-group">
                                                                            <label for="service9_checkbox"><b>
                                                                                    <input id="service9_checkbox" name="service9_checkbox"  onchange="enable_content('service9_checkbox', 'service9_content')" type="checkbox">
                                                                                    Wedding Cars</b>
                                                                            </label>
                                                                        </div>
                                                                        <div id="service9_content">
                                                                            <div class="pl-5 pr-5"> 
                                                                                <select class="form-control" id="service9_type" name="service9_type">
                                                                                    <option value="" disabled selected hidden>Car type</option>
                                                                                    <option value="1" >Any</option>
                                                                                    <option value="2" >Modern</option>
                                                                                    <option value="3" >Classic</option>
                                                                                    <option value="4" >Limousin</option>
                                                                                    <option value="5" >Vintage</option>
                                                                                </select>
                                                                            </div>
                                                                            <div class="pt-5 pl-5 pr-5"> 
                                                                                <select class="form-control" id="service9_city" name="service9_city">
                                                                                    <option value="" disabled selected hidden>Location</option>
                                                                                    <option value="1" >Any</option>
                                                                                    <option value="2" >Colombo</option>
                                                                                    <option value="3" >Gampaha</option>
                                                                                    <option value="4" >Kalutara</option>
                                                                                    <option value="5" >Galle</option>
                                                                                    <option value="6" >Matara</option>
                                                                                    <option value="7" >Hambantota</option>
                                                                                    <option value="8" >Kandy</option>
                                                                                    <option value="9" >Nuwara Eliya</option>
                                                                                    <option value="10" >Matale</option>
                                                                                    <option value="11" >Badulla</option>
                                                                                    <option value="12" >Kurunegala</option>
                                                                                    <option value="13" >Anuradhapura</option>
                                                                                    <option value="14" >Polonnaruwa</option>     
                                                                                    <option value="15" >Monaragala</option>     
                                                                                    <option value="16" >Kegalle</option>
                                                                                    <option value="17" >Ratnapura</option>
                                                                                    <option value="18" >Trincomalee</option>
                                                                                    <option value="19" >Jaffna</option>
                                                                                    <option value="20" >Puttalam</option>
                                                                                </select>
                                                                            </div>
                                                                            <div class="pt-5 pb-5 pl-5 pr-5">
                                                                                <input id="service9_budget" name="service9_budget" class="form-control" placeholder="budget (LKR)" onkeypress="validate_number(event)" type="text">                                        
                                                                            </div>
                                                                            <div class="form-group">
                                                                                <label style="position: relative;left: -28px;"><b>Budget:</b></label>
                                                                                <label  for="service9_around_budget_checkbox" style="position: relative;left: 12px;">
                                                                                    <input id="service9_around_budget_checkbox" name="service9_budget_option" type="radio" checked>
                                                                                    <b>Around</b>
                                                                                </label>
                                                                                <label for="service9_below_budget_checkbox" style="position: relative;left: 25px;">
                                                                                    <input id="service9_below_budget_checkbox" name="service9_budget_option" type="radio">
                                                                                    <b>Below</b>
                                                                                </label>        
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <button id="submit_button" type="button" class="btn btn-dark btn-theme-colored btn-block mt-15">Submit Request</button>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

            <script>
                $('#service1_content').find('input,select').attr('disabled', true);
                $('#service2_content').find('input,select').attr('disabled', true);
                $('#service3_content').find('input,select').attr('disabled', true);
                $('#service4_content').find('input,select').attr('disabled', true);
                $('#service5_content').find('input,select').attr('disabled', true);
                $('#service6_content').find('input,select').attr('disabled', true);
                $('#service7_content').find('input,select').attr('disabled', true);
                $('#service8_content').find('input,select').attr('disabled', true);
                $('#service9_content').find('input,select').attr('disabled', true);

            </script>
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
        <script src="js/flipbox.js"></script>
        <script src="js/jquery.rustaMsgBox.js"></script>

    </body>


</html>
