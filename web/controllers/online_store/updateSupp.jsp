
<%@ page import="java.io.*"%>
<%@include file= "../../config/db_connection.jsp" %>



<html>
    <head>
        <script src="../../admin/assets/sweetalert-dev.js"></script>
        <link rel="stylesheet" href="../../admin/assets/sweetalert.css">
    </head>
    
</html>

<%
    
    
    String Name = request.getParameter("Name");
    String Add = request.getParameter("desc");
    String tel = request.getParameter("brand");
    String Id = request.getParameter("itemId");
    
    if(request.getParameter("updateItem") != null){
        
        
        //`itemId`, `itemName`, `catId`, `price`, `tag`, `reviews`, `desc`, `brand`, `weight`, `size`, `color`, `img`
        Statement st= getCon().createStatement();
        String sql = "update `supplier` set `sName` = '"+Name+"',`sAdd` = '"+Add+"',`sTel` = '"+tel+"' where sId = '"+Id+"'";
        
       
        int i=st.executeUpdate(sql);
        
        if(i == 1){
            out.print("<script>swal({  title: 'Supplier Updated!', text: '', type: 'success', confirmButtonText: 'Done!'}, function(){ window.location.href='../../admin/Supplier.jsp'; });</script>");
            
        }
        else{
            response.sendRedirect( "../../admin/error.jsp");
        }
            //out.print(sql);
        
        
    }
    else{
        //response.sendRedirect( "../admin/item.jsp"); 
    }
        
    
  
    
   
    

%>
