<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "config/db_connection.jsp" %>
<%
    session.setAttribute("page", "request_results");

    String data = request.getParameter("data");
    String[] values = data.split(",");

    String[] services = {"Reception Halls", "Cake Designers", "Beauticians", "Bridal Dresses", "Groom Suits", "Photography", "Poruwa & Decorations", "Entertainment Groups", "Wedding Cars"};

%>

<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>
    </head>

    <body class="has-side-panel side-panel-left fullwidth-page">

        <%@ include file="/side_panels/customer_side_panel.jsp"%>

        <div id="wrapper" class="clearfix">

            <div id="preloader">
                <div id="spinner">
                    <div class="heart-preloader">
                        <i class="fa fa-heart font-36 infinite animated pulse"></i>
                    </div>
                </div>
            </div>

            <!-- Header -->
            <%@ include file="/static/customer_header.jsp"%>

            <!-- Start main-content -->
            <div class="main-content">
                <!-- Section: inner-header -->
                <section class="inner-header divider parallax layer-overlay overlay-dark-5" data-bg-img="images/bg/bg11.jpg">
                    <div class="container pt-120 pb-50">
                        <!-- Section Content -->
                        <div class="section-content pt-0">
                            <div class="row"> 
                                <div class="col-md-12">
                                    <h3 class="title text-white">Best Vendors For Your Budget</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Section: Shop Category -->
                <section class="">
                    <div class="container mt-30 mb-30 p-30">
                        <div class="section-content">
                            <%
                                String selected = null, type = null, city = null, budget = null, budget_option = null;

                                for (int i = 0, j = 0; i < values.length; i += 5) {
                                    j += 1;
                                    selected = values[i];
                                    if (selected.equals("true")) {

                                        type = values[i + 1];
                                      
                                        if (j == 1) {
                                            String[] options = type.split("/");
                                            type = options[0];
                                        }
                                       
                                        city = values[i + 2];
                                        budget = values[i + 3];
                                        budget_option = values[i + 4];
                            %>
                            <div class="row">
                                <h3 class="title text-black"><center><%=services[j - 1]%></center></h3>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="row multi-row-clearfix">
                                        <div class="products">                                        
                                            <%
                                                int count = 0;
                                                ResultSet rs = null;

                                                if (budget.equals("")) {
                                                    rs = getCon().createStatement().executeQuery("Select v.vendor_id,v.company_name,r.city,r.rating,r.image from vendor v left join service_registry r on v.vendor_id = r.vendor_id left join vendor_package p on r.registry_id = p.registry_id where r.service_id='" + j + "' and p.type ='" + type + "' group by v.vendor_id order by r.rating desc");
                                                } else if (budget_option.equals("true")) {
                                                    rs = getCon().createStatement().executeQuery("Select v.vendor_id,v.company_name,r.city,r.rating,r.image,pr.price,ABS(pr.price-'" + Double.parseDouble(values[i + 3]) + "') as difference from vendor v left join service_registry r on v.vendor_id = r.vendor_id left join vendor_package p on r.registry_id = p.registry_id left join vendor_pricing pr on p.package_id = pr.package_id where r.service_id='" + j + "' and p.type ='" + type + "' group by v.vendor_id order by difference");
                                                } else {
                                                    rs = getCon().createStatement().executeQuery("Select v.vendor_id,v.company_name,r.city,r.rating,r.image,pr.price from vendor v left join service_registry r on v.vendor_id = r.vendor_id left join vendor_package p on r.registry_id = p.registry_id left join vendor_pricing pr on p.package_id = pr.package_id where r.service_id='" + j + "' and p.type ='" + type + "' and pr.price<='" + Double.parseDouble(values[i + 3]) + "' group by v.vendor_id order by r.rating desc");
                                                }

                                                while (rs.next()) {
                                                    count += 1;
                                            %>
                                            <div class="col-sm-6 col-md-4 col-lg-4 mb-30">
                                                <div class="product">
                                                    <span class="tag-sale">rating: <%=rs.getString("r.rating")+"%"%></span>
                                                    <div class="product-thumb"> <img alt="" src="<%=rs.getString("r.image")%>" class="" width="350" height="220">
                                                        <div class="overlay"></div>
                                                    </div>
                                                    <div class="product-details text-center">
                                                        <a id="reception_hall1"><h5 class="product-title"><b><%=rs.getString("v.company_name")%></b></h5></a>                                                      
                                                        <div class="star-rating" title="Rated 4.50 out of 5"><span style="width: 90%;"></span></div>
                                                        <div class="btn-add-to-cart-wrapper pt-15">
                                                            <a class="btn btn-default" href="storefront.jsp?id=<%=rs.getString("v.vendor_id")%>&service=<%=j%>">Visit Page</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <%}
                                                if (count == 0) {
                                            %>
                                            <center><p style="font-size: 15px;"><b>No Vendors Found</b></p></center>
                                                <%
                                                    }
                                                %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%
                                    }
                                }
                            %>

                            <div class="col-md-12">
                                <nav>
                                    <ul class="pagination theme-colored">
                                        <li> <a href="#" aria-label="Previous"> <span aria-hidden="true">&laquo;</span> </a> </li>
                                        <li class="active"><a href="#">1</a></li>
                                        <li><a href="#">2</a></li>
                                        <li><a href="#">3</a></li>
                                        <li><a href="#">4</a></li>
                                        <li><a href="#">5</a></li>
                                        <li><a href="#">...</a></li>
                                        <li> <a href="#" aria-label="Next"> <span aria-hidden="true">&raquo;</span> </a> </li>
                                    </ul>
                                </nav>
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
