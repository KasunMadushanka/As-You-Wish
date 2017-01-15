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

    String vId = "";
    String Cname = "";
    String moblie = "";
    String email = "";
    String price = "";
    String cno = "";
    
    String Name = request.getParameter("VName");
    
    ResultSet rs0;
    String sql0 = "SELECT * FROM `vendor` WHERE company_name= '"+Name+"'";
    rs0 = getCon().createStatement().executeQuery(sql0);
    
    
   
    if (rs0.first()) {
        vId = rs0.getString("vendor_id");
        //`first_name`, `last_name`, `mobile`, `email`, `city`, `title`, `pricing`
        Cname = rs0.getString("title")+". "+rs0.getString("first_name")+" "+rs0.getString("last_name");
        moblie = rs0.getString("mobile");
        email = rs0.getString("email");
        price = rs0.getString("pricing");
        cno = rs0.getString("company_contact_no");
        
        
    } else {
        //response.sendRedirect("vendorReports.jsp");
    }
    
    

    response.setContentType("application/pdf");
    Document document = new Document();
    try {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, buffer);
        document.open();

        Paragraph title1 = new Paragraph("Vendor Details", FontFactory.getFont(FontFactory.HELVETICA, 36, new CMYKColor(0, 255, 100, 20)));
        document.add(title1);
        document.add(new Phrase("--------------------------------"));
        
        Paragraph Oadd2 = new Paragraph("Company Name : "+Name, FontFactory.getFont(FontFactory.HELVETICA, 11, new CMYKColor(100, 100, 0, 89)));
        document.add(Oadd2);
        
        Paragraph Oadd3 = new Paragraph("Company Contact Number : "+cno, FontFactory.getFont(FontFactory.HELVETICA, 11, new CMYKColor(100, 100, 0, 89)));
        document.add(Oadd3);
        
        Paragraph Oadd4 = new Paragraph("Contact Person : "+Cname, FontFactory.getFont(FontFactory.HELVETICA, 11, new CMYKColor(100, 100, 0, 89)));
        document.add(Oadd4);
        
        Paragraph Oadd5 = new Paragraph("Contact Person tel : "+moblie, FontFactory.getFont(FontFactory.HELVETICA, 11, new CMYKColor(100, 100, 0, 89)));
        document.add(Oadd5);
        
        
        Paragraph Oadd6 = new Paragraph("Email : "+email, FontFactory.getFont(FontFactory.HELVETICA, 11, new CMYKColor(100, 100, 0, 89)));
        document.add(Oadd6);
        
        Paragraph Oadd7 = new Paragraph("Payments : "+price, FontFactory.getFont(FontFactory.HELVETICA, 11, new CMYKColor(100, 100, 0, 89)));
        document.add(Oadd7);
        
        
        
        
        document.add(new Phrase("--------------------------------"));
        
//    someSectionText = new Paragraph("Following is a 3 X 2 table.");
//    document.add(someSectionText);
        
        Paragraph title2 = new Paragraph("Pakages", FontFactory.getFont(FontFactory.HELVETICA, 16, new CMYKColor(0, 160, 100, 20)));
        document.add(title2);
        document.add(new Phrase(""));
        
        PdfPTable table = new PdfPTable(3);
        table.setWidthPercentage(100);
        PdfPCell cell;
        cell = new PdfPCell(new Paragraph(""));

        table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
        table.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);
        
        //table.getDefaultCell().setBorder(0);
        table.getDefaultCell().setFixedHeight(40);

        
        BaseColor myColor = new CMYKColor(66, 33, 0, 40);
        
        cell = new PdfPCell(new Paragraph("Title"));
        cell.setBackgroundColor(myColor);
        cell.setFixedHeight(40);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);

        cell = new PdfPCell(new Paragraph("Type"));
        cell.setBackgroundColor(myColor);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);

        cell = new PdfPCell(new Paragraph("Description"));
        cell.setBackgroundColor(myColor);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);

        FontFactory.getFont(FontFactory.HELVETICA, 1, new CMYKColor(0, 255, 100, 20));        

        
        ResultSet rs;
        String query = "SELECT * FROM `vendor_package` WHERE `registry_id` = '"+vId+"'";
        rs = getCon().createStatement().executeQuery(query);
        
        /*customer_name =rs.getString("title")+"."+rs.getString("first_name")+" "+rs.getString("last_name");
        partners_name = "";
        mobile = "";
        email = "";
        address = "";
        e_date = "";*/
        
        while (rs.next()) {
            Font cellFont = FontFactory.getFont("times", 9);
            table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
            table.getDefaultCell().setFixedHeight(30);
            table.addCell((new Phrase(rs.getString("title"),cellFont)));
            table.addCell((new Phrase(rs.getString("type"),cellFont)));
            table.addCell((new Phrase(rs.getString("description"),cellFont)));
          
            

        }


        float[] columnWidths = {10, 5, 15};
        table.setWidths(columnWidths);
//    

        document.add(table);
        
        
//        ######################################################################################

        Paragraph title3 = new Paragraph("Pakage Pricing", FontFactory.getFont(FontFactory.HELVETICA, 16, new CMYKColor(0, 160, 100, 20)));
        document.add(title3);
        
        ResultSet rs1;
        String query1 = "SELECT * FROM `vendor_package` WHERE `registry_id` = '"+vId+"'";
        rs1 = getCon().createStatement().executeQuery(query1);
        
        while(rs1.next()){
        
            Paragraph title4 = new Paragraph("Pakage : "+rs1.getString("title"), FontFactory.getFont(FontFactory.HELVETICA, 16, new CMYKColor(0, 120, 90, 57)));
            document.add(title4);
            document.add(new Phrase(""));

            PdfPTable table1 = new PdfPTable(3);
            table1.setWidthPercentage(100);
            PdfPCell cell1;
            cell1 = new PdfPCell(new Paragraph(""));

            table1.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
            table1.getDefaultCell().setVerticalAlignment(Element.ALIGN_MIDDLE);

            //table.getDefaultCell().setBorder(0);
            table1.getDefaultCell().setFixedHeight(40);


            BaseColor myColor1 = new CMYKColor(66, 33, 0, 40);

            cell1 = new PdfPCell(new Paragraph("Pricing Type"));
            cell1.setBackgroundColor(myColor1);
            cell1.setFixedHeight(40);
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
            table1.addCell(cell1);

            cell1 = new PdfPCell(new Paragraph("Features"));
            cell1.setBackgroundColor(myColor1);
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
            table1.addCell(cell1);

            cell1 = new PdfPCell(new Paragraph("Price"));
            cell1.setBackgroundColor(myColor1);
            cell1.setHorizontalAlignment(Element.ALIGN_CENTER);
            cell1.setVerticalAlignment(Element.ALIGN_MIDDLE);
            table1.addCell(cell1);

            FontFactory.getFont(FontFactory.HELVETICA, 1, new CMYKColor(0, 255, 100, 20));        


            ResultSet rs2;
            String query2 = "SELECT * FROM `vendor_pricing` WHERE `package_id` ='"+rs1.getString("package_id")+"' order by price desc";
            rs2 = getCon().createStatement().executeQuery(query2);

            while (rs2.next()) {
                Font cellFont = FontFactory.getFont("times", 9);
                table1.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
                table1.getDefaultCell().setFixedHeight(30);

                table1.addCell((new Phrase(rs2.getString("title"),cellFont)));
                table1.addCell((new Phrase(rs2.getString("features"),cellFont)));
                table1.addCell((new Phrase(rs2.getString("price"),cellFont)));


            }


            float[] columnWidths1 = {5, 20, 5};
            table1.setWidths(columnWidths1);
    //    

            document.add(table1);
        
        }
        

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