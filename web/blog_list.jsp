<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="config/db_connection.jsp" %>

<%
    ArrayList data = new ArrayList();

    ResultSet rs = getCon().createStatement().executeQuery("Select* from customer where status='active'");
    while (rs.next()) {

        String[] details = new String[7];

        details[0] = rs.getString("customer_id");
        details[1] = rs.getString("first_name");
        details[2] = rs.getString("partner_first_name");
        details[3] = rs.getString("cover_image");
     
        data.add(details);
    }
%>


<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>
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
            <%if ((String) session.getAttribute("id") != null) {%>
            <%@ include file="/static/customer_header.jsp"%>
            <%} else {%>
            <%@ include file="/static/visitor_header.jsp"%>
            <%}%>

            <!-- Start main-content -->
            <div class="main-content">
                <!-- Section: inner-header -->
                <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/bg11.jpg">
                    <div class="container pt-120 pb-50">
                        <!-- Section Content -->
                        <div class="section-content pt-0">
                            <div class="row"> 
                                <div class="col-md-12">
                                    <h3 class="title text-white">As You Wish Our Story</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Section: Shop Category Sidebar -->
                <section class="" data-bg-img="images/bg/bg22.png">
                    <div class="container mt-30 mb-30 p-30">
                        <div class="section-content">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row multi-row-clearfix">
                                        <div class="products">
                                            <%for (int m = 0; m < data.size(); m++) {
                                                    String[] fields = (String[]) data.get(m);%>
                                            <div class="col-sm-6 col-md-4 col-lg-4 mb-30">
                                                <div>
                                                    <div> <img alt="" src="<%=fields[3]%>" class="img-responsive img-circle">
                                                        <div class="overlay"></div>
                                                    </div>
                                                    <div class="product-details text-center">
                                                        <h3 class="entry-title"><%=fields[1]%>  <img src="images/wedding-ring3.png"> <%=fields[2]%></h3>
                                                        <div>
                                                            <a class="btn btn-default" href="couple_blog.jsp?id=<%=fields[0]%>&id=<%=fields[0]%>">View Blog</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <%}%>
                                        </div>
                                    </div>
                                </div>
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

    </body>

</html>