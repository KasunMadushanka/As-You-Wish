<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../config/db_connection.jsp" %>
<%
    String id = request.getParameter("id");
    String type = request.getParameter("type");
    String password = request.getParameter("password");

    ResultSet rs=null;

    try {
        if (type.equals("customer")) {
            getCon().createStatement().executeUpdate("Update customer set password='" + password + "' where customer_id='" + id + "'");
            rs = getCon().createStatement().executeQuery("select email from customer where customer_id='" + id + "'");
        } else if (type.equals("vendor")) {
            getCon().createStatement().executeUpdate("Update vendor set password='" + password + "' where vendor_id='" + id + "'");
            rs = getCon().createStatement().executeQuery("select email from vendor where vendor_id='" + id + "'");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    if (rs.first()) {
        out.print(rs.getString("email"));
    }
%>