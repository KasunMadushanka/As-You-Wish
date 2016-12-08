<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "../../config/db_connection.jsp" %>
<%
    String pricing_id = (String) session.getAttribute("pricing_id");
   
    ResultSet rs=getCon().createStatement().executeQuery("Select features from vendor_pricing where pricing_id='"+pricing_id+"'");
    while(rs.next()){
      
    }
%>