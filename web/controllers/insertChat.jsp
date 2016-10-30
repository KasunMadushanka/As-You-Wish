<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%> 
<%@include file= "../config/db_connection.jsp" %>

<%
    String contentType = request.getParameter("msg2");
    if ((contentType != null)) {
        Statement st= getCon().createStatement();
        String sql = "insert into chat (`msg`, `revId`, `sendId`, `user`)"
                + "values ('"+contentType+"','1','0','1')"; 
        int j = st.executeUpdate(sql);
        //out.print(j);
        
        
    }
    
    else{
        out.print("hasd");
    }
    
%>