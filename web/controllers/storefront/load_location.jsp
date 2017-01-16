<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "../../config/db_connection.jsp" %>
<%
    String vendor_id = (String) session.getAttribute("id");
    String service_id = (String) session.getAttribute("service_id");

    ResultSet rs = getCon().createStatement().executeQuery("Select latitude,longitude,zoom_level,map_type from service_registry where vendor_id='" + vendor_id + "' and service_id='" + service_id + "'");
    if (rs.first()) {%>
<div class="modal-body">
    <div class="row">
        <div class="form-group col-md-6">
            <label for="latitude">Latitude:</label>
            <input id="latitude" name="latitude" class="form-control" type="text" value="<%=rs.getString("latitude")%>">
        </div>
        <div class="form-group col-md-6">
            <label for="longitude">Longitude:</label>
            <input id="longitude" name="longitude" class="form-control" type="text" value="<%=rs.getString("longitude")%>">
        </div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <label for="zoom_level">Zoom Level:</label>
            <input id="zoom_level" name="zoom_level" class="form-control" type="text" value="<%=rs.getString("zoom_level")%>">
        </div>
        <div class="form-group col-md-6">
            <label for="map_type">Map Type:</label>
            <select class="form-control" id="map_type" name="map_type">
                <option value="1" selected><%=rs.getString("map_type")%></option>
                <option value="2" >Satellite</option>
                <option value="3" >Hybrid</option>
                <option value="4" >Terrain</option>
            </select>
        </div>
    </div>
</div>
<div class="modal-footer">
    <div class="form-group text-center">
        <button type="button" onclick="update_location()" class="btn btn-dark btn-theme-colored btn-flat mr-5">Apply Changes</button>
        <button type="reset" class="btn btn-default btn-flat btn-theme-colored">Reset</button>
    </div>
</div>
<%
    }
%>