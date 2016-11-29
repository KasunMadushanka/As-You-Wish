<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../../config/db_connection.jsp" %>
<%
    String dropbox_status = request.getParameter("dropbox_status");
    String dropbox_app_key = request.getParameter("dropbox_app_key");
    String dropbox_app_secret = request.getParameter("dropbox_app_secret");
   
    getCon().createStatement().executeUpdate("Update backup_settings set dropbox_status='"+dropbox_status+"',dropbox_app_key='"+dropbox_app_key+"',dropbox_app_secret='"+dropbox_app_secret+"'");
   
%>