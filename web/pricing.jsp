<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "config/db_connection.jsp" %>
<%
    ArrayList pricing = new ArrayList();

    ResultSet rs = getCon().createStatement().executeQuery("Select* from pricing");
    while (rs.next()) {
        String[] details = new String[3];

        details[0] = rs.getString("title");
        details[1] = rs.getString("description");
        details[2] = rs.getString("price");

        pricing.add(details);
    }


%>

<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>
        <script src="myjs/pricing.js"></script>
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

            <!-- Header -->
            <%@ include file="/static/visitor_header.jsp"%>

            <div class="main-content">
                <!-- Section: inner-header -->
                <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/bg11.jpg">
                    <div class="container pt-120 pb-50">
                        <!-- Section Content -->
                        <div class="section-content pt-0">
                            <div class="row"> 
                                <div class="col-md-12">
                                    <h3 class="title text-white">Select your monthly pricing plan</h3>                           
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section>
                    <div class="container">
                        <div class="section-content">
                            <div class="row">
                                <%for (int i = 0; i < pricing.size(); i++) {%>
                                <div class="col-xs-12 col-sm-3 col-md-3 hvr-float-shadow mb-sm-30">
                                    <div class="pricing-table style1 bg-white-light border-10px text-center">
                                        <div class="pt-40 pb-60">
                                            <%String values[] = (String[]) pricing.get(i);%>
                                            <h4 class="package-type"><%=values[0]%></h4>
                                            <h1 class="price text-theme-colored mb-10"><%=values[2]%></h1>
                                            <p><%=values[1]%></p>                                                                                  
                                            <a class="btn btn-colored btn-theme-colored text-uppercase" href="vendor_sign_up.jsp?pricing=<%=values[0]%>">Get Started</a><br>                                          
                                        </div>
                                    </div>
                                </div>
                                <%}%>
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
        <!-- end wrapper -->

        <!-- Footer Scripts -->
        <!-- JS | Custom script for all pages -->
        <script src="js/custom.js"></script>

    </body>


</html>