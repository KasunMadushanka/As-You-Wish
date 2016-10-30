<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.removeAttribute("email");
    session.removeAttribute("name");
    session.removeAttribute("pos");
    session.removeAttribute("img");
    session.invalidate();
    
    response.sendRedirect("../login.html");
%>
