<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config/db_connection.jsp"%>
<%
    String id = request.getParameter("id");
    String type = request.getParameter("type");
%>

<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>
        <style>
            .center {
                margin: auto;
                width: 50%;
                padding: 100px;
            }
        </style>
        <script src="myjs/password_reset.js"></script>

    </head>
    <body class="">
        <div id="wrapper">
            <!-- preloader -->
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
                                    <h3 class="title text-white">Reset Your Password</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section>
                    <div class="center">

                        <div class="row">
                            <div class="form-group" >
                                <label for="new_password"><b>New Password:</b></label>
                                <input id="new_password" name="new_password" class="form-control" type="password" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <label for="re_enter_password"><b>Re-enter Password:</b></label>
                                <input id="re_enter_password" name="re_enter_password" class="form-control" type="password" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="form-group">
                                <input type="hidden" id="user_id" value='<%=request.getParameter("id")%>' >
                                <input type="hidden" id="type" value='<%=request.getParameter("type")%>' >
                                <button id="reset_button" class="btn btn-dark btn-theme-colored btn-block mt-15">Reset Password</button>
                            </div>
                        </div>

                    </div>
                </section>

            </div>
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
        <script src="js/jquery.rustaMsgBox.js"></script>
    </body>


</html>
