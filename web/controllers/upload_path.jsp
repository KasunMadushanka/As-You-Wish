
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@include file= "../config/db_connection.jsp" %>

<%
    String id = (String) session.getAttribute("id");

    String status = request.getParameter("status");
    String service = request.getParameter("service_id");
    String post_id = request.getParameter("post_id");

    File directory = null;
    int max = 0;
    String save_file = null, path = null, image_url = null;
    String[] files = null;

    if (status.equals("customer_profile")) {

        path = "F:/Project/AsYouWish/web/images/customer/profile";
        directory = new File(path);
        if (!directory.exists()) {
            directory.mkdir();
        }
        save_file = path + "/" + id + ".jpg";
        image_url = save_file.substring(25);
        getCon().createStatement().executeUpdate("Update customer set image_url='" + image_url + "' where customer_id='" + id + "'");

    } else if (status.equals("couple_blog")) {

        path = "F:/Project/AsYouWish/web/images/customer/blog/" + id;
        directory = new File(path);

        if (!directory.exists()) {
            directory.mkdir();
        }

        files = directory.list();

        for (String name : files) {
            int pos = name.lastIndexOf(".");
            if (pos > 0) {
                name = name.substring(0, pos);
            }
            if (max < Integer.parseInt(name)) {
                max = Integer.parseInt(name);
            }
        }

        save_file = path + "/" + (max + 1) + ".jpg";
        image_url = save_file.substring(25);
        getCon().createStatement().executeUpdate("Update couple_blog set image_url='" + image_url + "' where post_id='" + post_id + "'");

    } else if (status.equals("customer_gallery")) {

        path = "F:/Project/AsYouWish/web/images/customer/gallery/" + id;
        directory = new File(path);

        if (!directory.exists()) {
            directory.mkdir();
        }

        files = directory.list();

        for (String name : files) {
            int pos = name.lastIndexOf(".");
            if (pos > 0) {
                name = name.substring(0, pos);
            }
            if (max < Integer.parseInt(name)) {
                max = Integer.parseInt(name);
            }
        }

        save_file = path + "/" + (max + 1) + ".jpg";
        image_url = save_file.substring(25);
        getCon().createStatement().executeUpdate("Update customer_gallery set image_url='" + image_url + "'");

    } else if (status.equals("vendor_profile")) {

        path = "F:/Project/AsYouWish/web/images/vendor/profile";
        directory = new File(path);

        if (!directory.exists()) {
            directory.mkdir();
        }

        save_file = path + "/" + id + ".jpg";
        image_url = save_file.substring(25);
        getCon().createStatement().executeUpdate("Update vendor set image_url='" + image_url + "' where vendor_id='" + id + "'");

    } else if (status.equals("vendor_blog")) {

        path = "F:/Project/AsYouWish/web/images/vendor/blog/" + id + "/" + service;
        directory = new File(path);

        if (!directory.exists()) {
            directory.mkdirs();
        }

        files = directory.list();

        if (directory.exists()) {
            for (String name : files) {
                int pos = name.lastIndexOf(".");
                if (pos > 0) {
                    name = name.substring(0, pos);
                }
                if (max < Integer.parseInt(name)) {
                    max = Integer.parseInt(name);
                }
            }
        }

        save_file = path + "/" + (max+1) + ".jpg";
        image_url = save_file.substring(25);
        getCon().createStatement().executeUpdate("Update vendor_blog set image_url='" + image_url + "' where post_id='"+post_id+"'");
        
    } else if (status.equals("vendor_gallery")) {

        path = "F:/Project/AsYouWish/web/images/vendor/gallery/" + id;
        directory = new File(path);
    } else if (status.equals("vendor_storefront")) {

        path = "F:/Project/AsYouWish/web/images/vendor/storefront/" + id + "/" + service;
        directory = new File(path);
    }

    session.setAttribute("image_url", save_file);

%>