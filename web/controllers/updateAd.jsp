
<%@ page import="java.io.*"%>
<%@include file= "../../config/db_connection.jsp" %>



<html>
    <head>
        <script src="../admin/assets/sweetalert-dev.js"></script>
        <link rel="stylesheet" href="../admin/assets/sweetalert.css">
    </head>
    
</html>

<%
    
    
    String vId = request.getParameter("vId");
    String loc = request.getParameter("loc");
    String price = request.getParameter("price");
    
        
    if(request.getParameter("updateAds") != null){
        
        
        //`itemId`, `itemName`, `catId`, `price`, `tag`, `reviews`, `desc`, `brand`, `weight`, `size`, `color`, `img`
        Statement st= getCon().createStatement();
        String sql = "update ads set "
                + "payment = '"+price+"'"
                + "where vendorId = '"+vId+"' and loc = '"+loc+"'";
        
       
        int i=st.executeUpdate(sql);
        
        if(i == 1){
            out.print("<script>swal({  title: 'Advertisement Updated!', text: '', type: 'success', confirmButtonText: 'Done!'}, function(){ window.location.href='../admin/vendorAds.jsp'; });</script>");
            
        }
        else{
            response.sendRedirect( "../admin/error.jsp");
        }
            //out.print(sql);
        
        
    }
    else{
        //response.sendRedirect( "../admin/item.jsp"); 
    }
        
    
  
    
   
    

%>
