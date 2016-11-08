<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%> 
<%@include file= "../config/db_connection.jsp" %>

<%
    String msg = request.getParameter("msg2");
    String sender = request.getParameter("sender");
    String rev = request.getParameter("rev");
    String type = request.getParameter("revType");
    String uType = request.getParameter("uType");
    
    if ((msg != null)) {
        Statement st= getCon().createStatement();
        String sql = "insert into chat (`msg`, `revId`, `sendId`, `user`,`revType`,`userType`)"
                + "values ('"+msg+"','"+rev+"','"+sender+"','"+sender+"','"+type+"','"+uType+"')"; 
        int j = st.executeUpdate(sql);
        //out.print(j);
        
        
    }
    
    else{
        out.print("hasd");
    }
    
%>