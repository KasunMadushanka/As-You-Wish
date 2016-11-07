<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../../config/db_connection.jsp" %>
<%
    String id = (String) session.getAttribute("id");
    String user_name = (String) session.getAttribute("name");

    String post_id = request.getParameter("post_id");
    String comment = request.getParameter("comment");

    DateFormat dateFormat1 = new SimpleDateFormat("dd/MM/yyyy");
    DateFormat dateFormat2 = new SimpleDateFormat("hh:mm a");
    Calendar cal = Calendar.getInstance();

    String date = dateFormat1.format(cal.getTime());
    String time = dateFormat2.format(cal.getTime());

    getCon().createStatement().executeUpdate("Insert into news_blog_comment (post_id,user_id,user_type,user_name,date,time,comment) values('" + post_id + "','" + id + "','admin','" + user_name + "','" + date + "','" + time + "','" + comment + "')");
    getCon().createStatement().executeUpdate("Update news_blog set comments=comments+1 where post_id='"+post_id+"'");
%>