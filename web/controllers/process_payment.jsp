<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "../config/db_connection.jsp" %>
<%
    String id = (String) session.getAttribute("id");
    String pricing = (String) session.getAttribute("pricing");

    ResultSet rs = getCon().createStatement().executeQuery("Select price from pricing where title='" + pricing + "'");
    if (rs.first()) {
        double price = rs.getDouble("price");
        getCon().createStatement().executeUpdate("Update vendor set payment='" + price + "' where vendor_id='" + id + "'");
    }

%>