<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.security.MessageDigest"%>
<%@include file= "../../config/db_connection.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>
<% 
    
    if(request.getParameter("pw") != null && request.getParameter("email") != null ){
        
        String pw = request.getParameter("pw");
        String email = request.getParameter("email");
    
        String hashed_pw=login(pw);
        
        ResultSet rs = getCon().createStatement().executeQuery("select * from adminAC where email='"+email+"' and pw='"+hashed_pw+"'");
        if (rs.first()) {
            session.setAttribute("id", rs.getString("admin_id"));
            session.setAttribute("email", rs.getString("email"));
            session.setAttribute("name", rs.getString("Name"));
            session.setAttribute("img", rs.getString("img"));
            session.setAttribute("pos", rs.getString("pos"));
            out.print("true");
        }
        else{
            out.print("false");
        }
        
        
        
    }
    else{
        out.print("false");
    }
    

%>
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
