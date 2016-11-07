<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "../../config/db_connection.jsp" %>
<%
    String post_id = request.getParameter("post_id");
    String count = request.getParameter("count");

    getCon().createStatement().executeUpdate("Update news_blog set likes='" + count + "' where post_id='" + post_id + "'");

%>