<%@include file= "../../config/db_connection.jsp" %>

<html>
    <head>
        <script src="../../admin/assets/sweetalert-dev.js"></script>
        <link rel="stylesheet" href="../../admin/assets/sweetalert.css">
    </head>
    
</html>


<% 
    String custId = "1";

    if (custId == null) {
        response.sendRedirect("store.jsp");
    } else {

    }
    
    String id = "";
    
    String sqlMax = "SELECT if(max(id) is null , 1 ,max(`id`)+1) as x FROM `checkout`";
    ResultSet rs = getCon().createStatement().executeQuery(sqlMax);
    while(rs.next()){
        id = rs.getString("x");
    }
    
    
    
    String ftName = request.getParameter("fname");
    String lName = request.getParameter("lname");
    String email = request.getParameter("email");
    String add1 = request.getParameter("street");
    String add2 = request.getParameter("city");
    String add3 = request.getParameter("pro");
    String etc = request.getParameter("etc");
    String postal = request.getParameter("postal");
    String note = request.getParameter("note");
    String rad = request.getParameter("rad");
    String name = request.getParameter("name");
    String cvv = request.getParameter("ccv");
    String card = request.getParameter("card");
    String month = request.getParameter("month");
    String year = request.getParameter("year");
    String userId = request.getParameter("userId");
    Double d = 500.00;
    Double d2 = d+Double.parseDouble(request.getParameter("price"));
    String price = ""+d2 ;
    String exp = year+"/"+month;
    
    // create the checkout
    String sql = "insert into `checkout`(`id`, `fname`, `lname`, `email`, `street`, `city`, `pro`, `etcAdd`, `postal`, `note`, `userId`)"
            + "values ('"+id+"','"+ftName+"','"+lName+"','"+email+"','"+add1+"','"+add2+"','"+add3+"','"+etc+"','"+postal+"','"+note+"','"+custId+"')";
    getCon().createStatement().executeUpdate(sql); 
//    
//    
//    
//    // create the payment
    String sqlPrice = "insert into `payment`(`type`, `name`, `cardNo`, `ccv`, `expYear`, `price`, `refCheck`)"
            + "values ('"+rad+"','"+name+"','"+card+"','"+cvv+"','"+exp+"','"+price+"','"+id+"')";
    getCon().createStatement().executeUpdate(sqlPrice);
//    
//    
//    
//    
//    // get all items in cart
    String sqlitems = "SELECT * FROM `cart` WHERE `custId` ='"+custId+"'";
    ResultSet rs1 = getCon().createStatement().executeQuery(sqlitems);
    while(rs1.next()){
        String item = rs1.getString("itemId");
        String qty = rs1.getString("qty");
        
        getCon().createStatement().executeUpdate("insert into `list`(`refCheck`, `itemId`, `qty`,`userId`) values ('"+id+"','"+item+"','"+qty+"','"+custId+"')"); 
    }
    
    // clear the cart
    getCon().createStatement().executeUpdate("delete FROM `cart` WHERE `custId` ='"+custId+"'"); 
    
   
//    out.print(sql +"<br>"+ sqlPrice );

    out.print("<script>swal({  title: 'Checkout Sent!', text: 'Cart Cleared!', type: 'success', confirmButtonText: 'Done!'}, function(){ window.location.href='../../store.jsp'; });</script>");
    
    

%>
