<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%  
    String emailAdmin = "";
    String NameAdmin = "";
    String PosAdmin = "";
    String imgAdmin = "";
    
    if(session.getAttribute("email") != null){
        
        emailAdmin = ""+session.getAttribute("email");
        NameAdmin = ""+session.getAttribute("name");
        PosAdmin = ""+session.getAttribute("pos");
        imgAdmin = ""+session.getAttribute("img");
        
        
    }else{
        response.sendRedirect("login.html");
    }
%>
