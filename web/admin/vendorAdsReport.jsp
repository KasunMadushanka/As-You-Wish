<%@page import="com.itextpdf.text.Font"%>
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

    
    String customer_name = request.getParameter("name");
    String custID= "";
    
    //SELECT `customer_id` FROM `customer` WHERE CONCAT(`first_name`, ' ', `last_name`)= 'Kasun Maduranga'
    
    ResultSet rs0;
    String sql0 = "SELECT `vendor_id` FROM `vendor` where `company_name` = '"+customer_name+"'";
    rs0 = getCon().createStatement().executeQuery(sql0);
    while(rs0.next()){
        custID= rs0.getString("vendor_id");
    }
    
    
    response.setContentType("application/pdf");
    Document document = new Document();
    try {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, buffer);
        document.open();

        Paragraph title1 = new Paragraph("Vendor Advertisemnts Purchases", FontFactory.getFont(FontFactory.HELVETICA, 36, new CMYKColor(0, 255, 100, 20)));
        document.add(title1);
        document.add(new Phrase("---------------------------------------------------------------------------------------------"));
        
        
        Paragraph Oadd0 = new Paragraph("Company Name: "+customer_name, FontFactory.getFont(FontFactory.HELVETICA, 11, new CMYKColor(100, 100, 0, 89)));
        document.add(Oadd0);
        
        document.add(new Phrase("---------------------------------------------------------------------------------------------"));
        
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

        
        BaseColor myColor = new CMYKColor(66, 33, 0, 40);
        
        cell = new PdfPCell(new Paragraph("Payment Date"));
        cell.setBackgroundColor(myColor);
        cell.setFixedHeight(40);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);

        cell = new PdfPCell(new Paragraph("Paid Amount"));
        cell.setBackgroundColor(myColor);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);

        cell = new PdfPCell(new Paragraph("Status"));
        cell.setBackgroundColor(myColor);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);

        FontFactory.getFont(FontFactory.HELVETICA, 1, new CMYKColor(0, 255, 100, 20));        

        
        ResultSet rs;
        String query = "SELECT *,SUBSTRING_INDEX(`payment_date`, ' ', 1) as x FROM `ads` WHERE `vendorId` = '"+custID+"'";
        rs = getCon().createStatement().executeQuery(query);
        
        //`date`, `time`, `title`, `likes`, `comments`
        String St = "";
        
        while (rs.next()) {
            if(rs.getString("status").equals("on")){
                St = "Active";
            }
            else{
                St = "Deactive";
            }
            
            Font cellFont = FontFactory.getFont("times", 9);
            table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
            table.getDefaultCell().setFixedHeight(30);
            table.addCell((new Phrase(rs.getString("x"),cellFont)));
            table.addCell((new Phrase(rs.getString("payment"),cellFont)));
            table.addCell((new Phrase(St,cellFont)));
            

        }


        float[] columnWidths = {10, 10, 7};
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