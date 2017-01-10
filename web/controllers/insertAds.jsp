<%@include file= "../../config/db_connection.jsp" %>

<html>
    <head>
        <script src="../admin/assets/sweetalert-dev.js"></script>
        <link rel="stylesheet" href="../admin/assets/sweetalert.css">
    </head>
    
</html>

<% 

    String vId = request.getParameter("cat");
    String price = request.getParameter("price");
    String file = request.getParameter("file");
    String path = "images/Ads/"+file;
    if(request.getParameter("sbmitAds") != null){
        
        Statement st= getCon().createStatement();
        String sql = "Insert into ads(`vendorId`, `loc`, `payment`) values('"+vId+"','"+path+"','"+price+"');";
        int i=st.executeUpdate(sql);
        
        if(i == 1){
            out.print("<script>swal({  title: 'Adverisement Published!', text: '', type: 'success', confirmButtonText: 'Done!'}, function(){ window.location.href='../admin/vendorAds.jsp'; });</script>");
            
        }
        else{
            response.sendRedirect( "../admin/error.jsp");
        }
        
    }
    else{
        response.sendRedirect( "../../admin/category.jsp");
    }
    

%>
