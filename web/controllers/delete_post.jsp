<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "../config/db_connection.jsp" %>
<%
    String post_id = request.getParameter("post_id");
    String type = request.getParameter("type");

    if (type.equals("customer")) {
        getCon().createStatement().executeUpdate("Update couple_blog set status='" + "hidden" + "' where post_id='"+post_id+"'");
    } else {
        getCon().createStatement().executeUpdate("Update vendor_blog set status='" + "hidden" + "' where post_id='"+post_id+"'");
    }


%>
