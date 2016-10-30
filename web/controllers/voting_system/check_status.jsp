<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../../config/db_connection.jsp" %>
<%
    String id = (String) session.getAttribute("id");
    String type = (String) session.getAttribute("type");

    ArrayList voted_list = new ArrayList();

    response.setContentType("application/json");

    ResultSet rs = getCon().createStatement().executeQuery("Select* from voter where user_id='" + id + "' and type='" + type + "'");
    if (rs.first()) {
        ResultSet rs1 = getCon().createStatement().executeQuery("Select customer_id from vote_registry where user_id='" + id + "' and type='" + type + "'");
        while (rs1.next()) {
            voted_list.add(rs1.getString("customer_id"));
        }
    }
    new Gson().toJson(voted_list, response.getWriter());

%>
