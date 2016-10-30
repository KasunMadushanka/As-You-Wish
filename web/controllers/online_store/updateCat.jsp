<%@include file= "../../config/db_connection.jsp" %>

<html>
    <head>
        <script src="../../admin/assets/sweetalert-dev.js"></script>
        <link rel="stylesheet" href="../../admin/assets/sweetalert.css">
    </head>
    
</html>

<% 

    String catName = request.getParameter("Name");
    String catId = request.getParameter("catId");
    if(request.getParameter("updateCat") != null){
        
        Statement st= getCon().createStatement();
        String sql = "update category set catName = '"+catName+"' where catId = '"+catId+"' ";
        int i=st.executeUpdate(sql);
        
        if(i == 1){
            out.print("<script>swal({  title: 'Category Updated!', text: '', type: 'success', confirmButtonText: 'Done!'}, function(){ window.location.href='../../admin/category.jsp'; });</script>");
            
        }
        else{
            response.sendRedirect( "../../admin/error.jsp");
        }
        
    }
    else{
        response.sendRedirect( "../../admin/category.jsp");
    }
    

%>
