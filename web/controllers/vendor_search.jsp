<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../config/db_connection.jsp" %>

<%
    String term = request.getParameter("term");
    String service_id = request.getParameter("service_id");
    String option = request.getParameter("option");

    ArrayList vendors = new ArrayList();

    ResultSet rs = null;

    if (option.equals("1")) {
        rs = getCon().createStatement().executeQuery("Select v.vendor_id,v.company_name,sr.rating,sr.image from vendor v inner join service_registry sr on v.vendor_id=sr.vendor_id where sr.service_id='" + service_id + "' and v.company_name like '%" + term + "%'");
    } else if(option.equals("2")){
        rs = getCon().createStatement().executeQuery("Select v.vendor_id,v.company_name,sr.rating,sr.image from vendor v inner join service_registry sr on v.vendor_id=sr.vendor_id where sr.service_id='" + service_id + "' and v.company_city like '%" + term + "%'");
    }
    while (rs.next()) {

        String[] details = new String[4];

        details[0] = rs.getString("v.vendor_id");
        details[1] = rs.getString("v.company_name");
        details[2] = rs.getString("sr.image");
        details[3] = rs.getString("sr.rating");

        vendors.add(details);
    }
%>

<%for (int m = 0; m < vendors.size(); m++) {
        String[] vendor = (String[]) vendors.get(m);%>
<div class="col-sm-6 col-md-4 col-lg-4 mb-30">
    <div class="product">
        <span class="tag-sale">rating: <%=vendor[3]%></span>
        <div class="product-thumb"> <img alt="" src="<%=vendor[2]%>" width="260" height="150">
            <div class="overlay"></div>
        </div>
        <div class="product-details text-center">
            <a id="reception_hall1"><h5 class="product-title"><%=vendor[1]%></h5></a>
            <div class="star-rating" title="Rated 4.50 out of 5"><span style="width: 90%;">3.50</span></div>                                             
            <div class="btn-add-to-cart-wrapper">
                <a class="btn btn-default btn-xs btn-add-to-cart" href="storefront.jsp?id=<%=vendor[0]%>&service=<%=service_id%>">More Details</a>
            </div>
        </div>
    </div>
</div>
<%}%>