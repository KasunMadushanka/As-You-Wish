<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../config/db_connection.jsp" %>

<%
    String id = (String) session.getAttribute("id");

    String title = request.getParameter("title");
    String first_name = request.getParameter("first_name");
    String last_name = request.getParameter("last_name");
    String partner_first_name = request.getParameter("partner_first_name");
    String partner_last_name = request.getParameter("partner_last_name");
    String mobile = request.getParameter("mobile");
    String address1 = request.getParameter("address1");
    String address2 = request.getParameter("address2");
    String city = request.getParameter("city");
    String postal_code = request.getParameter("postal_code");
    String password = request.getParameter("password");

    getCon().createStatement().executeUpdate("Update customer set title='" + title + "',first_name='" + first_name + "',last_name='" + last_name + "',partner_first_name=" + "'" + partner_first_name + "',partner_last_name='" + partner_last_name + "',mobile='" + mobile + "',address1='" + address1 + "',address2='" + address2 + "',city='" + city + "',postal_code='" + postal_code + "' where customer_id='" + id + "'");

    String hashed_password = null;

    if (password != "") {
        hashed_password = get_hash(password);
        getCon().createStatement().executeUpdate("Update customer set password='" + hashed_password + "' where customer_id='" + id + "'");

    }

%>
<%!    Map DB = new HashMap();
    public static final String SALT = "as-you-wish";

    public String get_hash(String password) {
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