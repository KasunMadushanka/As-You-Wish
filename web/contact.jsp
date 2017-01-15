<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>
        
        <script src="myjs/email.js"></script>   
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
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="name">Name <small>*</small></label>
                                                <input id="name" name="name" class="form-control required" type="text" placeholder="Enter Name">
                                            </div>
                                        </div>
                                        <div class="col-sm-6">
                                            <div class="form-group">
                                                <label for="subject">Subject <small>*</small></label>
                                                <input id="subject" name="subject" class="form-control required" type="text" placeholder="Enter Subject">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="message">Message</label>
                                        <textarea id="message" name="message" class="form-control required" rows="5" placeholder="Enter Message"></textarea>
                                    </div>
                                    <div class="form-group text-center">
                                        <input id="form_botcheck" name="form_botcheck" class="form-control" type="hidden" value="" />
                                        <button type="button" class="btn btn-dark btn-theme-colored btn-flat mr-5" onclick="send_email('asyouwish077@gmail.com', 'visitor_message')">Send your message</button>
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
       
        <script src="js/custom.js"></script>
         <script src="js/jquery.rustaMsgBox.js"></script>

    </body>

</html>