<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../../config/db_connection.jsp" %>
<%
    String customer_id = request.getParameter("customer_id");
    String request_id=request.getParameter("request_id");

    ResultSet rs = getCon().createStatement().executeQuery("Select * from request_registry where customer_id='" + customer_id + "'");
    if (rs.first()) {
%>
<div class="modal-body">
    <div class="container col-md-12">
        <div class="row">
            <div class="form-group col-md-2">
                <label><b>Tradition:</b></label>
            </div>  
            <div class="form-group col-md-4">
                <label><%=rs.getString("tradition")%></label>
            </div>  
            <div class="form-group col-md-2">
                <label><b>Date:</b></label>
            </div>  
            <div class="form-group col-md-4">
                <label><%=rs.getString("date")%></label>
            </div>  
        </div>  
        <div class="row">
            <div class="form-group col-md-2">
                <label><b>Time:</b></label>
            </div>  
            <div class="form-group col-md-4">
                <label><%=rs.getString("time")%></label>
            </div>  
            <div class="form-group col-md-2">
                <label><b>Duration:</b></label>
            </div>  
            <div class="form-group col-md-4">
                <label><%=rs.getString("duration")%></label>
            </div>  
        </div>  
        <div class="row">
            <div class="form-group col-md-2">
                <label><b>Guests:</b></label>
            </div>  
            <div class="form-group col-md-10">
                <label><%=rs.getString("no_of_guests")%></label>
            </div>  
        </div>  
        <div class="row">
            <div class="form-group col-md-12">
                <label><b>Theme Preferences:</b></label>
            </div> 
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label><%=rs.getString("theme")%></label>
            </div> 
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label><b>Additional Details:</b></label>
            </div> 
        </div>
        <div class="row">
            <div class="form-group col-md-12">
                <label><%=rs.getString("additional_details")%></label>
            </div> 
        </div>
    </div>
</div>
<div class="modal-footer">
    <div class="form-group text-center">
        <div class="row">                               
            <button type="button" class="btn btn-dark btn-theme-colored btn-flat" onclick="process_request(<%=request_id%>,'accepted')">Accept</button>
            <button type="button" class="btn btn-dark btn-theme-colored btn-flat" onclick="process_request(<%=request_id%>,'discarded')">Discard</button>
        </div>
    </div>
</div>
<%}%>