
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
    String stock = request.getParameter("stock");
    String reOrder = request.getParameter("reOrder");
    String sup = request.getParameter("sup");
    img = "img/Items/"+img;
   
    
    if(request.getParameter("sbmitItem") != null){
        
        Statement st= getCon().createStatement();
        String sql = "Insert into `items`(`itemName`, `catId`, `price`, `tag`, `desc`, `brand`, `weight`, `size`, `color`, `img`,`stock`,`margin`,`supId`)"
                + "values ('"+ItemName+"','"+catId+"','"+price+"','"+tag+"','"+desc+"','"+brand+"','"+weight+"','"+size+"','"+color+"','"+img+"','"+stock+"','"+reOrder+"','"+sup+"')"; 
        int i=st.executeUpdate(sql);
        
        if(i == 1){
            out.print("<script>swal({  title: 'Item Inserted!', text: '', type: 'success', confirmButtonText: 'Done!'}, function(){ window.location.href='../../admin/item.jsp'; });</script>");
            
        }
        else{
            response.sendRedirect( "../../admin/error.jsp");
        }
    
        //out.print(sql);
        
        
    }
    else{
        response.sendRedirect( "../../admin/item.jsp"); 
    }
        
    
  
    
   
    

%>
