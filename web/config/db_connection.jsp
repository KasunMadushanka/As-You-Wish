<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import ="java.sql.*" %>

<%!
    public static Connection getCon() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/as_you_wish", "root", "1234");
            return con;
        } catch (Exception e) { 
            e.printStackTrace();
            return null;
        }

    }
%>
