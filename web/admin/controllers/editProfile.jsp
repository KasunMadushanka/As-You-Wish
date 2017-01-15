<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="com.sun.xml.internal.bind.v2.model.core.ID"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../../config/db_connection.jsp" %>


<%!    public static final String SALT = "as-you-wish";

    public String login(String password) {
        Boolean isAuthenticated = false;

        String saltedPassword = SALT + password;
        String hashedPassword = generateHash(saltedPassword);

        return hashedPassword;
    }

    public static String generateHash(String input) {
        StringBuilder hash = new StringBuilder();

        try {
            MessageDigest sha = MessageDigest.getInstance("SHA-1");
            byte[] hashedBytes = sha.digest(input.getBytes());
            char[] digits = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'a', 'b', 'c', 'd', 'e', 'f'};
            for (int idx = 0; idx < hashedBytes.length; idx++) {
                byte b = hashedBytes[idx];
                hash.append(digits[(b & 0xf0) >> 4]);
                hash.append(digits[b & 0x0f]);
            }
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        return hash.toString();
    }

%>




<%
    String id = (String) session.getAttribute("admin_email");
    
    if(request.getParameter("btn").equals("newPw")) {
        String newPw = request.getParameter("pwNew");
        String hashed_password = login(newPw);
        Statement stx= getCon().createStatement();
        String sdd = "update adminac set pw = '"+hashed_password+"' where email = '"+id+"' ";
        int i = stx.executeUpdate(sdd);
        if(i ==1){
            response.sendRedirect("../profile.jsp");
        }
    }
    
    if(request.getParameter("btn").equals("newpos")) {
        String newPw = request.getParameter("pos");
        
        Statement stx= getCon().createStatement();
        String sdd = "update adminac set pos = '"+newPw+"' where email = '"+id+"' ";
        int i = stx.executeUpdate(sdd);
        //out.println(sdd);
        if(i ==1){
            response.sendRedirect("../profile.jsp");
        }
    }

%>