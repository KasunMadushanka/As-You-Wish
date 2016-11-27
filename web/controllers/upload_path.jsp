
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
    String save_file = null, image_url = null,route=null;
    String path = "F:/Group Project/Project/AsYouWish/web/";
    String[] files = null;

    if (status.equals("customer_profile")) {
        
        route="images/customer/profile";
        path +=route;
        
        directory = new File(path);
        
        if (!directory.exists()) {
            directory.mkdir();
        }
        
        save_file = path + "/" + id + ".jpg";
        image_url =route+"/" + id + ".jpg";
        
        getCon().createStatement().executeUpdate("Update customer set image_url='" + image_url + "' where customer_id='" + id + "'");

    } else if (status.equals("couple_blog")) {
        
        route="images/customer/blog/" + id;
          path +=route;
        
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
        image_url=route+"/" + (max + 1) + ".jpg";
      
        getCon().createStatement().executeUpdate("Update couple_blog set image_url='" + image_url + "' where post_id='" + post_id + "'");

    } else if (status.equals("customer_gallery")) {

        route= "images/customer/gallery/" + id;
        path+=route;
        
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
        image_url = route+"/" + (max + 1) + ".jpg";
        
        getCon().createStatement().executeUpdate("Update customer_gallery set image_url='" + image_url + "'");

    } else if (status.equals("vendor_profile")) {

        route = "images/vendor/profile";
        path+=route;
        
        directory = new File(path);

        if (!directory.exists()) {
            directory.mkdir();
        }

        save_file = path + "/" + id + ".jpg";
        image_url = route+"/" + id + ".jpg";
        
        getCon().createStatement().executeUpdate("Update vendor set image_url='" + image_url + "' where vendor_id='" + id + "'");

    } else if (status.equals("vendor_blog")) {

        route = "images/vendor/blog/" + id + "/" + service;
        path+=route;
        
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

        save_file = path + "/" + (max + 1) + ".jpg";
        image_url = route+"/" + (max + 1) + ".jpg";
        
        getCon().createStatement().executeUpdate("Update vendor_blog set image_url='" + image_url + "' where post_id='" + post_id + "'");

    } else if (status.equals("vendor_gallery")) {

        route = "images/vendor/gallery/" + id;
        path+=route;
        
        directory = new File(path);
    } else if (status.equals("vendor_storefront")) {

        route = "images/vendor/storefront/" + id + "/" + service;
        path+=route;
        
        directory = new File(path);
    }

    session.setAttribute("image_url", save_file);

%>