<%@ page import="java.io.*"%>
<%@include file= "../../config/db_connection.jsp" %>



<html>
    <head>
        <script src="../../admin/assets/sweetalert-dev.js"></script>
        <link rel="stylesheet" href="../../admin/assets/sweetalert.css">
    </head>
    
</html>

<%
    
    String qty = "0";
    
    String item = request.getParameter("itemId");
    String cust = "1";
    qty = request.getParameter("quantity");
    
    
    
    if(item != null && cust != null){
        
        Statement st= getCon().createStatement();
        String sql = "Insert into `cart` (`custId`, `itemId`, `qty`)"
                + "values ('"+cust+"','"+item+"','"+qty+"')";
        int i=st.executeUpdate(sql);
        
        Statement st1= getCon().createStatement();
        String sql1 = "update `items` set stock = stock-"+qty+" where itemId= '"+item+"' ";
        int i1=st1.executeUpdate(sql1);
        
        if(i == 1){
            out.print("<script>swal({  title: 'Added to Cart!', text: '', type: 'success', confirmButtonText: 'Done!'}, function(){ window.location.href='../../cart.jsp'; });</script>");
            
        }
        else{
            response.sendRedirect( "../../error.jsp");
        }

        
        
    }
    else{
        response.sendRedirect( "../../index.jsp"); 
    }
        
    
  
    
   
    

%>
