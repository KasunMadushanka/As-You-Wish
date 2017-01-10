<%@page import="java.sql.ResultSet"%>
<%@ include file="config/db_connection.jsp" %>

<%
    // need set affter user registartion
    String custId = (String) session.getAttribute("id");

    String cat = request.getParameter("item");
    if (cat == null) {
        response.sendRedirect("store.jsp");
    } else {

    }

    //itemId itemName catId price tag reviews desc brand weight	size color img
    String iName = "";
    String price = "";
    String tag = "";
    String reviews = "";
    String desc = "";
    String brand = "";
    String weight = "";
    String size = "";
    String color = "";
    String img = "";
    String catId = "";
    String catName = "";
    String stock = "";
    String shortDesc = "";

    String up = "update items set reviews = reviews+1 where itemId = '" + cat + "'";
    getCon().createStatement().executeUpdate(up);

    ResultSet rs;
    String sql = "SELECT *,SUBSTRING(items.desc,1,60) as x FROM `items` inner join category on items.catId = category.catId where `itemId` ='" + cat + "'";
    rs = getCon().createStatement().executeQuery(sql);
    String hhh = "";
    String btn = "";
    if (rs.next()) {

        iName = rs.getString("itemName");
        price = rs.getString("price");
        tag = rs.getString("tag");
        reviews = rs.getString("reviews");
        desc = rs.getString("desc");
        brand = rs.getString("brand");
        weight = rs.getString("weight");
        size = rs.getString("size");
        color = rs.getString("color");
        img = rs.getString("img");
        catId = rs.getString("catId");
        catName = rs.getString("catName");
        stock = rs.getString("stock");
        shortDesc = rs.getString("x");

        if (Integer.parseInt(stock) > 0) {
            hhh = "<b><span style='color:green'> Stock Available </span></b>";
            btn = "<button class='single_add_to_cart_button btn btn-default' type='submit'>Add to cart</button>";
        } else {
            hhh = "<b><span style='color:red'> Stock Not Available </span></b>";
            btn = "<button class='single_add_to_cart_button btn btn-default' disabled='true' type='submit'>Add to cart</button>";
        }

    } else {
        response.sendRedirect("store.jsp");
    }

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
                                    <h3 class="title text-white">Shop Cart</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- Section: Shop Product Details -->
                <section>
                    <div class="container">
                        <div class="section-content">
                            <div class="row">
                                <div class="product">
                                    <div class="col-md-5">
                                        <div class="product-image">
                                            <img src="<%= img%>" alt="" >

                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <div class="product-summary">
                                            <h2 class="product-title"><%= iName%></h2>
                                            <div class="product_review">
                                                <ul class="review_text list-inline">
                                                    <li><a><span><%= reviews%></span> Reviews</a></li>  |  <li><a> <%= hhh%></a></li>


                                                </ul>
                                            </div>
                                            <div class="price"> <ins><span class="amount"> LKR. <%= price%> </span></ins> </div>
                                            <div class="short-description">
                                                <p> <%= shortDesc%>...</p>
                                            </div>
                                            <div class="category"><strong>Category:</strong> <a href="store.jsp?txt=<%= catId%>"><%= catName%></a></div>
                                            <div class="cart-form-wrapper mt-30">
                                                <form enctype="multipart/form-data" method="get" class="cart" action="controllers/online_store/addToCart.jsp">
                                                    <input type="hidden" value="<%= cat%>" name="itemId">
                                                    <input type="hidden" value="<%= custId%>" name="customer">
                                                    <table class="table variations no-border">
                                                        <tbody>
                                                            <tr>
                                                                <td class="name">Amount</td>
                                                                <td class="value">
                                                                    <div class="quantity buttons_added">
                                                                        <input type="button" class="minus" value="-">
                                                                        <input type="number" size="4" class="input-text qty text" title="Qty" value="1" name="quantity" min="1" max="<%= Integer.parseInt(stock)%>" step="1">
                                                                        <input type="button" class="plus" value="+">
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                    <%= btn%>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="horizontal-tab product-tab">
                                            <ul class="nav nav-tabs">
                                                <li class="active"><a href="#tab1" data-toggle="tab">Description</a></li>
                                                <li><a href="#tab2" data-toggle="tab">Additional Information</a></li>

                                            </ul>
                                            <div class="tab-content">
                                                <div class="tab-pane fade in active" id="tab1">
                                                    <h3>Product Description</h3>
                                                    <p> <%= desc%> </p>
                                                </div>
                                                <div class="tab-pane fade" id="tab2">
                                                    <table class="table table-striped">
                                                        <tbody>
                                                            <tr>
                                                                <th>Brand</th>
                                                                <td><p><%= brand%></p></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Color</th>
                                                                <td><p><%= color%></p></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Size</th>
                                                                <td><p><%= size%></p></td>
                                                            </tr>
                                                            <tr>
                                                                <th>Weight</th>
                                                                <td><%= weight%></td>
                                                            </tr>

                                                        </tbody>
                                                    </table>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 mt-30">
                                    <h4>Related Products</h4>
                                    <div class="row multi-row-clearfix">
                                        <div class="products related">

                                            <%

                                                ResultSet rs1;
                                                String sql1 = "SELECT * FROM `items` inner join category on items.catId = category.catId where items.catId='" + catId + "' and `itemId` != '" + cat + "'";
                                                rs1 = getCon().createStatement().executeQuery(sql1);

                                                while (rs1.next()) {

                                            %>


                                            <div class="col-sm-6 col-md-3 col-lg-3 mb-30">
                                                <div class="product">
                                                    <span class="tag-sale"><%= rs1.getString("tag")%></span>
                                                    <div class="product-thumb"> <img alt="" src="<%= rs1.getString("img")%>" width="260" height="220" >
                                                        <div class="overlay"></div>
                                                    </div>
                                                    <div class="product-details text-center">
                                                        <a href="productdetails.jsp?item=<%= rs1.getString("itemId")%>"><h5 class="product-title"><%= rs1.getString("itemName")%></h5></a>
                                                        <div class="price"><ins><span class="amount">Rs. <%= rs1.getString("price")%></span></ins></div>
                                                        <div class="btn-add-to-cart-wrapper">
                                                            <a class="btn btn-default btn-xs btn-add-to-cart" onclick="alert('dd')">Add To Cart</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                            <% }%>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

            <%@ include file="/static/customer_modal.jsp"%>

            <!-- Footer -->
            <footer id="footer" class="footer pb-0 bg-black-111">
                <%@ include file="/static/footer.jsp" %>
            </footer>
            <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
        </div>

        <script src="js/custom.js"></script>

    </body>

</html>