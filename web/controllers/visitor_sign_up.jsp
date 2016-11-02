<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../config/db_connection.jsp" %>

<%
    String first_name = request.getParameter("first_name");
    String last_name = request.getParameter("last_name");
    String email = request.getParameter("email");
     String password= request.getParameter("password");

    ResultSet rs = getCon().createStatement().executeQuery("Select* from visitor where email='" + email + "'");
    if (rs.first()) {
        out.print("invalid");
    } else {
        getCon().createStatement().executeUpdate("Insert into visitor (first_name,last_name,email,password,status) values('" + first_name + "','" + last_name + "','" + email + "','"+password+"','inactive')");
        out.print("valid");
    }

%>