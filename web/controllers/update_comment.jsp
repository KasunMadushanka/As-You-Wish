<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../config/db_connection.jsp" %>
<%
    String id = (String) session.getAttribute("id");
    String user_type = (String) session.getAttribute("type");
    String user_name = (String) session.getAttribute("first_name");

    if (id != null) {

        String post_id = request.getParameter("post_id");
        String type = request.getParameter("type");
        String comment = request.getParameter("comment");

        DateFormat dateFormat1 = new SimpleDateFormat("dd/MM/yyyy");
        DateFormat dateFormat2 = new SimpleDateFormat("hh:mm a");
        Calendar cal = Calendar.getInstance();

        String date = dateFormat1.format(cal.getTime());
        String time = dateFormat2.format(cal.getTime());

        if (type.equals("customer")) {
            getCon().createStatement().executeUpdate("Insert into couple_blog_comment (post_id,user_id,user_type,user_name,date,time,comment) values('" + post_id + "','" + id + "','" + user_type + "','" + user_name + "','" + date + "','" + time + "','" + comment + "')");
        } else {
            getCon().createStatement().executeUpdate("Insert into vendor_blog_comment (post_id,user_id,user_type,user_name,date,time,comment) values('" + post_id + "','" + id + "','" + user_type + "','" + user_name + "','" + date + "','" + time + "','" + comment + "')");
        }
    } else {
        out.print("visitor");
    }

%>