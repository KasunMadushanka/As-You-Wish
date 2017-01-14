<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config/db_connection.jsp"%>

<%
    String id = (String) session.getAttribute("id");

    session.setAttribute("page", "vendor_requests");

    String service = request.getParameter("service_id");

    session.setAttribute("service_id", service);

    String service_name = null;

    ResultSet rs = getCon().createStatement().executeQuery("Select name from service where service_id='" + service + "'");
    if (rs.first()) {
        service_name = rs.getString("name");
    }
    
getCon().createStatement().executeQuery("Update service_request set status  service where service_id='" + service + "'");

%>

<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>

        <script src="myjs/service_request.js"></script>
    </head>

    <body class="has-side-panel side-panel-left fullwidth-page">

        <% if (session.getAttribute("type").equals("customer")) {%>
        <%@ include file="/side_panels/customer_side_panel.jsp"%>
        <%} else if (session.getAttribute("type").equals("vendor")) {%>
        <%@ include file="/side_panels/vendor_side_panel.jsp"%>
        <%}%> 

        <div id="wrapper" class="clearfix">

            <div id="preloader">
                <div id="spinner">
                    <div class="heart-preloader">
                        <i class="fa fa-heart font-36 infinite animated pulse"></i>
                    </div>
                </div>
            </div>
            <!-- Header -->
            <%if (session.getAttribute("type").equals("customer")) {%>
            <%@ include file="/static/customer_header.jsp"%>
            <%} else if (session.getAttribute("type").equals("vendor")) {%>
            <%@ include file="/static/vendor_header.jsp"%>
            <%} else if (session.getAttribute("type").equals("visitor")) {%>
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
                                    <h3 class="title text-white"><%=service_name + " - " + "Requests"%></h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <section>                
                    <div class="container pt-100 pb-100" style="width: 1000px;">
                        <center><table class="table table-striped table-bordered tbl-shopping-cart" id="mytable">
                                <thead>

                                <th width="350">Customer</th>
                                <th width="200">Pricing Plan</th>
                                <th width="100">Price (LKR)</th>
                                <th width="100">Contact</th>

                                </thead>
                                <tbody>                         
                                    <%ResultSet rs1 = getCon().createStatement().executeQuery("Select c.customer_id,c.first_name,c.last_name,c.image_url,sr.*,vp.price,vp.title from customer c inner join service_request sr on c.customer_id=sr.customer_id inner join vendor_pricing vp on sr.pricing_id=vp.pricing_id");
                                        while (rs1.next()) {
                                    %>
                                    <tr>
                                        <td class="product-thumbnail"><a href="#"><img class="img-circle" width="50" height="50" src="<%=rs1.getString("c.image_url")%>"></a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#"><%=rs1.getString("c.first_name")%> <%=rs1.getString("c.last_name")%></a></td>
                                        <td><%=rs1.getString("vp.title")%></td>
                                        <td><%=rs1.getString("vp.price")%></td>
                                        <td><button class="btn btn-theme-colored" onclick="load_service_request(<%=rs1.getString("sr.request_id")%>,<%=rs1.getString("c.customer_id")%>)">Show Request</button></td>

                                    </tr>
                                    <%}%>                              
                                </tbody>
                            </table></center>
                    </div>                
                </section>
            </div>
            <!-- end main-content -->

            <%@ include file="/static/vendor_modal.jsp" %>

            <!-- Footer -->
            <footer id="footer" class="footer pb-0 bg-black-111">
                <%@ include file="/static/footer.jsp" %>
            </footer>
            <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
        </div>

        <script src="js/custom.js"></script>
        <script src="js/jquery.rustaMsgBox.js"></script>


    </body>


</html>
