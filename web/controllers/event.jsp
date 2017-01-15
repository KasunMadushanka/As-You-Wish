<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "../config/db_connection.jsp" %>
<%

    String id = (String) session.getAttribute("id");

    String tradition = request.getParameter("tradition");
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    String duration = request.getParameter("duration");
    String no_of_guests = request.getParameter("no_of_guests");
    String theme = request.getParameter("theme");
    String additional_details = request.getParameter("additional_details");

    ResultSet rs = getCon().createStatement().executeQuery("Select customer_id from request_registry where customer_id='" + id + "'");
    if (rs.first()) {
        getCon().createStatement().executeUpdate("Update request_registry set tradition='" + tradition + "',date='" + date + "',time='" + time + "',duration='" + duration + "',no_of_guests='" + no_of_guests + "',theme='" + theme + "',additional_details='" + additional_details + "' where customer_id='"+id+"'");
    }else{ 
         getCon().createStatement().executeUpdate("Insert into request_registry values('" + id + "','" + tradition + "','"+ date+ " ','"+ time+ " ','"+ duration+ " ','"+ no_of_guests+ " ','"+ theme+ " ','"+ additional_details+ "')");
    }
 
%>