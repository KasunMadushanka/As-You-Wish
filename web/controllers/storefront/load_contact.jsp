<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "../../config/db_connection.jsp" %>
<%
    String vendor_id = (String) session.getAttribute("id");
    String service_id = (String) session.getAttribute("service_id");

    ResultSet rs = getCon().createStatement().executeQuery("Select contact_no,email,website_url,working_hours,address1,address2,city from service_registry where vendor_id='" + vendor_id + "' and service_id='" + service_id + "'");
    if (rs.first()) {%>
<div class="modal-body">
    <div class="row">
        <div class="form-group col-md-6">
            <label for="contact_no">Contact No:</label>
            <input id="contact_no" name="contact_no" class="form-control" type="text" value="<%=rs.getString("contact_no")%>">
        </div>
        <div class="form-group col-md-6">
            <label for="email">Email:</label>
            <input id="email" name="email" class="form-control" type="text" value="<%=rs.getString("email")%>">
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="website_url">Website URL:</label>
            <input id="website_url" name="website_url" class="form-control" type="text" value="<%=rs.getString("website_url")%>">
        </div>
        <div class="form-group col-md-6">
            <label for="working_hours">Working Hours:</label>
            <input id="working_hours" name="working_hours" class="form-control" type="text" value="<%=rs.getString("working_hours")%>">
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="address1">Address Line 1:</label>
            <input id="address1" name="address1" class="form-control" type="text" value="<%=rs.getString("address1")%>">
        </div>
        <div class="form-group col-md-6">
            <label for="address2">Address Line 2:</label>
            <input id="address2" name="address2" class="form-control" type="text" value="<%=rs.getString("address2")%>">
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-12">
            <label for="city">City:</label>
            <input id="city" name="city" class="form-control" type="text" value="<%=rs.getString("city")%>">
        </div>
    </div>
</div>
<div class="modal-footer">
    <div class="form-group text-center">
        <button type="button" onclick="update_contact()" class="btn btn-dark btn-theme-colored btn-flat mr-5">Apply Changes</button>
        <button type="reset" class="btn btn-default btn-flat btn-theme-colored">Reset</button>
    </div>
</div>
<%
    }
%>