
<%@ page import="java.io.*"%>
<%@include file= "../../config/db_connection.jsp" %>



<html>
    <head>
        <script src="../../admin/assets/sweetalert-dev.js"></script>
        <link rel="stylesheet" href="../../admin/assets/sweetalert.css">
    </head>
    
</html>

<%
    
    
    String ItemName = request.getParameter("Name");
    String catId = request.getParameter("cat");
    String price = request.getParameter("price");
    String tag = request.getParameter("tag");
    String desc = request.getParameter("desc");
    String brand = request.getParameter("brand");
    String weight = request.getParameter("weight");
    String size = request.getParameter("size");
    String color = request.getParameter("color");
    String img = request.getParameter("file");
    String Id = request.getParameter("itemId");
    String stock = request.getParameter("stock");
    String reOrder = request.getParameter("reOrder");
    String supp = request.getParameter("supp");
    
    if(img != null && img != "" && img.length()>0){
        img = "../img/Items/"+img;
    }
    else{
        img = request.getParameter("filex");
    }
    
   
    
    if(request.getParameter("updateItem") != null){
        
        
        //`itemId`, `itemName`, `catId`, `price`, `tag`, `reviews`, `desc`, `brand`, `weight`, `size`, `color`, `img`
        Statement st= getCon().createStatement();
        String sql = "update items set itemName = '"+ItemName+"',catId = '"+catId+"',price = '"+price+"',tag = '"+tag+"',`desc` = '"+desc+"',brand = '"+brand+"',weight = '"+weight+"',size = '"+size+"',color = '"+color+"',img = '"+img+"',stock = '"+stock+"' ,margin = '"+reOrder+"' ,supId = '"+supp+"' where itemId = '"+Id+"'";
        
       
        int i=st.executeUpdate(sql);
        
        if(i == 1){
            out.print("<script>swal({  title: 'Item Updated!', text: '', type: 'success', confirmButtonText: 'Done!'}, function(){ window.location.href='../../admin/item.jsp'; });</script>");
            
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
