<!DOCTYPE html>

<html lang="en">

    <head>
        <meta charset="utf-8" />
        <title>Admin | Login Page</title>
        <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" name="viewport" />
        <meta content="As You Wish - Not being just a Wedding Planner" name="description" />

        <link href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
        <link href="assets/plugins/jquery-ui/themes/base/minified/jquery-ui.min.css" rel="stylesheet" />
        <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
        <link href="assets/css/animate.min.css" rel="stylesheet" />
        <link href="assets/css/style.min.css" rel="stylesheet" />
        <link href="assets/css/style-responsive.min.css" rel="stylesheet" />
        <link href="assets/css/theme/default.css" rel="stylesheet" id="theme" />
        <link href="assets/plugins/bootstrap-wizard/css/bwizard.min.css" rel="stylesheet" />

        <script src="assets/plugins/pace/pace.min.js"></script>

    </head>
    <body class="pace-top bg-white">
        <!-- begin #page-loader -->
        <div id="page-loader" class="fade in"><span class="spinner"></span></div>
        <!-- end #page-loader -->

        <!-- begin #page-container -->
        <div id="page-container" class="fade">
            <!-- begin login -->
            <div class="login login-with-news-feed">
                <!-- begin news-feed -->
                <div class="news-feed">
                    <div class="news-image">
                        <img src="assets/img/login-bg/bg-7.jpg">
                    </div>
                    <div class="news-caption">
                        <h4 class="caption-title">Welcome to As You Wish Admin Panel</h4>
                        <p>

                        </p>
                    </div>
                </div>

                <div class="right-content" style="padding-left: 20px;padding-right: 20px;">
                    <!-- begin login-header -->
                    <div class="login-header">
                        <div class="brand">
                            <span class="logo"></span> As You Wish Sign Up
                        </div>
                        <div class="icon">
                            <i class="fa fa-sign-in"></i>
                        </div>
                    </div>

                    <div class="row" style="position:relative;top: 20px;">
                        <!-- begin col-12 -->
                        <div class="col-md-12">
                            <!-- begin panel -->
                            <div class="panel panel-inverse">

                                <div class="panel-body">
                                    <form action="" method="POST">
                                        <div id="wizard">
                                            <ol>
                                                <li>
                                                    Identification                                               
                                                </li>
                                                <li>
                                                    Contact                                          
                                                </li>
                                                <li>
                                                    Login                                                
                                                </li>                                          
                                            </ol>
                                            <!-- begin wizard step-1 -->
                                            <div>
                                                <fieldset>
                                                    <legend class="pull-left width-full">Identification</legend>
                                                    <!-- begin row -->
                                                    <div class="row">
                                                        <!-- begin col-4 -->
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>First Name</label>
                                                                <input type="text" name="firstname" placeholder="John" class="form-control" />
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>Last Name</label>
                                                                <input type="text" name="lastname" placeholder="Smith" class="form-control" />
                                                            </div>
                                                        </div>
                                                        <!-- end col-4 -->
                                                    </div>
                                                    <!-- end row -->
                                                </fieldset>
                                            </div>
                                            <!-- end wizard step-1 -->
                                            <!-- begin wizard step-2 -->
                                            <div>
                                                <fieldset>
                                                    <legend class="pull-left width-full">Contact Information</legend>
                                                    <!-- begin row -->
                                                    <div class="row">
                                                        <!-- begin col-6 -->
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>Phone Number</label>
                                                                <input type="text" name="phone" placeholder="123-456-7890" class="form-control" />
                                                            </div>
                                                        </div>
                                                        <!-- end col-6 -->
                                                        <!-- begin col-6 -->
                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>Email Address</label>
                                                                <input type="text" name="email" placeholder="someone@example.com" class="form-control" />
                                                            </div>
                                                        </div>
                                                        <!-- end col-6 -->
                                                    </div>
                                                    <!-- end row -->
                                                </fieldset>
                                            </div>
                                            <!-- end wizard step-2 -->
                                            <!-- begin wizard step-3 -->
                                            <div>
                                                <fieldset>
                                                    <legend class="pull-left width-full">Login</legend>
                                                    <!-- begin row -->
                                                    <div class="row">

                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>Pasword</label>
                                                                <div class="controls">
                                                                    <input type="password" name="password" placeholder="Your password" class="form-control" />
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <div class="form-group">
                                                                <label>Confirm Pasword</label>
                                                                <div class="controls">
                                                                    <input type="password" name="password2" placeholder="Confirmed password" class="form-control" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <!-- end col-6 -->
                                                    </div>
                                                    <!-- end row -->
                                                </fieldset>
                                            </div>

                                            <div>

                                                <div class="jumbotron m-b-0 text-center">
                                                    <h2>Signed In Successfully</h2>
                                                    <p> </p>
                                                    <p><a class="btn btn-success" role="button" href="index.jsp">Proceed to User Profile</a></p>
                                                </div>

                                            </div>
                                            <!-- end wizard step-4 -->
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <!-- end panel -->
                        </div>
                        <!-- end col-12 -->
                    </div>
                    <!-- end login-content -->
                </div>

                <!-- end right-container -->
            </div>
            <!-- end login -->


        </div>

        <script src="assets/plugins/jquery/jquery-1.9.1.min.js"></script>
        <script src="assets/plugins/jquery/jquery-migrate-1.1.0.min.js"></script>
        <script src="assets/plugins/jquery-ui/ui/minified/jquery-ui.min.js"></script>
        <script src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>

        <script src="assets/plugins/slimscroll/jquery.slimscroll.min.js"></script>
        <script src="assets/plugins/jquery-cookie/jquery.cookie.js"></script>

        <script src="assets/plugins/bootstrap-wizard/js/bwizard.js"></script>
        <script src="assets/js/form-wizards.demo.min.js"></script>
        <script src="assets/js/apps.min.js"></script>

        <script>
            $(document).ready(function () {
                App.init();
            });
        </script>
        <script>
            (function (i, s, o, g, r, a, m) {
                i['GoogleAnalyticsObject'] = r;
                i[r] = i[r] || function () {
                    (i[r].q = i[r].q || []).push(arguments)
                }, i[r].l = 1 * new Date();
                a = s.createElement(o),
                        m = s.getElementsByTagName(o)[0];
                a.async = 1;
                a.src = g;
                m.parentNode.insertBefore(a, m)
            })(window, document, 'script', '../../../../www.google-analytics.com/analytics.js', 'ga');

            ga('create', 'UA-53034621-1', 'auto');
            ga('send', 'pageview');
        </script>

        <script>
            $(document).ready(function () {
                App.init();
                FormWizard.init();
            });
            $("#msg").hide();

            function admin_login() {
                var password = $('#password').val();
                var email = $('#email').val();
                if ($("#rememberMe").prop('checked') == true) {
                    var x = 1;
                } else {
                    var x = 0;
                }

                $.ajax({
                    url: "controllers/loginAdmin.jsp",
                    method: "POST",
                    data: {admin: true, pw: password, email: email, remMe: x},
                    dataType: "text",
                    success: function (html) {
                        var status = html;
                        if (status == "true") {
                            window.location.href = 'index.jsp';
                        } else {
                            $("#msg").show();
                        }

                    }

                });
            }

            $('#password').keydown(function (e) {
                if (e.which === 13) {
                    admin_login();
                    return false;
                }
            });

        </script>



    </body>

</html>

