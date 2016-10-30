<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "../../config/db_connection.jsp" %>
<%
    String vendor_id = (String) session.getAttribute("id");
    String service_id = (String) session.getAttribute("service_id");

    String contact_no = request.getParameter("contact_no");
    String email = request.getParameter("email");
    String website_url = request.getParameter("website_url");
    String working_hours = request.getParameter("working_hours");
    String address1 = request.getParameter("address1");
    String address2 = request.getParameter("address2");
    String city = request.getParameter("city");

    getCon().createStatement().executeUpdate("Update service_registry set contact_no='" + contact_no + "',email='"+email+"',website_url='"+website_url+"',working_hours='"+working_hours+"',address1='"+address1+"',address2='"+address2+"',city='"+city+"' where vendor_id='" + vendor_id + "' and service_id='" + service_id + "'");
%>