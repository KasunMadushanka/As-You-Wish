<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "../../config/db_connection.jsp" %>
<%
    String package_id = (String) session.getAttribute("package_id");
   
    ResultSet rs=getCon().createStatement().executeQuery("Select pricing_id,title from vendor_pricing where package_id='"+package_id+"'");
    while(rs.next()){
      
    }
%>