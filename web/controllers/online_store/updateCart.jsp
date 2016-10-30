<%@include file= "../../config/db_connection.jsp" %>

<html>
    <head>
        <script src="../../admin/assets/sweetalert-dev.js"></script>
        <link rel="stylesheet" href="../../admin/assets/sweetalert.css">
    </head>
    
</html>

<% 

    String cust = request.getParameter("cust");
    String item = request.getParameter("item");
    String qty = request.getParameter("quantity");
    int old = Integer.parseInt(request.getParameter("oldqty"));
    
    
    if(request.getParameter("update") != null){
        
        Statement st= getCon().createStatement();
        String sql = "Update cart set qty = '"+qty+"' where `custId` = '"+cust+"' and `itemId`= '"+item+"'";
        int i=st.executeUpdate(sql);
        
        
        Statement st1= getCon().createStatement();
        String sql1 = "Update items set stock = stock+"+old+"-"+qty+" where `itemId` = '"+item+"'";
        st1.executeUpdate(sql1); 
        
        if(i == 1){
            out.print("<script>swal({  title: 'Item Updated!', text: '', type: 'success', confirmButtonText: 'Done!'}, function(){ window.location.href='../../cart.jsp?txt="+cust +"'; });</script>");
            
        }
        else{
            response.sendRedirect( "../admin/error.jsp");
        }
        
    }
    else if(request.getParameter("delete") != null){
        
        Statement st= getCon().createStatement();
        String sql = "delete from cart where `custId` = '"+cust+"' and `itemId`= '"+item+"'";
        int i=st.executeUpdate(sql);
        
        Statement st1= getCon().createStatement();
        String sql1 = "Update items set stock = stock+"+old+" where `itemId` = '"+item+"'";
        st1.executeUpdate(sql1); 
        
        if(i == 1){
            out.print("<script>swal({  title: 'Item deleted!', text: '', type: 'success', confirmButtonText: 'Done!'}, function(){ window.location.href='../../cart.jsp?txt="+cust +"'; });</script>");
            
        }
        else{
            response.sendRedirect( "../../admin/error.jsp");
        }
        
    }
    else{
        response.sendRedirect( "../../admin/category.jsp");
    }
    

%>
