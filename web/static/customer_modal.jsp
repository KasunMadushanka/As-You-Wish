<link  href="css/customer_modal.css" rel="stylesheet" type="text/css"/>
<script src="js/customer_modal.js"></script>
<script src="myjs/visitor_sign_in.js"></script> 
<script src="myjs/visitor_sign_up.js"></script>  

<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header" align="center">
                <button id="close_button" type="button" class="close" onclick="close_modal()" aria-label="Close">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                </button>
            </div>
            <!-- Begin # DIV Form -->
            <div id="div-forms">
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
                            <form id="form_upload_couple_blog">
                                <center><input id="image_url" type="file" class="filestyle" data-input="false" name="file" accept="image/*" onchange="loadFile(event)"></center>
                            </form>
                            <button id="post_button" type="button" onclick="new_post('couple_blog', null)" class="btn btn-dark btn-theme-colored btn-flat mr-5">Post</button>
                            <button type="button" onclick="reset()" class="btn btn-default btn-flat btn-theme-colored">Reset</button>

                        </div>
                    </div>
                </div>

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
                            <form id="form_upload_customer_gallery">
                                <center><input id="image_url" type="file" class="filestyle" data-input="false" name="file" accept="image/*" onchange="loadFile4(event)"></center>
                            </form>

                            <button id="upload_images" type="button" onclick="image_upload('vendor_gallery',<%=session.getAttribute("service_id")%>)" class="btn btn-dark btn-theme-colored btn-flat mr-5">Post</button>

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
                            <div class="form-group col-md-12">
                                <label for="visitor_sign_in_password">Password</label>
                                <input id="visitor_sign_in_password" name="visitor_sign_in_password" class="form-control" type="password">
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="form-group text-center">
                                <div class="row">
                                    <a id="visitor_sign_up" href="" onclick="visitor_sign_up();return false;" style="position: relative;left:-150px; ">Sign Up</a>
                                    <button id="visitor_sign_in_button" type="button" class="btn btn-dark btn-theme-colored btn-flat mr-5" style="position: relative;left:-25px;">Sign In</button>
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
                            <div class="row">
                                <div class="form-group col-md-12">
                                    <label for="visitor_sign_up_password">Password</label>
                                    <input id="visitor_sign_up_password" name="visitor_sign_up_password" class="form-control" type="password">
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