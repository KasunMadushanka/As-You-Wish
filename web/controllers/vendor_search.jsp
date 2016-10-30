<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../config/db_connection.jsp" %>

<%
    String term = request.getParameter("term");
    String service_id = request.getParameter("service");

    ArrayList vendors = new ArrayList();

    ResultSet rs = getCon().createStatement().executeQuery("Select vendor.vendor_id,vendor.company_name,service_registry.rank,service_registry.rating,service_registry.image_url from vendor inner join service_registry on vendor.vendor_id=service_registry.vendor_id where service_registry.service_id='" + service_id + "' and vendor.company_name like '%" + term + "%'");
    while (rs.next()) {

        String[] details = new String[5];

        details[0] = rs.getString("vendor_id");
        details[1] = rs.getString("company_name");
        details[2] = rs.getString("image_url");
        details[3] = rs.getString("rank");
        details[4] = rs.getString("rating");

        vendors.add(details);
    }
%>

<%for (int m = 0; m < vendors.size(); m++) {
        String[] vendor = (String[]) vendors.get(m);%>
<div class="col-sm-6 col-md-4 col-lg-4 mb-30">
    <div class="product">
        <span class="tag-sale">rank:<%=vendor[3]%></span>
        <div class="product-thumb"> <img alt="" src="<%=vendor[2]%>" class="img-responsive thumbnail">
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