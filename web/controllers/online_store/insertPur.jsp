
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
    
   
    


    String Name = request.getParameter("itemId");
    String reOrder = request.getParameter("reOrder");
    
    if(request.getParameter("addStock") != null){
        
        Statement st= getCon().createStatement();
        String sql = "Insert into `poders` (`itemId`, `qty`) "
                + "values ('"+Name+"','"+reOrder+"')"; 
        int i=st.executeUpdate(sql);
        
        if(i == 1){
            //out.print(sql);
            out.print("<script>swal({  title: 'Purchase Order Sent!', text: '', type: 'success', confirmButtonText: 'Done!'}, function(){ window.location.href='../../admin/item.jsp'; });</script>");
            
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
