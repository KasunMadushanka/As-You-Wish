<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "../../config/db_connection.jsp" %>
<%
    String vendor_id = (String) session.getAttribute("id");
    String service_id=request.getParameter("service_id");
    
    String about=request.getParameter("about");

    getCon().createStatement().executeUpdate("Update service_registry set about='"+about+"' where vendor_id='"+vendor_id+"' and service_id='"+service_id+"'");
%>



