<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../config/db_connection.jsp" %>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    ResultSet rs = getCon().createStatement().executeQuery("Select* from visitor where email='" + email + "' and password='"+password+"'");
    if (rs.first()) {
        session.setAttribute("id", rs.getString("visitor_id"));
        session.setAttribute("first_name", rs.getString("first_name"));
        session.setAttribute("last_name", rs.getString("last_name"));
        session.setAttribute("email", rs.getString("email"));
        session.setAttribute("type", "visitor");
        
        out.print("valid");
    } else {
        out.print("invalid");
    }


%>