<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itextpdf.text.html.WebColors"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@page import="java.awt.Color"%>
<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.awt.geom.Rectangle"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.Chapter"%>
<%@page import="com.itextpdf.text.Section"%>
<%@page import="com.itextpdf.text.pdf.CMYKColor"%>
<%@page import="com.itextpdf.text.FontFactory"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.Anchor"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="java.io.DataOutputStream"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@ page trimDirectiveWhitespaces="true" %>  
<%@
page import="java.servlet.*,
     javax.servlet.http.*,
     java.io.*,
     java.util.*,
     com.lowagie.text.pdf.*,
     com.lowagie.text.*"
     %>

<%@ page import="java.io.*"%>
<%@include file= "../config/db_connection.jsp" %>





<%
    String Name = request.getParameter("conID");

//    if (Name == "") {
//        
//    } else {
//        response.sendRedirect("storeReports.jsp");
//    }
    
    ResultSet rs;
    String sql = "SELECT i.*, c.catName , s.sName, s.sAdd, s.sTel "
            + "FROM `items` as i "
            + "inner join category as c on c.catId = i.`catId` "
            + "inner join supplier as s on s.sId=i.`supId` "
            + "where `itemId` = '"+Name+"'";
    rs = getCon().createStatement().executeQuery(sql);
    
    String name = "";
    String cat = "";
    String price = "";
    String desc = "";
    String brand = "";
    String size = "";
    String color = "";
    String tag = "";
    String cStock = "";
    String reStock = "";
    String status = "";
    String sup = "";
    String add = "";
    String no = "";
    
    while(rs.next()){
        name = rs.getString("itemName");
        cat = rs.getString("catName");
        price = rs.getString("price");
        desc = rs.getString("desc");
        brand = rs.getString("brand");
        size = rs.getString("size");
        color = rs.getString("color");
        tag = rs.getString("tag");
        cStock = rs.getString("stock");
        reStock = rs.getString("margin");
        if(Integer.parseInt(reStock) - Integer.parseInt(cStock) > 0){
            status = "Need To be Re-Order";
        }else{
            status = "Avalible";
        }
        
        sup = rs.getString("sName");
        add = rs.getString("sAdd");
        no = rs.getString("sTel");
    }
    
    

    response.setContentType("application/pdf");
    Document document = new Document();
    try {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, buffer);
        document.open();

        Paragraph title1 = new Paragraph("Item Details Report ", FontFactory.getFont(FontFactory.HELVETICA, 36, new CMYKColor(0, 255, 255, 17)));
        document.add(title1);
        document.add(new Phrase("----------------------------"));
        
        
        Paragraph title2 = new Paragraph("Item Name: "+name, FontFactory.getFont(FontFactory.HELVETICA, 12, new CMYKColor(255, 255, 255, 255)));
        document.add(title2);
        
        Paragraph title3 = new Paragraph("Category: "+cat, FontFactory.getFont(FontFactory.HELVETICA, 12, new CMYKColor(255, 255, 255, 255)));
        document.add(title3);
        
        Paragraph title4 = new Paragraph("Price: "+price, FontFactory.getFont(FontFactory.HELVETICA, 12, new CMYKColor(255, 255, 255, 255)));
        document.add(title4);
        
        Paragraph title5 = new Paragraph("Description: "+desc, FontFactory.getFont(FontFactory.HELVETICA, 12, new CMYKColor(255, 255, 255, 255)));
        document.add(title5);
        
        Paragraph title6 = new Paragraph("Brand: "+brand, FontFactory.getFont(FontFactory.HELVETICA, 12, new CMYKColor(255, 255, 255, 255)));
        document.add(title6);
        
        Paragraph title7 = new Paragraph("Size: "+size, FontFactory.getFont(FontFactory.HELVETICA, 12, new CMYKColor(255, 255, 255, 255)));
        document.add(title7);
        
        Paragraph title8 = new Paragraph("Color: "+color, FontFactory.getFont(FontFactory.HELVETICA, 12, new CMYKColor(255, 255, 255, 255)));
        document.add(title8);
        
        Paragraph title9 = new Paragraph("Tag: "+tag, FontFactory.getFont(FontFactory.HELVETICA, 12, new CMYKColor(255, 255, 255, 255)));
        document.add(title9);
        
        Paragraph title10 = new Paragraph("Stock Status: "+status, FontFactory.getFont(FontFactory.HELVETICA, 12, new CMYKColor(255, 255, 255, 255)));
        document.add(title10);
        
        Paragraph title11 = new Paragraph("Supplier: "+sup, FontFactory.getFont(FontFactory.HELVETICA, 12, new CMYKColor(255, 255, 255, 255)));
        document.add(title11);
        
        Paragraph title12 = new Paragraph("Supplier Address: "+add, FontFactory.getFont(FontFactory.HELVETICA, 12, new CMYKColor(255, 255, 255, 255)));
        document.add(title12);
        
        Paragraph title13 = new Paragraph("Supplier Contact Number: "+no, FontFactory.getFont(FontFactory.HELVETICA, 12, new CMYKColor(255, 255, 255, 255)));
        document.add(title13);
        document.add(new Phrase(""));




        
        document.close();

        DataOutputStream dataOutput = new DataOutputStream(response.getOutputStream());
        byte[] bytes = buffer.toByteArray();
        response.setContentLength(bytes.length);
        for (int i = 0; i < bytes.length; i++) {
            dataOutput.writeByte(bytes[i]);
        }

        dataOutput.flush();
        dataOutput.close();
        return;
    } catch (DocumentException e) {
        e.printStackTrace();
    }

%>