<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../../config/db_connection.jsp" %>

<%
    String post_id = request.getParameter("post_id");

    ResultSet rs = getCon().createStatement().executeQuery("Select* from news_blog_comment where post_id='" + post_id + "'");
    while (rs.next()) {
        StringBuffer comment = new StringBuffer(rs.getString("comment"));
        if (comment.length() > 75) {
            comment.setCharAt(75, '\n');
        }
%>
<ul>
    <li class=""><%=rs.getString("user_name") + ": "%></li>
    <p><%=comment%></p>
    <li class=""><%=rs.getString("date") + " at " + rs.getString("time")%></li>
    <hr>
</ul>

<% }%>
