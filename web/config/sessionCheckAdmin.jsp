<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("email") == null) {
        response.sendRedirect("login.jsp");
    }
%>
