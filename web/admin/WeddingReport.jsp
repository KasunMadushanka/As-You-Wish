<%@page import="javafx.scene.layout.Border"%>
<%@page import="com.itextpdf.text.Image"%>
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

    
    String C_name = "";
    String V_name = "";
    String Cadd = "";
    String Vadd = "";
    String PrID = "";
    
    String ServiceID = request.getParameter("id");

    //vendor_id, first_name, last_name, mobile, email, address1, address2, city, postal_code, company_name, company_contact_no, company_email, company_website_url, company_fb_page, company_address1, company_address2, company_city, company_postal_code, password, title, status, image_url, pricing, payment
    
    String Sqladdress = "select s.*, c.`first_name`, c.`last_name`, c.`address1`,"
            + " c.`address2`, c.`city`, c.`postal_code`, v.`company_address1`, "
            + "v.`company_address2`, v.`company_city`, v.`company_postal_code`, v.`company_name` "
            + "from  service_request as s "
            + "inner join customer as c on c.customer_id = s.customer_id "
            + "inner join vendor as v on v.vendor_id = s.vendor_id "
            + "where `request_id` = '"+ServiceID+"'";
    
    ResultSet rs;
    rs = getCon().createStatement().executeQuery(Sqladdress);
    while(rs.next()){
        C_name = rs.getString("c.first_name")+" "+rs.getString("c.last_name");
        V_name = rs.getString("company_name");
        Cadd = rs.getString("c.address1")+",\n"+rs.getString("c.address2")+",\n"+rs.getString("c.city")+",\n"+rs.getString("c.postal_code")+".";
        Vadd = rs.getString("v.company_address1")+",\n"+rs.getString("v.company_address2")+",\n"+rs.getString("v.company_city")+",\n"+rs.getString("v.company_postal_code")+".";
        PrID = rs.getString("pricing_id");
    }    
        

    
    

    response.setContentType("application/pdf");
    Document document = new Document();
    try {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, buffer);
        document.open();
        
        Image img = Image.getInstance("D:/Group Project/Project/AsYouWish/web/admin/assets/img/login-bg/logo.png");
        img.scaleAbsolute(250f, 150f);
        //document.add(img);
        
        
        PdfPTable table = new PdfPTable(2);
        table.setWidthPercentage(100);
        PdfPCell cell;
        cell = new PdfPCell(new Paragraph(""));

        
        
        //table.getDefaultCell().setBorder(0);
        table.getDefaultCell().setFixedHeight(150);
        table.getDefaultCell().setBorder(0);

        table.addCell(img);
        
        table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
        table.getDefaultCell().setVerticalAlignment(Element.ALIGN_TOP);
        table.addCell("\n\n University of Colombo School of Computing, \n Reid Avenue, \n Colombo 7");
        
         
        table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_LEFT);
        
        table.getDefaultCell().setFixedHeight(20);
        
        Paragraph title1 = new Paragraph("Customer Details", FontFactory.getFont(FontFactory.HELVETICA, 16, new CMYKColor(0, 255, 100, 20)));
        table.addCell(title1);
        Paragraph title2 = new Paragraph("Vendor Details", FontFactory.getFont(FontFactory.HELVETICA, 16, new CMYKColor(0, 255, 100, 20)));
        table.addCell(title2);
        
        table.getDefaultCell().setFixedHeight(80);
        table.addCell(C_name+"\n"+Cadd);
        table.addCell(V_name+"\n"+Vadd);
        
        document.add(table);
        
        
        PdfPTable table1 = new PdfPTable(3);
        table1.setWidthPercentage(100);
        PdfPCell cell1;
        cell1 = new PdfPCell(new Paragraph(""));

        table1.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
        table1.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
        
        //table.getDefaultCell().setBorder(0);
        table1.getDefaultCell().setFixedHeight(40);

        
        BaseColor myColor = new CMYKColor(66, 33, 0, 40);
        
        cell1 = new PdfPCell(new Paragraph("Title"));
        cell1.setBackgroundColor(myColor);
        cell1.setFixedHeight(40);
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table1.addCell(cell1);

        cell1 = new PdfPCell(new Paragraph("Features"));
        cell1.setBackgroundColor(myColor);
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table1.addCell(cell1);

        cell1 = new PdfPCell(new Paragraph("Price (LKR.)"));
        cell1.setBackgroundColor(myColor);
        cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table1.addCell(cell1);

        

        FontFactory.getFont(FontFactory.HELVETICA, 1, new CMYKColor(0, 255, 100, 20));        

        
        ResultSet rs1;
        String query1 = "SELECT * FROM `vendor_pricing` WHERE `pricing_id` = '"+PrID+"'";
        rs1 = getCon().createStatement().executeQuery(query1);
        
        double tot = 0.00;
        
        while (rs1.next()) {
            
            tot = tot + Double.parseDouble(rs1.getString("price"));
            
            Font cellFont = FontFactory.getFont("times", 12);
            Font cellFont1 = FontFactory.getFont("times", 13);
            table1.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
            table1.getDefaultCell().setFixedHeight(90);
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            table1.addCell((new Phrase(rs1.getString("title"),cellFont)));
            table1.addCell((new Phrase(rs1.getString("features"),cellFont)));
            table1.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
            
            table1.addCell((new Phrase(rs1.getString("price")+".00",cellFont1)));
                        

        }
        
        DecimalFormat df = new DecimalFormat("#.00");
        
        
        
        cell1 = new PdfPCell(new Phrase("Sub Total (LKR) :"));
        cell1.setFixedHeight(30);
        cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setColspan(2);
        table1.addCell(cell1);

        cell1 = new PdfPCell(new Phrase(df.format(tot)));
        cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table1.addCell(cell1);

        

        cell1 = new PdfPCell(new Phrase("Discount (10%) : "));
        cell1.setFixedHeight(30);
        cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setColspan(2);
        table1.addCell(cell1);

        cell1 = new PdfPCell(new Phrase(df.format(tot*10/100)));
        cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table1.addCell(cell1);

        

        cell1 = new PdfPCell(new Phrase("Total (LKR.) : "));
        cell1.setFixedHeight(30);
        cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell1.setColspan(2);
        table1.addCell(cell1);

        cell1 = new PdfPCell(new Phrase(df.format((tot*90/100)), FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16)));
        cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table1.addCell(cell1);
        
        

        cell1 = new PdfPCell(new Phrase(df.format(tot*10/100)));
        cell1.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table1.addCell(cell1);


        float[] columnWidths = {5, 15, 9};
        table1.setWidths(columnWidths);
//    

        document.add(table1);
        
        
        
        
//    someSectionText = new Paragraph("Following is a 3 X 2 table.");
//    document.add(someSectionText);
        

        
        
//    

       

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