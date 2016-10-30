<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../config/db_connection.jsp" %>

<%
    String title = request.getParameter("title");
    String first_name = request.getParameter("first_name");
    String last_name = request.getParameter("last_name");
    String partner_first_name = request.getParameter("partner_first_name");
    String partner_last_name = request.getParameter("partner_last_name");
    String mobile = request.getParameter("mobile");
    String email = request.getParameter("email");
    String address1 = request.getParameter("address2");
    String address2 = request.getParameter("address2");
    String city = request.getParameter("city");
    String postal_code = request.getParameter("postal_code");
    String password = request.getParameter("password");
  
    getCon().createStatement().executeUpdate("Insert into customer (title,first_name,last_name,partner_first_name,partner_last_name,mobile,email,address1,address2,city,postal_code,password,status) values ('" + title + "','" + first_name + "','" + last_name + "'," + "'" + partner_first_name + "','" + partner_last_name + "','" + mobile + "','" + email + "','" + address1 + "'," + "'" + address2 + "','" + city + "','" + postal_code + "','" + password + "','"+"inactive"+"')");

    String customer_id;

    ResultSet rs = getCon().createStatement().executeQuery("Select max(customer_id) from customer");
    if (rs.first()) {
        customer_id = rs.getString("max(customer_id)");
    } else {
        customer_id = "1";
    }

    session.setAttribute("id", customer_id);
    session.setAttribute("email", email);
    session.setAttribute("status", "customer_verification");
    
%>