<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../../config/db_connection.jsp" %>
<%
    ArrayList votes = new ArrayList();

    ResultSet rs = getCon().createStatement().executeQuery("Select* from contest");
    while (rs.next()) {
        String[] values=new String[2];
        values[0]=rs.getString("customer_id");
        values[1]=rs.getString("votes");
        votes.add(values);
    }

    response.setContentType("application/json");
    new Gson().toJson(votes, response.getWriter());
  
%>

