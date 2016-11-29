<%@page import="com.dropbox.core.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../../config/db_connection.jsp" %>

<%
    
    
    String APP_KEY = null;
    String APP_SECRET = null;

    try {
        ResultSet rs = getCon().createStatement().executeQuery("Select dropbox_app_key,dropbox_app_secret from backup_settings");
        if (rs.first()) {
            APP_KEY = rs.getString("dropbox_app_key");
            APP_SECRET = rs.getString("dropbox_app_secret");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

    DbxAppInfo appInfo = new DbxAppInfo(APP_KEY, APP_SECRET);

    DbxRequestConfig configuration = new DbxRequestConfig("JavaTutorial/1.0",
            Locale.getDefault().toString());
    DbxWebAuthNoRedirect webAuth = new DbxWebAuthNoRedirect(configuration, appInfo);

    // Have the user sign in and authorize your app.
    String authorizeUrl = webAuth.start();
    
    session.setAttribute("webAuth", webAuth);
    session.setAttribute("configuration", configuration);
    
    response.sendRedirect(authorizeUrl);

    

%>
<%!
   

%>
