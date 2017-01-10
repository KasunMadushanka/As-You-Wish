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
                        <img src="assets/img/login-bg/bg-71.jpg" data-id="login-cover-image" alt="" />
                    </div>
                    <div class="news-caption">
                        <center>
                            <h4 class="caption-title"><i class="fa fa-key text-success"></i>    Administrator Control Panel</h4>
                        </center>
                        <p>

                        </p>
                    </div>
                </div>
                <!-- end news-feed -->
                <!-- begin right-content -->
                <div class="right-content">
                    <!-- begin login-header -->
                    <div class="login-header">
                        <div class="brand">
                            <span class="logo"></span> As You Wish Admin

                        </div>
                        <div class="icon">
                            <i class="fa fa-sign-in"></i>
                        </div>
                    </div>
                    <!-- end login-header -->
                    <!-- begin login-content -->
                    <div class="login-content">
                        <form method="POST" class="margin-bottom-0">
                            <div class="form-group m-b-15">
                                <input type="text" class="form-control input-lg" placeholder="Email Address" id="email" />
                            </div>
                            <div class="form-group m-b-15">
                                <input type="password" class="form-control input-lg" placeholder="Password" id="password" />
                            </div>
                            <div class="checkbox m-b-30">
                                <label>
                                    <input type="checkbox" id="rememberMe" /> Remember Me
                                </label>
                            </div>
                            <div class="login-buttons">
                                <button type="button" id="logIn" class="btn btn-success btn-block btn-lg" onclick="admin_login()">Sign me in</button>
                            </div>
                           
                            <br>
                            <div class="col-md-12 container note note-danger" id="msg">

                                <h4 style="text-align:center">invalid Login!</h4>
                                <p style="text-align:center">
                                    Please check your email and password again! Otherwise contact the Developer! :p
                                </p>
                            </div>


                            <hr />
                            <p class="text-center text-inverse">
                                &copy; Cybersoft Admin All Right Reserved 2016-2017

                            </p>

                        </form>
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

