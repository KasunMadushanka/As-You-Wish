<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="config/db_connection.jsp" %>

<%
    String id = (String) session.getAttribute("id");

    getCon().createStatement().executeUpdate("Update vendor set status='" + "active" + "' where vendor_id='" + id + "'");

    ResultSet rs = getCon().createStatement().executeQuery("Select* from vendor where vendor_id='" + id + "'");
    if (rs.first()) {
        session.setAttribute("type", "vendor");
        session.setAttribute("first_name", rs.getString("first_name"));
        session.setAttribute("last_name", rs.getString("last_name"));
        session.setAttribute("email", rs.getString("email"));
        session.setAttribute("company_name", rs.getString("company_name"));
    }

    ArrayList service_list = new ArrayList();

    ResultSet rs2 = getCon().createStatement().executeQuery("Select service.service_id,service.name from service inner join service_registry on service.service_id=service_registry.service_id where vendor_id='" + id + "'");
    while (rs2.next()) {
        String[] values = new String[2];

        values[0] = rs2.getString("service_id");
        values[1] = rs2.getString("name");

        service_list.add(values);
    }

    session.setAttribute("services", service_list);

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
            <%@ include file="/static/vendor_header.jsp"%>

            <!-- Start main-content -->
            <div class="main-content">
                <!-- Section: inner-header -->
                <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/bg11.jpg">
                    <div class="container pt-120 pb-50">
                        <!-- Section Content -->
                        <div class="section-content pt-0">
                            <div class="row"> 
                                <div class="col-md-12">
                                    <h3 class="title text-white">Welcome <%=(String) session.getAttribute("first_name")%></h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="">
                    <div class="container mt-30 mb-30 p-30">
                        <div class="section-content">
                            <div class="form-group">
                                <center><h2>Congratulations!</h2></center>
                                <center><p class="font-18"><b>You have activated your new As You Wish account...</b></p></center>
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