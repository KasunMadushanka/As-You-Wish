<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@include file= "../../config/db_connection.jsp" %>

<html>
    <head>
        <script src="../../admin/assets/sweetalert-dev.js"></script>
        <link rel="stylesheet" href="../../admin/assets/sweetalert.css">
    </head>
    
</html>

<% 
    String Id = request.getParameter("ID");
    String Male = "";
    String Female = "";
    
    
    ResultSet rs;
    rs = getCon().createStatement().executeQuery("SELECT * FROM `customer` where customer_id ='"+Id+"' ");
    while(rs.next()){
        Male = rs.getString("first_name");
        Female = rs.getString("partner_first_name");
    }
    
    
    
    //title=ghjhjk&greeting=dfg&radioSelect=Man&imgs=2&imgs=3&imgs=7&imgs=9&imgs=10&imgCount=11
    String Title = request.getParameter("title");
    String Greet = request.getParameter("greeting");
    String radio = request.getParameter("radioSelect");
    
    String[] img = {};
    String Count ;
    int c = 0;
    
    String imgs = "";
    
    if(radio.equals("Man")){
        img = request.getParameterValues("imgs");
        for(String line : img){
            imgs = imgs+"?"+line;
            c++;
        }
        
    }else{
        Count = request.getParameter("image_count");
        c = Integer.parseInt(Count);
        for (int i = 1; i <= Integer.parseInt(Count);i++){
            imgs = imgs+"?"+i;
        }
    }
    
    Statement stx= getCon().createStatement();
    String sdd = "insert into `video` (`cust_Id`, `MaleName`, `FemaleName`, `title`, `text`, `imgCount`, `images`)"
            + "values ('"+Id+"','"+Male+"','"+Female+"','"+Title+"','"+Greet+"','"+c+"','"+imgs+"') ";
    int i = stx.executeUpdate(sdd);
    
        if(i == 1){
            out.print("<script>swal({  title: 'Video Link Created!', text: '', type: 'success', confirmButtonText: 'Done!'}, function(){ window.location.href='../../admin/videos.jsp'; });</script>");
     
        }
        else{
            response.sendRedirect( "../../admin/error.jsp");
        }
    
    
    
//    if(request.getParameter("sbmitNewCat") != null){
//        
//        Statement st= getCon().createStatement();
//        String sql = "Insert into category(catName) values('"+catName+"');";
//        int i=st.executeUpdate(sql);
//        
//        if(i == 1){
//            out.print("<script>swal({  title: 'Category Inserted!', text: '', type: 'success', confirmButtonText: 'Done!'}, function(){ window.location.href='../../admin/category.jsp'; });</script>");
//            
//        }
//        else{
//            response.sendRedirect( "../../admin/error.jsp");
//        }
//        
//    }
//    else{
//        response.sendRedirect( "../../admin/category.jsp");
//    }
    

%>
