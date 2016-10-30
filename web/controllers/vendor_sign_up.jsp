<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../config/db_connection.jsp" %>

<%
    String title = request.getParameter("title");
    String first_name = request.getParameter("first_name");
    String last_name = request.getParameter("last_name");
    String mobile = request.getParameter("mobile");
    String email = request.getParameter("email");
    String address1 = request.getParameter("address1");
    String address2 = request.getParameter("address2");
    String city = request.getParameter("city");
    String postal_code = request.getParameter("postal_code");
    String password = request.getParameter("password");

    String company_name = request.getParameter("company_name");
    String company_contact_no = request.getParameter("company_contact_no");
    String company_email = request.getParameter("company_email");
    String company_website_url = request.getParameter("company_website_url");
    String company_fb_page = request.getParameter("company_fb_page");
    String company_address1 = request.getParameter("company_address1");
    String company_address2 = request.getParameter("company_address2");
    String company_city = request.getParameter("comapny_city");
    String company_postal_code = request.getParameter("company_postal_code");

    String service1 = request.getParameter("service1");
    String service2 = request.getParameter("service2");
    String service3 = request.getParameter("service3");
    String service4 = request.getParameter("service4");
    String service5 = request.getParameter("service5");
    String service6 = request.getParameter("service6");
    String service7 = request.getParameter("service7");
    String service8 = request.getParameter("service8");
    String service9 = request.getParameter("service9");
    
    String pricing = request.getParameter("pricing");

    String[] services = {service1, service2, service3, service4, service5, service6, service7, service8, service9};

    getCon().createStatement().executeUpdate("Insert into vendor (title,first_name,last_name,mobile,email,address1,address2,city,postal_code,company_name,company_contact_no,company_email,company_website_url,company_fb_page,company_address1,company_address2,company_city,company_postal_code,password,pricing,status) values ('" + title + "','" + first_name + "','" + last_name + "'," + "'" + mobile + "','" + email + "','" + address1 + "','" + address2 + "','" + city + "'," + "'" + postal_code + "','" + company_name + "','" + company_contact_no + "','" + company_email + "','" + company_website_url + "','" + company_fb_page + "','" + company_address1 + "','" + company_address2 + "','" + company_city + "','" + company_postal_code + "','" + password + "','"+pricing+"','"+"inactive"+"')");

    String vendor_id;

    ResultSet rs = getCon().createStatement().executeQuery("Select max(vendor_id) from vendor");
    if (rs.first()) {
        vendor_id = rs.getString("max(vendor_id)");
    } else {
        vendor_id = "1";
    }

    for (int j = 0; j < services.length; j++) {
        if (services[j].equals("true")) {
            getCon().createStatement().executeUpdate("Insert into service_registry (vendor_id,service_id,status) values('" + vendor_id + "','" + (j + 1) + "','"+"inactive"+"')");
        }
    }

    session.setAttribute("services", services);

    session.setAttribute("id", vendor_id);
    session.setAttribute("email", email);
    session.setAttribute("status", "vendor_verification");

%>

