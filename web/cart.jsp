<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="config/db_connection.jsp" %>

<%
    // need set after user registartion
    String custId = (String)session.getAttribute("id");

    if (custId == null) {
        response.sendRedirect("store.jsp");
    } else {

    }

    //itemId itemName catId price tag reviews desc brand weight	size color img
    String iName = "";
    String price = "";
    String color = "";
    String img = "";
    String catId = "";
    String catName = "";

    ResultSet rs;
    String sql = "SELECT cart.*, catName,  `itemName`, `stock`, `price`, `color`, `img` FROM `cart` inner join items on cart.itemId = items.itemId "
            + "inner join category on items.catId = category.catId WHERE `custId` = '" + custId + "'";
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

            <!-- Section: Shop Cart -->
            <section>
                <div class="container">
                    <div class="section-content">
                        <a href="store.jsp" ><< Go to Store</a><hr>
                        <div class="row">

                            <div class="col-md-10 col-md-offset-1">



                                <table class="table table-striped table-bordered tbl-shopping-cart" id="mytable">
                                    <thead>

                                    <th>Item</th>
                                    <th>Item Name</th>
                                    <th>Price</th>
                                    <th>Quantity</th>
                                    <th>Total</th>
                                    <th></th>


                                    </thead>
                                    <tbody>

                                        <%Double totCost = 0.00;
                                            DecimalFormat df = new DecimalFormat("#.00");

                                            int row = 1;
                                            while (rs.next()) {

                                                String itemId = rs.getString("itemId");
                                                String q = rs.getString("qty");
                                                iName = rs.getString("itemName");
                                                price = rs.getString("price");
                                                color = rs.getString("color");
                                                img = rs.getString("img");
                                                int f = Integer.parseInt(rs.getString("stock"));
                                                int remain = Integer.parseInt(q) + f;
                                                Double tot = 0.00;
                                                tot = Integer.parseInt(q) * Double.parseDouble(price);

                                                totCost = totCost + tot;

                                        %>

                                    <form action="controllers/online_store/updateCart.jsp" method="get">
                                        <tr class="cart_item">
                                            <td class="product-thumbnail"><a href="#"><img alt="member" src="<%= img%>"></a></td>
                                            <td class="product-name"><a href="#"><%= iName%></a>
                                                <ul class="variation">
                                                    <li class="variation-size">Color: <span><%= color%></span></li> 
                                                </ul></td>
                                            <td class="product-price"><span class="amount">LKR. <%= price%></span></td>

                                            <td class="product-quantity"><div class="quantity buttons_added">
                                                    <input type="button" class="minus" value="-">
                                                    <input type="number" size="4" class="input-text qty text" title="Qty" value="<%= q%>" name="quantity" min="1" max="<%= remain%>" step="1">
                                                    <input type="button" class="plus" value="+">
                                                    <input type="hidden" name="oldqty" value="<%= q%>"
                                                </div></td>
                                            <td class="product-subtotal"><span class="amount">LKR. <%= df.format(tot)%></span></td>
                                            <td class="product-remove">

                                                <input type="hidden" name="item" value="<%= itemId%>" />
                                                <input type="hidden" name="cust" value="<%= custId %>" />

                                                <button type="submit" name="update" class="btn">Update Quantity</button>
                                                <button type="submit" name="delete" class="btn btn-warning">Remove Item</button>

                                            </td>

                                        </tr>
                                    </form> 
                                    <%  row++;   %>



                                    <%    }


                                    %>

                                    </tbody>
                                </table>


                            </div>
                            <div class="col-md-10 col-md-offset-1 mt-30">
                                <div class="row">
                                    <div class="col-md-6">

                                    </div>
                                    <div class="col-md-6">
                                        <h4>Cart Totals</h4>
                                        <table class="table table-bordered">
                                            <tbody>
                                                <tr>
                                                    <td>Cart Subtotal  (LKR.)</td>
                                                    <td style="text-align: right"><%= df.format(totCost)%></td>
                                                </tr>
                                                <tr>
                                                    <td>Shipping and Handling (LKR.)</td>
                                                    <td style="text-align: right"> 500.00</td>
                                                </tr>
                                                <tr>
                                                    <td>Order Total (LKR.)</td>
                                                    <td style="text-align: right;"> <strong><%= df.format(totCost + 500.00)%></strong></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <div class="row" style="float: right">
                                            <a href="checkout.jsp" class="btn btn-success" style="text-align: right">Proceed to Checkout</a> 
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