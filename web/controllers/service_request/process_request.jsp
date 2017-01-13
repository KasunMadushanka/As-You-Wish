<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../../config/db_connection.jsp" %>
<%
    String request_id = request.getParameter("request_id");
    String status=request.getParameter("status");

    getCon().createStatement().executeUpdate("Update service_request set status='"+status+"' where request_id='"+request_id+"'");

%>