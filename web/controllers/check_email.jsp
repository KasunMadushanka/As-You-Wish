<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../config/db_connection.jsp" %>
<%
    String email = request.getParameter("email");
    String type = request.getParameter("type");

    if (type.equals("customer")) {
        ResultSet rs = getCon().createStatement().executeQuery("Select email from customer where email='" + email + "'");
        if (rs.first()) {
            out.print("exists");
        } else {
            out.print("available");
        }
    } else if (type.equals("vendor")) {
        ResultSet rs = getCon().createStatement().executeQuery("Select email from vendor where email='" + email + "'");
        if (rs.first()) {
            out.print("exists");
        } else {
            out.print("available");
        }
    }
%>
