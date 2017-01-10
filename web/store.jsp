<%@page import="java.sql.ResultSet"%>
<%@ include file="config/db_connection.jsp" %>

<%
    String id = (String) session.getAttribute("id");
    session.setAttribute("page", "store");

    String h = "";
    String cat = request.getParameter("txt");
    if (cat == null) {
        h = "1";
    } else {
        h = "items.catId = '" + cat + "'";
    }

    ResultSet rs;
    String sql = "SELECT * FROM `items` inner join category on items.catId = category.catId where " + h;
    rs = getCon().createStatement().executeQuery(sql);

%>


<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <%@ include file="/static/head.jsp" %>
    </head>

    <body class="has-side-panel side-panel-left fullwidth-page">

        <%if ((String) session.getAttribute("id") != null) {%>
        <%@ include file="/side_panels/customer_side_panel.jsp"%>
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
                                    <h3 class="title text-white">Online Store</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
 
                <!-- Section: Shop Category Sidebar -->
                <section class="">
                    <div class="container mt-30 mb-30 p-30">
                        <div class="section-content">
                            <div class="row">
                                <div class="col-sm-12 col-md-9">
                                    <div class="row multi-row-clearfix">
                                        <div class="products">
 
                                            <%while (rs.next()) {%>

                                            <div class="col-sm-6 col-md-4 col-lg-4 mb-30">
                                                <div class="product">
                                                    <span class="tag-sale"><%= rs.getString("tag")%></span>
                                                    <div class="product-thumb"> <img alt="" src="<%= rs.getString("img")%>" class="" width="260" height="220">
                                                        <div class="overlay"></div>
                                                    </div>
                                                    <div class="product-details text-center">
                                                        <a href="productdetails.jsp?item=<%= rs.getString("itemId")%>"><h5 class="product-title"><%= rs.getString("itemName")%></h5></a>
                                                        <div class="price"><ins><span class="amount">LKR <%= rs.getString("price")%></span></ins></div>
                                                        <div class="btn-add-to-cart-wrapper">
                                                            <a class="btn btn-default btn-xs btn-add-to-cart" href="productdetails.jsp?item=<%= rs.getString("itemId")%>">More Details..</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>


                                            <%  }
                                            %>


                                        </div>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-3">
                                    <div class="sidebar sidebar-right mt-sm-30">
                                        <div class="widget">
                                            <h5 class="widget-title line-bottom">Categories</h5>
                                            <div class="categories">
                                                <ul class="list list-border angle-double-right">
                                                    <%
                                                        String sql2 = "SELECT * FROM category";
                                                        ResultSet rs2 = getCon().createStatement().executeQuery(sql2);
                                                        while (rs2.next()) {%>

                                                    <li><a href="store.jsp?txt=<%= rs2.getString("catId")%>" ><%= rs2.getString("catName")%></a></li>

                                                    <%    }

                                                    %>
                                                </ul>
                                            </div>
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