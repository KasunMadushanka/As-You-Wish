<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.removeAttribute("id");
    session.removeAttribute("first_name");
    session.removeAttribute("last_name");
    session.removeAttribute("type");
    session.removeAttribute("email");
    session.invalidate();
%>
