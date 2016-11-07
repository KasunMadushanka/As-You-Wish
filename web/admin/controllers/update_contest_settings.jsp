<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../../config/db_connection.jsp" %>
<%
    String contest_title = request.getParameter("contest_title");
    String scheduled_from = request.getParameter("scheduled_from");
    String scheduled_to = request.getParameter("scheduled_to");
    String applications_from = request.getParameter("applications_from");
    String applications_to = request.getParameter("applications_to");
    String limit_of_contestants = request.getParameter("limit_of_contestants");
    String max_votes = request.getParameter("max_votes");
    String votes_per_contestant = request.getParameter("votes_per_contestant");
    String display_positions = request.getParameter("display_positions");
    String display_votes = request.getParameter("display_votes");

    getCon().createStatement().executeUpdate("Update contest_settings set contest_title='"+contest_title+"',scheduled_from='"+scheduled_from+"',scheduled_to='"+scheduled_to+"',applications_from='"+applications_from+"',applications_to='"+applications_to+"',limit_of_contestants='"+limit_of_contestants+"',max_votes='"+max_votes+"',votes_per_contestant='"+votes_per_contestant+"',display_positions='"+display_positions+"',display_votes='"+display_votes+"'");
   
%>