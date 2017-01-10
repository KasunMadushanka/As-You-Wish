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

    String Name = "";
    String Start = "";
    String End = "";
    String btn = "";
    
    
    Name = request.getParameter("name");
    Start = request.getParameter("start");
    End = request.getParameter("end");
    btn = request.getParameter("btn");
    
    
    String[] startDay = Start.split("/");
    String[] endDay = End.split("/");
    
    Start = startDay[2]+"-"+startDay[0]+"-"+startDay[1];
    End = endDay[2]+"-"+endDay[0]+"-"+endDay[1];
    
    
    
    String name = "";
    Double pay = 0.00;
    String qty = "";

    DecimalFormat df = new DecimalFormat("#.00");
    
    ResultSet rs0;
    String sql0 = "SELECT `customer_id` FROM `customer` WHERE CONCAT(`first_name`, ' ', `last_name`)= '"+Name+"'";
    rs0 = getCon().createStatement().executeQuery(sql0);
    
    
    ResultSet rs;
    rs = getCon().createStatement().executeQuery("SELECT *,SUBSTRING_INDEX(`time`, ' ', 1) as x FROM `list` WHERE `userId` "
            + "= (SELECT `customer_id` FROM `customer` WHERE CONCAT(`first_name`, ' ', `last_name`)= '"+Name+"') "
            + "and `time` >= '"+Start+"' and `time` <= '"+End+"'");
    
    if (rs0.first()) {
        
    } else {
        response.sendRedirect("customerReports.jsp");
    }

    response.setContentType("application/pdf");
    Document document = new Document();
    try {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, buffer);
        document.open();

        Paragraph title1 = new Paragraph("Customer Purchase Details", FontFactory.getFont(FontFactory.HELVETICA, 36, new CMYKColor(0, 255, 255, 17)));
        document.add(title1);
        document.add(new Phrase("--------------------------------------------------------"));

        Paragraph Oadd0 = new Paragraph("Customer Name: "+Name, FontFactory.getFont(FontFactory.HELVETICA, 11));
        document.add(Oadd0);
        
        Paragraph Oadd1 = new Paragraph("Time Period: "+Start+" to "+End, FontFactory.getFont(FontFactory.HELVETICA, 11));
        document.add(Oadd1);
        document.add(new Phrase("--------------------------------------------------------"));

//    someSectionText = new Paragraph("Following is a 3 X 2 table.");
//    document.add(someSectionText);
        PdfPTable table = new PdfPTable(3);
        table.setWidthPercentage(100);
        PdfPCell cell;
        cell = new PdfPCell(new Paragraph(""));

        table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
        table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
        //table.getDefaultCell().setBorder(0);
        table.getDefaultCell().setFixedHeight(40);

        cell = new PdfPCell(new Paragraph("Item Name"));
        BaseColor myColor = WebColors.getRGBColor("#66CCFF");
        cell.setBackgroundColor(myColor);
        cell.setFixedHeight(40);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);

        cell = new PdfPCell(new Paragraph("Qty."));
        cell.setBackgroundColor(myColor);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);

        cell = new PdfPCell(new Paragraph("Date"));
        cell.setBackgroundColor(myColor);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);
        
        
        while (rs.next()) {
            
            table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
            table.getDefaultCell().setFixedHeight(30);
            String Iid= rs.getString("itemId");
            
            ResultSet rs1;
            rs1 = getCon().createStatement().executeQuery("SELECT itemName FROM items where itemId = '"+Iid+"'");
            while (rs1.next()) {
                table.addCell(rs1.getString("itemName"));
            }
           
            table.addCell(rs.getString("qty"));
            table.addCell(rs.getString("x"));
            
            

        }
        
        float[] columnWidths = {10, 3, 8};
        table.setWidths(columnWidths);
        
//    

        document.add(table);

        
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