<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>File Upload</title>
    </head>
    <body>
        <%out.print(getServletContext().getRealPath("/"));%>
        <form method="post" action="FileUpload" enctype="multipart/form-data">
           
            <input type="file" name="dataFile" id="fileChooser"/><br/><br/>
            <input type="submit"/>
        </form>
    </body>
</html>