<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("admin_email") == null) {
        response.sendRedirect("login.jsp");
    }
%>
