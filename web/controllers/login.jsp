<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../config/db_connection.jsp" %>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    String user_type = request.getParameter("user_type");

    ResultSet rs;

    if (user_type.equals("customer")) {
        rs = getCon().createStatement().executeQuery("select * from customer where email='" + email + "' and password='" + password + "'");
        if (rs.next()) {
            session.setAttribute("id", rs.getString("customer_id"));
            session.setAttribute("first_name", rs.getString("first_name"));
            session.setAttribute("last_name", rs.getString("last_name"));
            session.setAttribute("type", "customer");
            session.setAttribute("email", rs.getString("email"));
        } else {
            out.print("invalid");
        }

    } else {
        rs = getCon().createStatement().executeQuery("select * from vendor where email='" + email + "' and password='" + password + "'");
        if (rs.next()) {
            session.setAttribute("id", rs.getString("vendor_id"));
            session.setAttribute("first_name", rs.getString("first_name"));
            session.setAttribute("last_name", rs.getString("last_name"));
            session.setAttribute("type", "vendor");
            session.setAttribute("email", rs.getString("email"));
            session.setAttribute("company_name", rs.getString("company_name"));

            ArrayList services_list = new ArrayList();

            ResultSet rs2 = getCon().createStatement().executeQuery("Select service.service_id,service.name from service inner join service_registry on service.service_id=service_registry.service_id where vendor_id='" + rs.getString("vendor_id") + "'");
            while (rs2.next()) {
                String[] values = new String[2];

                values[0] = rs2.getString("service_id");
                values[1] = rs2.getString("name");

                services_list.add(values);
            }
            String[] service = (String[]) services_list.get(0);
            session.setAttribute("services", services_list);
            out.print(service[0]);

        } else {
            out.print("invalid");
        }
    }
%>
