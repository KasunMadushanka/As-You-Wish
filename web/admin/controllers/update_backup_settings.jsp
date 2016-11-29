<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../../config/db_connection.jsp" %>
<%
    String backup_status=request.getParameter("backup_status");
    String backup_schedule = request.getParameter("backup_schedule");
    String backup_path = request.getParameter("backup_path");
    
    getCon().createStatement().executeUpdate("Update backup_settings set backup_status='"+backup_status+"',backup_schedule='"+backup_schedule+"',backup_path='"+backup_path+"'");
   
%>