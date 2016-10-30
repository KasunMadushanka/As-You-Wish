<%@page import="java.util.ArrayList"%>
<link href="css/vendor_modal.css" rel="stylesheet" type="text/css">  
<script src="js/vendor_modal.js"></script>  
<script src="myjs/visitor_sign_in.js"></script>  

<%
    String current_page = (String) session.getAttribute("page");
    String service_id = (String) session.getAttribute("service_id");
%>

<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" align="center">
                <button id="close_button" type="button" class="close" aria-label="Close">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                </button>
            </div>

            <!-- Begin # DIV Form -->
            <div id="div-forms">

                <div id="slider_form" style="display: none;">
                    <div class="modal-body">
                        <div class="form-group" align="center">
                            <h4 class="text-gray pt-10 mt-0 mb-30">Customize your sliding images</h4>
                        </div>
                        <div class="form-group" align="center">
                            <img id="output1" src="images/bg/bg11.jpg" height="300" width="550">
                        </div>
                        <div class="form-group" align="center">
                            <form id="form_upload1">
                                <input id="file1" type="file" class="filestyle" data-input="false" accept="image/*" onchange="loadFile1(event)">
                            </form>
                            <script>
                                var loadFile1 = function (event) {
                                    var output = document.getElementById('output1');
                                    output.src = URL.createObjectURL(event.target.files[0]);
                                };
                            </script>
                        </div>
                        <div class="form-group" align="center">
                            <img id="output2" src="images/bg/bg11.jpg" height="300" width="550">
                        </div>
                        <div class="form-group" align="center">
                            <form id="form_upload2">
                                <input id="file2" type="file" class="filestyle" data-input="false" accept="image/*" onchange="loadFile2(event)">
                            </form>
                            <script>
                                var loadFile2 = function (event) {
                                    var output = document.getElementById('output2');
                                    output.src = URL.createObjectURL(event.target.files[0]);
                                };
                            </script>
                        </div>
                        <div class="form-group" align="center">
                            <img id="output3" src="images/bg/bg11.jpg" height="300" width="550">
                        </div>
                        <div class="form-group" align="center">
                            <form id="form_upload3">
                                <input id="file3" type="file" class="filestyle" data-input="false" accept="image/*" onchange="loadFile3(event)">
                            </form>
                            <script>
                                var loadFile3 = function (event) {
                                    var output = document.getElementById('output3');
                                    output.src = URL.createObjectURL(event.target.files[0]);
                                };
                            </script>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-dark btn-theme-colored btn-flat mr-5" data-loading-text="Please wait...">Send your message</button>
                            <button type="reset" class="btn btn-default btn-flat btn-theme-colored">Reset</button>
                        </div>
                    </div>

                </div>

                <div id="about_form" style="display:none">
                    <div class="modal-body">
                        <label for="about_text">About Us:</label>
                        <textarea id="about_text" name="about_text" class="form-control" rows="10" placeholder=""></textarea>
                    </div>
                    <div class="modal-footer">
                        <div class="form-group text-center">
                            <button type="button" onclick="update_about()" class="btn btn-dark btn-theme-colored btn-flat mr-5">Apply Changes</button>
                            <button type="reset" class="btn btn-default btn-flat btn-theme-colored">Reset</button>
                        </div>
                    </div>
                </div>

                <div id="vision_form" style="display: none;">
                    <div class="modal-body">
                        <label for="vision_text">Our Vision:</label>
                        <textarea id="vision_text" name="vision_text" class="form-control" rows="5" placeholder=""></textarea>
                    </div>
                    <div class="modal-footer">
                        <div class="form-group text-center">
                            <button type="button" onclick="update_vision()" class="btn btn-dark btn-theme-colored btn-flat mr-5">Apply Changes</button>
                            <button type="reset" class="btn btn-default btn-flat btn-theme-colored">Reset</button>
                        </div>
                    </div>
                </div>

                <form id="location_form" style="display: none;">
                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="latitude">Latitude:</label>
                                <input id="latitude" name="latitude" class="form-control" type="text">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="longitude">Longitude:</label>
                                <input id="longitude" name="longitude" class="form-control" type="text">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="zoom_level">Zoom Level:</label>
                                <input id="zoom_level" name="zoom_level" class="form-control" type="text">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="map_type">Map Type:</label>
                                <select class="form-control" id="map_type" name="map_type">
                                    <option value="1" >Road Map</option>
                                    <option value="2" >Satellite</option>
                                    <option value="3" >Hybrid</option>
                                    <option value="4" >Terrain</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="form-group text-center">
                            <button type="button" onclick="update_location()" class="btn btn-dark btn-theme-colored btn-flat mr-5">Apply Changes</button>
                            <button type="reset" class="btn btn-default btn-flat btn-theme-colored">Reset</button>
                        </div>
                    </div>
                </form>

                <form id="contact_form" style="display: none;">
                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="contact_no">Contact No:</label>
                                <input id="contact_no" name="contact_no" class="form-control" type="text">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="email">Email:</label>
                                <input id="email" name="email" class="form-control" type="text">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="website_url">Website URL:</label>
                                <input id="website_url" name="website_url" class="form-control" type="text">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="working_hours">Working Hours:</label>
                                <input id="working_hours" name="working_hours" class="form-control" type="text">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="address1">Address Line 1:</label>
                                <input id="address1" name="address1" class="form-control" type="text">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="address2">Address Line 2:</label>
                                <input id="address2" name="address2" class="form-control" type="text">
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group col-md-12">
                                <label for="city">City:</label>
                                <input id="city" name="city" class="form-control" type="text">
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="form-group text-center">
                            <button type="button" onclick="update_contact()" class="btn btn-dark btn-theme-colored btn-flat mr-5">Apply Changes</button>
                            <button type="reset" class="btn btn-default btn-flat btn-theme-colored">Reset</button>
                        </div>
                    </div>
                </form>

                <%if (current_page.equals("storefront")) {
                        ArrayList plans_list = (ArrayList) session.getAttribute("pricing_plans");
                %>
                <form id="pricing_form" style="display: none;">
                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group col-md-9">
                                <input id="new_plan" name="new_plan" class="form-control" type="text" placeholder="New Plan Title">
                            </div>
                            <div class="form-group col-md-3">
                                <button type="button" onclick="add_plan()" class="btn btn-dark btn-theme-colored btn-lg btn-block">Add Plan</button>
                                <script>
                                    function add_plan() {
                                        option = new Option($('#new_plan').val(),<%=(plans_list.size() + 1)%>);
                                        $(option).html($('#new_plan').val());
                                        $("#pricing_plans").append(option);
                                    }
                                </script>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group col-md-9">

                                <select class="form-control" id="pricing_plans">
                                    <%for (int i = 0; i < plans_list.size(); i++) {
                                            String[] values = (String[]) plans_list.get(i);%>
                                    <option value="<%=values[0]%>"><%=values[1]%></option>
                                    <%}%>
                                </select>    
                            </div>
                            <div class="form-group col-md-3">
                                <button type="button" onclick="remove_plan()" class="btn btn-dark btn-theme-colored btn-lg btn-block">Remove</button>
                                <script>
                                    function remove_plan() {
                                        $('option:selected','#pricing_plans').remove();
                                    }
                                </script>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="features"><b>Features:</b></label>
                            <textarea id="features" name="features" class="form-control" rows="8" placeholder="Add New Features"></textarea>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <div class="form-group text-center">
                            <button type="button" onclick="update_pricing()" class="btn btn-dark btn-theme-colored">Apply Changes</button>
                            <button type="reset" class="btn btn-dark btn-theme-colored">Reset</button>
                        </div>
                    </div>
                </form>
                <%}%>


                <form id="calendar_form" style="display: none;">
                    <div class="modal-body">
                    </div>
                    <div class="modal-footer">

                    </div>
                </form>

                <div id="gallery_form" style="display: none;">
                    <div class="modal-body">
                        <img id="gallery_image"/>
                        <script>
                            var loadFile4 = function (event) {
                                var output = document.getElementById('gallery_image');
                                output.src = URL.createObjectURL(event.target.files[0]);
                            };
                        </script>
                    </div>
                    <div class="modal-footer">
                        <div class="form-group text-center">
                            <form id="form_upload_vendor_gallery">
                                <center><input id="image_url" type="file" class="filestyle" data-input="false" name="file" accept="image/*" onchange="loadFile4(event)"></center>
                            </form>

                            <button id="Upload Images" type="button" onclick="image_upload('vendor_gallery',<%=session.getAttribute("service_id")%>)" class="btn btn-dark btn-theme-colored btn-flat mr-5">Post</button>

                        </div>
                    </div>
                </div>

                <div id="new_post_form" style="display: none;">
                    <div class="modal-body">
                        <img id="output"/>
                        <script>
                            var loadFile = function (event) {
                                var output = document.getElementById('output');
                                output.src = URL.createObjectURL(event.target.files[0]);
                            };
                        </script>
                        <div class="form-group">
                            <label for="form_title"><b>Subject</b></label>
                            <input id="form_title" name="form_title" class="form-control" type="text">
                        </div>
                        <div class="form-group">
                            <label for="form_content"><b>Content</b></label>
                            <textarea id="form_content" name="form_content" class="form-control" rows="5"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="form-group text-center">
                            <form id="form_upload_vendor_blog">
                                <center><input type="file" class="filestyle" data-input="false" name="file" accept="image/*" onchange="loadFile(event)"></center>
                            </form>

                            <button id="post_button" type="button" onclick="new_post('<%=current_page%>', '<%=service_id%>')" class="btn btn-dark btn-theme-colored btn-flat mr-5">Post</button>
                            <button type="button" onclick="reset()" class="btn btn-default btn-flat btn-theme-colored">Reset</button>

                        </div>
                    </div>
                </div>

                <div id="comment_form" style="display: none;">
                    <div id="comments" class="modal-body">
                    </div>
                    <div class="modal-footer">

                    </div>
                </div>

               <div id="visitor_sign_in_form" style="display: none;">
                    <form>
                        <div class="modal-body">
                            <div class="form-group col-md-12">
                                <label for="visitor_sign_in_email">Email</label>
                                <input id="visitor_sign_in_email" name="visitor_sign_in_email" class="form-control" type="text">
                            </div>              
                        </div>
                        <div class="modal-footer">
                            <div class="form-group text-center">
                                <div class="row">
                                    <a id="visitor_sign_up" href="" onclick="visitor_sign_up();return false;" style="position: relative;left:-150px; ">Sign Up</a>
                                    <button id="visitor_sign_in_button" type="button" class="btn btn-dark btn-theme-colored btn-flat mr-5" data-toggle="modal" data-target="#login-modal" style="position: relative;left:-25px;">Sign In</button>
                                    <button type="reset" class="btn btn-dark btn-theme-colored btn-flat mr-5" style="position: relative;left:-25px;">Reset</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>

                <div id="visitor_sign_up_form" style="display: none;">
                    <form>
                        <div class="modal-body">
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="visitor_first_name">First Name</label>
                                    <input id="visitor_first_name" name="visitor_first_name" class="form-control" type="text">
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="visitor_last_name">Last Name</label>
                                    <input id="visitor_last_name" name="visitor_last_name" class="form-control" type="text">
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label for="visitor_sign_up_email">Email</label>
                                    <input id="visitor_sign_up_email" name="visitor_sign_up_email" class="form-control" type="text">
                                </div>   
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="form-group text-center">
                                <div class="row">
                                    <a id="visitor_sign_in" href="" onclick="visitor_sign_in();return false;" style="position: relative;left:-150px; ">Sign In</a>
                                    <button id="visitor_sign_up_button" type="button" class="btn btn-dark btn-theme-colored btn-flat mr-5" data-toggle="modal" data-target="#login-modal" style="position: relative;left:-25px;">Sign Up</button>
                                    <button type="reset" class="btn btn-dark btn-theme-colored btn-flat mr-5" style="position: relative;left:-25px;">Reset</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                            
            </div>
        </div>
    </div>
</div>