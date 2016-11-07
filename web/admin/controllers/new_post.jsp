<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../../config/db_connection.jsp" %>

<%
    String id = (String) session.getAttribute("id");

    String title = request.getParameter("title");
    String content = request.getParameter("content");

    DateFormat dateFormat1 = new SimpleDateFormat("dd/MM/yyyy");
    DateFormat dateFormat2 = new SimpleDateFormat("hh:mm a");
    Calendar cal = Calendar.getInstance();

    String date = dateFormat1.format(cal.getTime());
    String time = dateFormat2.format(cal.getTime());

    String post_id = null;

    getCon().createStatement().executeUpdate("Insert into news_blog (admin_id,date,time,title,content,likes,comments,status) values ('" + id + "','" + date + "','" + time + "','" + title + "','" + content + "','" + 0 + "','" + 0 + "','" + "active" + "')");

    ResultSet rs = getCon().createStatement().executeQuery("Select max(post_id) from news_blog");
    if (rs.first()) {
        post_id = rs.getString("max(post_id)");
    } else {
        post_id = "1";
    }

    out.print(post_id);


%>