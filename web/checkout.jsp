<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="config/db_connection.jsp" %>

<%
    // need set affter user registartion
    String custId = (String)session.getAttribute("id");

    if (custId == null) {
        response.sendRedirect("store.jsp");
    } else {

    }
    
    String fName ="";
    String lName = "";
    String email="";
    
    String sqlUser ="Select * from customer where customer_id = '"+custId+"'";
    ResultSet rs0=getCon().createStatement().executeQuery(sqlUser);
    while(rs0.next()){
        fName = rs0.getString("first_name");
        lName = rs0.getString("last_name");
        email = rs0.getString("email");
    }

    //itemId itemName catId price tag reviews desc brand weight	size color img
    String iName = "";
    String price = "";
    String color = "";
    String img = "";
    String catId = "";
    String catName = "";

    ResultSet rs;
    String sql = "SELECT cart.*, catName,  `itemName`, `price`, `color`, `img` FROM `cart` inner join items on cart.itemId = items.itemId "
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

                <!-- Section: Shop Checkout -->
                <section>
                    <div class="container">
                        <div class="section-content">
                            <div class="row mt-30">
                                <form id="form1" action="controllers/online_store/insertCheck.jsp" onsubmit="return xx()">
                                    <div class="col-md-12">
                                        <div class="billing-details">
                                            <h3 class="mb-30">Billing Details</h3>
                                            <div class="row">
                                                <div class="form-group col-md-6">
                                                    <label for="checkout-form-fname">First Name*</label>
                                                    <input type="hidden" name="userId" id="cust" value="<%= custId %>" />
                                                    <input  type="text" name="fname" class="form-control" id="fName" placeholder="First Name" required="true" value="<%= fName %>">
                                                </div>
                                                <div class="form-group col-md-6">
                                                    <label for="checkout-form-lname">Last Name*</label>
                                                    <input  type="text" name="lname" class="form-control" id="lName" placeholder="Last Name" required="true" value="<%= lName %>">
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label for="checkout-form-email">Email Address*</label>
                                                        <input  type="email" name="email" class="form-control" id="email" placeholder="Email Address" required="true" value="<%= email  %>">
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="checkout-form-address">Address*</label>
                                                        <input  type="text" name="street" class="form-control" id="street" placeholder="Street address" required="true">
                                                        <input  type="text" name="city" class="form-control" id="city" placeholder="City" required="true">
                                                        <input  type="text" name="pro" class="form-control" id="pro" placeholder="Province" required="true">
                                                    </div>
                                                    <div class="form-group">
                                                        <input type="text" name="etc" class="form-control" id="etcAdd" placeholder="Apartment, suite, unit etc. (optional)">
                                                    </div>
                                                </div>


                                                <div class="form-group col-md-6">
                                                    <label for="checkout-form-zip">Zip/Postal Code</label>
                                                    <input type="text" name="postal" class="form-control" id="postal" placeholder="Zip/Postal Code">
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="shipping-details">
                                            <div class="form-group">
                                                <label>Order Notes</label>
                                                <textarea class="form-control" name="note" placeholder="Notes about your order, e.g. special notes for delivery." id="note" rows="3"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <h3>Your order</h3>
                                        <table class="table table-striped table-bordered tbl-shopping-cart">
                                            <thead>
                                                <tr>
                                                    <th>Photo</th>
                                                    <th>Product Name</th>
                                                    <th>Total</th>
                                                </tr>
                                            </thead>
                                            <tbody>

                                                <%
                                                    Double totCost = 0.00;
                                                    DecimalFormat df = new DecimalFormat("#.00");

                                                    int row = 1;
                                                    while (rs.next()) {

                                                        String itemId = rs.getString("itemId");
                                                        String q = rs.getString("qty");
                                                        iName = rs.getString("itemName");
                                                        price = rs.getString("price");
                                                        color = rs.getString("color");
                                                        img = rs.getString("img");
                                                        Double tot = 0.00;
                                                        tot = Integer.parseInt(q) * Double.parseDouble(price);
                                                        totCost = totCost + tot;

                                                %>

                                                <tr>
                                                    <td class="product-thumbnail"><img alt="member" src="<%= img%>"></td>
                                                    <td><%= iName%> x <%= q%></td>
                                                    <td style="text-align: right">LKR. <span class="amount" ><%= df.format(tot)%></span></td>
                                                </tr>

                                                <% }%>

                                                <tr>
                                                    <td>Cart Subtotal</td>
                                                    <td  style="text-align: right">(LKR.)</td>
                                                    <td style="text-align: right"> <%= df.format(totCost)%></td>
                                                </tr>
                                                <tr>
                                                    <td>Shipping and Handling</td>
                                                    <td  style="text-align: right">(LKR.)</td>
                                                    <td style="text-align: right"> 500.00</td>
                                                </tr>
                                                <tr>
                                                    <td>Order Total</td>
                                                    <td  style="text-align: right">(LKR.)</td>
                                                    <td style="text-align: right"> <b><%= df.format(totCost + 500.00)%></b></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="col-md-12">
                                        <h3>Payment Information</h3>
                                        <div class="payment-method">

                                            <!--Checkout-Form-->
                                            <section>
                                                <br><hr>
                                                <label class="radio-inline">
                                                    <input type="hidden" id="price" name="price" value="<%= totCost%>" >
                                                    <input type="radio" name="rad" checked="true" id="rad" value="visa" style=" padding:0px;margin-top: 15px;vertical-align:middle;"> <i class="fa fa-cc-visa fa-3x" aria-hidden="true" style=" vertical-align:bottom;" ></i> &nbsp;&nbsp; &nbsp; &nbsp;
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="rad" id="rad" value="mastercard" style=" padding:0px;margin-top: 15px;vertical-align:middle;" ><i class="fa fa-cc-mastercard  fa-3x" aria-hidden="true" style=" vertical-align:bottom;"></i>
                                                </label>
                                                <br><hr>
                                            </section>

                                            <section>
                                                <input class="form-control" type="text" name="name" id="name" placeholder="Name on card" required="true">
                                                <br>
                                            </section>

                                            <div class="row">
                                                <div class="col-md-10">
                                                    <input class="form-control" type="number" maxlength="16" name="card" id="card" placeholder="Card number"  required="true">
                                                </div>
                                                <div class="col-md-2">
                                                    <input class="form-control" type="number" name="ccv" id="cvv" placeholder="CVV2" maxlength="3" minlength="3" min="001" max="999"  required="true">
                                                </div>
                                                <br>
                                            </div>

                                            <div class="row">
                                                <br>
                                                <div class="col-md-2"> <p style="vertical-align: center">Expiration date </p></div>
                                                <div class="col-md-5">
                                                    <select class="form-control" id="month" name="month" required="true">
                                                        <option disabled="" selected="" value="0">Month</option>
                                                        <option value="1">January</option>
                                                        <option value="1">February</option>
                                                        <option value="3">March</option>
                                                        <option value="4">April</option>
                                                        <option value="5">May</option>
                                                        <option value="6">June</option>
                                                        <option value="7">July</option>
                                                        <option value="8">August</option>
                                                        <option value="9">September</option>
                                                        <option value="10">October</option>
                                                        <option value="11">November</option>
                                                        <option value="12">December</option>
                                                    </select>
                                                    <i></i>
                                                </div>
                                                <div class="col-md-3">
                                                    <input class="form-control" type="number" placeholder="Year" id="year" name="year" value="2016" min="2016" maxlength="4" required="true">
                                                </div>
                                            </div>

                                            <!--End Checkout-Form-->

                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="text-right"> <input type="submit"  class="btn btn-lg btn-success" value="Place Order"> </div>
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
                <%@ include file="/static/footer.jsp" %>
            </footer>
            <a class="scrollToTop" href="#"><i class="fa fa-angle-up"></i></a>
        </div>
        <!-- end wrapper -->

        <!-- Footer Scripts -->
        <!-- JS | Custom script for all pages -->
        <script src="js/custom.js"></script>
        <script>

                                    function xx() {


                                        var fname = $('#fName').val();
                                        var lname = $('#lName').val();
                                        var email = $('#email').val();
                                        var street = $('#street').val();
                                        var city = $('#city').val();//
                                        var pro = $('#pro').val();
                                        var etc = $('#etcAdd').val();
                                        var postal = $('#postal').val();
                                        var note = $('#note').val();
                                        var rad = $('#rad').val();//
                                        //var price = $('#price').val();//


                                        var name = $('#name').val();
                                        var ccv = $('#cvv').val();
                                        var card = $('#card').val();
                                        var month = $('#month').val();
                                        var year = $('#year').val();//
                                        var userId = $('#cust').val();

                                        var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;


                                        var d = new Date();
                                        var n = d.getFullYear();
                                        var n2 = n + 5;

                                        if (fname != "" && lname != "" && email != "" && street != "" && city != "" && pattern.test(email)) {

                                            if (name.length > 0 && card.length == 16 && year.length == 4 && ccv.length == 3 && month != null) {

                                                if (year >= n && year <= n2) {

                                                    return true;
                                                } else {

                                                    swal({title: 'Check Your Expiration Year Again!', text: '', type: 'warning', confirmButtonText: 'OK!'}, function () { });
                                                    return false;
                                                }
                                            } else {
                                                swal({title: 'Check Your Payment Information Again!', text: '', type: 'warning', confirmButtonText: 'OK!'}, function () { });
                                                return false;
                                            }
                                        } else {
                                            swal({title: 'Check Your Billing Information Again!', text: '', type: 'warning', confirmButtonText: 'OK!'}, function () { });
                                            return false;
                                        }
                                    }

        </script>
    </body>

</html>