<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../../config/db_connection.jsp" %>
<%
    String id = (String) session.getAttribute("id");
    String vendor_id = request.getParameter("vendor_id");
    String pricing_id = request.getParameter("pricing_id");

    getCon().createStatement().executeUpdate("Insert into service_request (customer_id,vendor_id,pricing_id,status) values ('"+id+"','"+vendor_id+"','"+pricing_id+"','0')");
    
%>