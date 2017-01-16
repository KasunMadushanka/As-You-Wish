<%@page import="com.dropbox.core.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.Locale"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
    DbxWebAuthNoRedirect webAuth = (DbxWebAuthNoRedirect) session.getAttribute("webAuth");
    DbxRequestConfig configuration = (DbxRequestConfig) session.getAttribute("configuration");
    
    DbxAuthFinish authFinish = webAuth.finish(request.getParameter("code"));
    String accessToken = authFinish.accessToken;
    
    DbxClient client = new DbxClient(configuration, accessToken);
    
    System.out.println("Linked account: " + client.getAccountInfo().displayName);
    
    File inputFile = new File("E:backup/db.sql");
    FileInputStream inputStream = new FileInputStream(inputFile);
    try {
        DbxEntry.File uploadedFile = client.uploadFile("/db.sql",
                DbxWriteMode.add(), inputFile.length(), inputStream);
        System.out.println("Uploaded: " + uploadedFile.toString());
    } finally {
        inputStream.close();
    }
    
%>
