
<!-- BEGIN MODAL LOGIN -->
        <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header" align="center">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                        </button>
                        <h3 class="text-gray mt-0 pt-5">As You Wish</h3>
                    </div>

                    <!-- Begin # DIV Form -->
                    <div id="div-forms">

                        <!-- Begin Customer Login Form -->
                        <form id="customer-login-form">
                            <div class="modal-body">
                                <div id="div-login-msg">
                                    <div id="icon-login-msg" class="glyphicon glyphicon-chevron-right"></div>
                                    <span id="text-login-msg">Type your email and password.</span>
                                </div>
                                <input id="customer_login_email" class="form-control" type="text" placeholder="Email">
                                <input id="customer_login_password" class="form-control" type="password" placeholder="Password">
                                <a id="login_lost_customer" href="#"><center>Forgot Password?</center></a>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Remember me
                                    </label>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div>
                                    <button id="customer_login_button" type="button" class="btn btn-primary btn-lg btn-block">Login</button>
                                </div>
                                <div>
                                    <div>
                                        <a id="register_customer" href="customer_sign_up.jsp"><center>Register now!</center></a>
                                    </div>

                                    <div>
                                        <a id="login_vendor" href="#"><center>Are you a vendor? Login here!</center></a>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- End Login Form -->

                        <!-- Begin Vendor Login Form -->
                        <form id="vendor-login-form" style="display:none;">
                            <div class="modal-body">
                                <div id="div-login-msg">
                                    <div id="icon-login-msg" class="glyphicon glyphicon-chevron-right"></div>
                                    <span id="text-login-msg">Type your email and password.</span>
                                </div>
                                <input id="vendor_login_email" class="form-control" type="text" placeholder="Email">
                                <input id="vendor_login_password" class="form-control" type="password" placeholder="Password">
                                <a id="login_lost_vendor" href="#"><center>Lost Password?</center></a>
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox"> Remember me
                                    </label>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <div>
                                    <button id="vendor_login_button" type="button" class="btn btn-primary btn-lg btn-block">Login</button>
                                </div>
                                <div>
                                    <div>
                                        <a id="register_vendor" href="pricing.jsp"><center>Register now!</center></a>
                                    </div>

                                    <div>
                                        <a id="login_customer" href="#"><center>Are you a customer? Login here!</center></a>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- End Login Form -->

                        <!-- Begin | Lost Password Form -->
                        <form id="lost-form" style="display:none;">
                            <div class="modal-body">
                                <div id="div-lost-msg">
                                    <div id="icon-lost-msg" class="glyphicon glyphicon-chevron-right"></div>
                                    <span id="text-lost-msg">Type your Email</span>
                                </div>
                                <input id="recipient" class="form-control" type="text" placeholder="Type your Email">
                            </div>
                            <div class="modal-footer">
                                <div>
                                    <button id="lost_button" type="button" onclick="send_email($('#recipient').val(),'password_reset')" class="btn btn-primary btn-lg btn-block">Send</button>
                                </div>
                                <div>
                                    <a id="lost_login" href="#">Log In</a>
                                </div>
                            </div>
                        </form>

                        <div id="email-sent-form" style="display:none;">
                            <div class="modal-body">
                                <span>Please check your email. </span>
                            </div>
                            <div class="modal-footer">
                                <button id="confirm_button" class="btn btn-primary btn-lg btn-block">OK</button>
                            </div>
                        </div>
                        <!-- End | Lost Password Form -->
                    </div>
                    <!-- End # DIV Form -->

                </div>
            </div>
        </div>
        <!-- END # MODAL LOGIN -->