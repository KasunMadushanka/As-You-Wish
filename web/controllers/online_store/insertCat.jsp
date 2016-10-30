<%@include file= "../../config/db_connection.jsp" %>

<html>
    <head>
        <script src="../../admin/assets/sweetalert-dev.js"></script>
        <link rel="stylesheet" href="../../admin/assets/sweetalert.css">
    </head>
    
</html>

<% 

    String catName = request.getParameter("Name");
    if(request.getParameter("sbmitNewCat") != null){
        
        Statement st= getCon().createStatement();
        String sql = "Insert into category(catName) values('"+catName+"');";
        int i=st.executeUpdate(sql);
        
        if(i == 1){
            out.print("<script>swal({  title: 'Category Inserted!', text: '', type: 'success', confirmButtonText: 'Done!'}, function(){ window.location.href='../../admin/category.jsp'; });</script>");
            
        }
        else{
            response.sendRedirect( "../../admin/error.jsp");
        }
        
    }
    else{
        response.sendRedirect( "../../admin/category.jsp");
    }
    

%>
