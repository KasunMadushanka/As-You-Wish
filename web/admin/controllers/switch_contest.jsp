<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../../config/db_connection.jsp" %>
<%
    String status = request.getParameter("status");

    if (status.equals("active")) {
        getCon().createStatement().executeUpdate("Update contest_settings set status='active'");
    } else {
        getCon().createStatement().executeUpdate("Update contest_settings set status='inactive'");
    }

%>