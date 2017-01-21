<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../../config/db_connection.jsp" %>
<%
    String id = (String) session.getAttribute("id");
    String type = (String) session.getAttribute("type");
    String email = (String) session.getAttribute("email");

    String contestant_id = request.getParameter("contestant_id");

    ResultSet rs = getCon().createStatement().executeQuery("Select* from voter where user_id='" + id + "' and type='" + type + "'");
    if (rs.first()) {
        if (Integer.parseInt(rs.getString("votes")) < 3) {
            getCon().createStatement().executeUpdate("Update voter set votes=votes+1 where user_id='" + id + "' and type='" + type + "'");
            getCon().createStatement().executeUpdate("Insert into vote_registry values ('" + id + "','" + type + "','" +contestant_id + "')");
            getCon().createStatement().executeUpdate("Update contest set votes=votes+1 where customer_id='" + contestant_id + "'");
        }else{
        
        }
    } else {
        getCon().createStatement().executeUpdate("Insert into voter values ('" + id + "','" + type + "','" + email + "',1)");
        getCon().createStatement().executeUpdate("Insert into vote_registry values ('" + id + "','" + type + "','" +contestant_id + "')");
        getCon().createStatement().executeUpdate("Update contest set votes=votes+1 where customer_id='" + contestant_id + "'");
    }
    

%>