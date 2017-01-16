<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "../../config/db_connection.jsp" %>
<%
    String vendor_id = (String) session.getAttribute("id");
    String service_id = (String)session.getAttribute("service_id");

    ResultSet rs = getCon().createStatement().executeQuery("Select vision from service_registry where vendor_id='" + vendor_id + "' and service_id='" + service_id + "'");
    if (rs.first()) {%>
<div class="modal-body">
    <label for="vision_text">Our Vision:</label>
    <textarea id="vision_text" name="vision_text" class="form-control" rows="6" placeholder=""><%=rs.getString("vision")%></textarea>
</div>
<div class="modal-footer">
    <div class="form-group text-center">
        <button type="button" onclick="update_vision()" class="btn btn-dark btn-theme-colored btn-flat mr-5">Apply Changes</button>
        <button type="reset" class="btn btn-default btn-flat btn-theme-colored">Reset</button>
    </div>
</div>
<%
    }
%>

