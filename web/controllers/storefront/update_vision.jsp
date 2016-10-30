<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "../../config/db_connection.jsp" %>
<%
    String vendor_id = (String) session.getAttribute("id");
    String service_id = request.getParameter("service_id");

    String vision = request.getParameter("vision");
    
     getCon().createStatement().executeUpdate("Update service_registry set vision='"+vision+"' where vendor_id='"+vendor_id+"' and service_id='"+service_id+"'");
%>