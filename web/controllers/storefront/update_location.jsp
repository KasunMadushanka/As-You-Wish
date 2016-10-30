<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "../../config/db_connection.jsp" %>
<%
    String vendor_id = (String) session.getAttribute("id");
    String service_id = (String)session.getAttribute("service_id");

    String latitude = request.getParameter("latitude");
    String longitude = request.getParameter("longitude");
    String zoom_level = request.getParameter("zoom_level");
    String map_type = request.getParameter("map_type");

    getCon().createStatement().executeUpdate("Update service_registry set latitude='" + latitude + "',longitude='" + longitude + "',zoom_level='" + zoom_level + "',map_type='" + map_type + "' where vendor_id='" + vendor_id + "' and service_id='" + service_id + "'");

%>