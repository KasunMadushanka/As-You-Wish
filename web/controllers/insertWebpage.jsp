<%@include file= "../../config/db_connection.jsp" %>

<html>
    <head>
        <script src="../admin/assets/sweetalert-dev.js"></script>
        <link rel="stylesheet" href="../admin/assets/sweetalert.css">
    </head>
    
</html>

<% 

    String vId = request.getParameter("termsDesc");
    if(request.getParameter("terms") != null){
        
        Statement st= getCon().createStatement();
        String sql = "update `website` set `desc` = '"+vId+"' where `title` = 'terms and conditions'";
        int i=st.executeUpdate(sql);
        
        if(i == 1){
            out.print("<script>swal({  title: 'Updated!', text: '', type: 'success', confirmButtonText: 'Done!'}, function(){ window.location.href='../admin/terms.jsp'; });</script>");
            
        }
        else{
            response.sendRedirect( "../admin/error.jsp");
        }
        
    }
    else if(request.getParameter("legal") != null){
        
        Statement st= getCon().createStatement();
        String sql = "update `website` set `desc` = '"+vId+"' where `title` = 'legal'";
        int i=st.executeUpdate(sql);
        
        if(i == 1){
            out.print("<script>swal({  title: 'Updated!', text: '', type: 'success', confirmButtonText: 'Done!'}, function(){ window.location.href='../admin/legal.jsp'; });</script>");
            
        }
        else{
            response.sendRedirect( "../admin/error.jsp");
        }
        
    }
    else{
        response.sendRedirect( "../../admin/category.jsp");
    }
    

%>
