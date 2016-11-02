<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>
    </head>

    <body class="">
        <div id="wrapper" class="clearfix">
            <!-- preloader -->
            <div id="preloader">
                <div id="spinner">
                    <div class="heart-preloader">
                        <i class="fa fa-heart font-36 infinite animated pulse"></i>
                    </div>
                </div>
            </div>

            <!-- Header -->
            <header id="header" class="header">
                <div class="header-nav navbar-fixed-top header-dark navbar-white navbar-transparent navbar-sticky-animated animated-active">
                    <div class="header-nav-wrapper">
                        <div class="container">
                            <nav>
                                <div id="menuzord-right" class="menuzord red"> <a class="menuzord-brand pull-left flip font-playball text-theme-colored font-32" href="javascript:void(0)">As You <i class="fa fa-heart-o font-25"></i> Wish</a>              
                                    <ul class="menuzord-menu">
                                        <li><a href="index.jsp">Home</a></li>
                                        <li><a href="vendor_list.jsp">Vendors</a></li>
                                        <li><a href="event_list.jsp">Events</a></li>
                                        <li><a href="store.jsp">Online Store</a></li>
                                        <li><a href="contact.jsp">Contact</a></li>                                   
                                    </ul>
                                </div>
                            </nav>
                        </div>
                    </div>
                </div>
            </header>

            <!-- Start main-content -->
            <div class="main-content">
                <!-- Section: inner-header -->
                <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/bg11.jpg">
                    <div class="container pt-120 pb-50">
                        <!-- Section Content -->
                        <div class="section-content pt-0">
                            <div class="row"> 
                                <div class="col-md-12">
                                    <h3 class="title text-white">Have Any Questions?</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section>
                    <div class="container pt-80">
                        <div class="row">
                            <div class="col-md-12">
                                <form id="contact_form" name="contact_form" class="form-transparent" action="" method="post">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-group">
                                                <label for="form_name">Name <small>*</small></label>
                                                <input id="form_name" name="form_name" class="form-control" type="text" placeholder="Enter Name" required="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="form_email">Email <small>*</small></label>
                                                <input id="form_email" name="form_email" class="form-control required email" type="email" placeholder="Enter Email">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="form_name">Subject <small>*</small></label>
                                                <input id="form_subject" name="form_subject" class="form-control required" type="text" placeholder="Enter Subject">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="form_name">Message</label>
                                        <textarea id="form_message" name="form_message" class="form-control required" rows="5" placeholder="Enter Message"></textarea>
                                    </div>
                                    <div class="form-group text-center">
                                        <input id="form_botcheck" name="form_botcheck" class="form-control" type="hidden" value="" />
                                        <button type="submit" class="btn btn-dark btn-theme-colored btn-flat mr-5" data-loading-text="Please wait...">Send your message</button>
                                        <button type="reset" class="btn btn-default btn-flat btn-theme-colored">Reset</button>
                                    </div>
                                </form>
                            </div>
                        </div>
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