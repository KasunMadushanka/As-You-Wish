
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
    
   
    


    String Name = request.getParameter("Name");
    String add = request.getParameter("desc");
    String tel= request.getParameter("tel");
   
    if(request.getParameter("sbmitItem") != null){
        
        Statement st= getCon().createStatement();
        String sql = "Insert into `supplier` (`sName`, `sAdd`, `sTel`)"
                + "values ('"+Name+"','"+add+"','"+tel+"')"; 
        int i=st.executeUpdate(sql);
        
        if(i == 1){
            //out.print(sql);
            out.print("<script>swal({  title: 'New Supplier Inserted!', text: '', type: 'success', confirmButtonText: 'Done!'}, function(){ window.location.href='../../admin/Supplier.jsp'; });</script>");
            
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
