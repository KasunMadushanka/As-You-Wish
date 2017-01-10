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

    
    String customer_name = "";
    String partners_name = "";
    String mobile = "";
    String email = "";
    String address = "";
    String e_date = "";
    
    String conId = request.getParameter("conID");
    
    ResultSet rs0;
    String query0 = "SELECT * FROM `contest` WHERE `contest_id` = '"+conId+"'";
    rs0 = getCon().createStatement().executeQuery(query0);
    
    String sataus ="";
    String mon = "";
    String[] monthName = { "January", "February", "March", "April", "May", "June", "July","August", "September", "October", "November", "December" };
    
    
    while(rs0.next()){
        sataus = rs0.getString("status");
        mon = rs0.getString("year")+" "+monthName[(Integer.parseInt(rs0.getString("month")))-1];
    }

    response.setContentType("application/pdf");
    Document document = new Document();
    try {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, buffer);
        document.open();

        Paragraph title1 = new Paragraph("Contest", FontFactory.getFont(FontFactory.HELVETICA, 36, new CMYKColor(0, 255, 100, 20)));
        document.add(title1);
        document.add(new Phrase("--------------------------------"));
        
        Paragraph Oadd1 = new Paragraph("Sataus : "+sataus, FontFactory.getFont(FontFactory.HELVETICA, 11, new CMYKColor(100, 100, 0, 89)));
        document.add(Oadd1);
        
        Paragraph Oadd2 = new Paragraph("Contest Month : "+mon, FontFactory.getFont(FontFactory.HELVETICA, 11, new CMYKColor(100, 100, 0, 89)));
        document.add(Oadd2);
        
        
        document.add(new Phrase("--------------------------------"));
        
//    someSectionText = new Paragraph("Following is a 3 X 2 table.");
//    document.add(someSectionText);
        

        
        PdfPTable table = new PdfPTable(6);
        table.setWidthPercentage(100);
        PdfPCell cell;
        cell = new PdfPCell(new Paragraph(""));

        table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
        table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
        
        //table.getDefaultCell().setBorder(0);
        table.getDefaultCell().setFixedHeight(40);

        
        BaseColor myColor = new CMYKColor(66, 33, 0, 40);
        
        cell = new PdfPCell(new Paragraph("Contester"));
        cell.setBackgroundColor(myColor);
        cell.setFixedHeight(40);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);

        cell = new PdfPCell(new Paragraph("Mobile"));
        cell.setBackgroundColor(myColor);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);

        cell = new PdfPCell(new Paragraph("Email"));
        cell.setBackgroundColor(myColor);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);
        
        cell = new PdfPCell(new Paragraph("Position"));
        cell.setBackgroundColor(myColor);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);
        
        cell = new PdfPCell(new Paragraph("No of Votes"));
        cell.setBackgroundColor(myColor);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);
        
        cell = new PdfPCell(new Paragraph("as a Percentage"));
        cell.setBackgroundColor(myColor);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);

        FontFactory.getFont(FontFactory.HELVETICA, 1, new CMYKColor(0, 255, 100, 20));        

        
        ResultSet rs1;
        String query1 = "SELECT sum(`votes`) as x FROM `contestant` WHERE `contest_id` = '"+conId+"'";
        rs1 = getCon().createStatement().executeQuery(query1);
        float tot = 1;
        if(rs1.first()){
            tot = Integer.parseInt(rs1.getString("x"));
        }
        
        
        ResultSet rs;
        String query = "SELECT concat(`first_name`,' & ', `partner_first_name`) as couple , `mobile`, `email`,`votes` "
                + "FROM `contestant` as con inner join customer as cus on con.`customer_id` = cus.`customer_id` "
                + "WHERE `contest_id` = '"+conId+"' ORDER BY  `votes` DESC ";
        rs = getCon().createStatement().executeQuery(query);
        
        /*customer_name =rs.getString("title")+"."+rs.getString("first_name")+" "+rs.getString("last_name");
        partners_name = "";
        mobile = "";
        email = "";
        address = "";
        e_date = "";*/
        float vote = 0;
        int pos =1;
        while (rs.next()) {
            vote = (Integer.parseInt(rs.getString("votes"))/tot)*100;
            Font cellFont = FontFactory.getFont("times", 9);
            table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
            table.getDefaultCell().setFixedHeight(30);
            table.addCell((new Phrase(rs.getString("couple"),cellFont)));
            table.addCell((new Phrase(rs.getString("mobile"),cellFont)));
            table.addCell((new Phrase(rs.getString("email"),cellFont)));
            table.addCell((new Phrase(""+pos,cellFont)));
            table.addCell((new Phrase(rs.getString("votes"),cellFont)));
            table.addCell((new Phrase(""+String.format( "%.2f", vote )+" %",cellFont)));
            pos++;

        }


        float[] columnWidths = {25, 10, 15, 9,9,10};
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