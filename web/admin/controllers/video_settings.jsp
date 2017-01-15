<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../../config/db_connection.jsp" %>

<%
    String customer_id=request.getParameter("id");
    String title = request.getParameter("title");
    String greeting = request.getParameter("greeting");
    String speed = request.getParameter("speed");
    int image_count = Integer.parseInt(request.getParameter("image_count"));
    
    getCon().createStatement().executeUpdate("Insert into video_setting (customer_id,title,greeting,speed,image_count) values ('"+customer_id+"','" + title + "','" + greeting + "','" + speed + "'," + "'" + image_count + "')");
    
    
%>