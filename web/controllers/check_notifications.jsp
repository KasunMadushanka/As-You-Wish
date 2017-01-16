<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../config/db_connection.jsp" %>
<%
    String id = request.getParameter("id");
    String type = request.getParameter("type");

    if (type.equals("customer")) {
        ResultSet rs = getCon().createStatement().executeQuery("Select count(*) as x from service_request where customer_id='" + id + "' and status='3'");
        if (rs.first()) {
            if (Integer.parseInt(rs.getString("x")) != 0) {%>
<li><a href="request_payment.jsp">Your Request accepted</a></li>                                  
    <%}
        }
    } else if (type.equals("vendor")) {
        ResultSet rs = getCon().createStatement().executeQuery("Select count(*) as x from service_request where vendor_id='" + id + "' and status='1'");
        if (rs.first()) {
            if (Integer.parseInt(rs.getString("x")) != 0) {%>
<li><a href="service_requests.jsp"><%=rs.getString("x")%> New Requests</a></li>
    <%
                }
            }
        }
    %>
