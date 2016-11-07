<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../../config/db_connection.jsp" %>

<%
    String id = (String) session.getAttribute("id");

    String status = request.getParameter("status");
    String post_id = request.getParameter("post_id");

    File directory = null;
    int max = 0;
    String save_file = null, path = null, image_url = null;
    String[] files = null;

    if (status.equals("news_blog")) {

        path = "F:/Group Project/Project/AsYouWish/web/admin/assets/img/blog";
        directory = new File(path);
        if (!directory.exists()) {
            directory.mkdir();
        }
        save_file = path + "/" + post_id + ".jpg";
        image_url = save_file.substring(45);
        getCon().createStatement().executeUpdate("Update news_blog set image_url='" + image_url + "' where post_id='" + post_id + "'");

    }  

    session.setAttribute("image_url", save_file);

%>