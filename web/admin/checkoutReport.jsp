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

<%@ page import="java.io.*"%>
<%@include file= "../config/db_connection.jsp" %>





<%

    String id = "";
    id = request.getParameter("txt");
    String s = id;

    String name = "";
    String street = "";
    String cty = "";
    String pro = "";
    String etcAdd = "";
    String postal = "";
    Double pay = 0.00;

    DecimalFormat df = new DecimalFormat("#.00");

    Statement st = getCon().createStatement();
    String sql = "update  `checkout` Set `status` ='1' WHERE `id`='" + s + "'";
    st.executeUpdate(sql);

    ResultSet rs;
    rs = getCon().createStatement().executeQuery("SELECT * FROM `checkout` inner join payment on id = refCheck WHERE `id` = '" + s + "'");
    if (rs.first()) {
        //fname	lname	email	street	city	pro	etcAdd	postal	note	userId	status
        name = rs.getString("fname") + " " + rs.getString("lname");
        street = rs.getString("street");
        cty = rs.getString("city");
        pro = rs.getString("pro");
        etcAdd = rs.getString("etcAdd");
        postal = rs.getString("postal");
        pay = Double.parseDouble(rs.getString("price"));

    } else {
        response.sendRedirect("checkout.jsp");
    }

    response.setContentType("application/pdf");
    Document document = new Document();
    try {
        ByteArrayOutputStream buffer = new ByteArrayOutputStream();
        PdfWriter.getInstance(document, buffer);
        document.open();

        Paragraph title1 = new Paragraph("Invoice", FontFactory.getFont(FontFactory.HELVETICA, 36, new CMYKColor(0, 255, 255, 17)));
        document.add(title1);
        document.add(new Phrase(" "));

        Paragraph Oadd0 = new Paragraph("Customer Details,", FontFactory.getFont(FontFactory.HELVETICA, 11, new CMYKColor(58, 52, 51, 20)));
        document.add(Oadd0);
        document.add(new Phrase(" "));

        Paragraph Oadd1 = new Paragraph(name + ", ");
        document.add(Oadd1);

        Paragraph Oadd2 = new Paragraph(street + ",");
        document.add(Oadd2);

        Paragraph Oadd3 = new Paragraph(cty + ",");
        document.add(Oadd3);

        Paragraph Oadd4 = new Paragraph(pro + ".");
        document.add(Oadd4);

        Paragraph Oadd5 = new Paragraph(postal + ".");
        document.add(Oadd5);

        document.add(new Phrase(" "));

//    someSectionText = new Paragraph("Following is a 3 X 2 table.");
//    document.add(someSectionText);
        PdfPTable table = new PdfPTable(4);
        table.setWidthPercentage(100);
        PdfPCell cell;
        cell = new PdfPCell(new Paragraph("t"));

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

        cell = new PdfPCell(new Paragraph("Price"));
        cell.setBackgroundColor(myColor);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);

        cell = new PdfPCell(new Paragraph("Qty."));
        cell.setBackgroundColor(myColor);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);

        cell = new PdfPCell(new Paragraph("Amount"));
        cell.setBackgroundColor(myColor);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);

        ResultSet rs1;
        rs1 = getCon().createStatement().executeQuery("SELECT * FROM `list` inner join items on list.itemId = items.itemId WHERE refCheck ='" + s + "'");
        while (rs1.next()) {

            table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
            table.getDefaultCell().setFixedHeight(30);
            table.addCell(rs1.getString("itemName"));
            table.addCell(rs1.getString("price"));
            table.addCell(rs1.getString("qty"));
            Double dd = Double.parseDouble(rs1.getString("qty")) * Double.parseDouble(rs1.getString("price"));

            table.getDefaultCell().setHorizontalAlignment(Element.ALIGN_RIGHT);
            table.addCell(df.format(dd) + "  ");

        }

        for (int i = 0; i < 5; i++) {

        }

        Double p2 = pay - 500;

        cell = new PdfPCell(new Phrase(""));
        cell.setBorder(0);
        cell.setFixedHeight(30);
        table.addCell(cell);

        cell = new PdfPCell(new Phrase("Sub Total (LKR) :"));
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell.setColspan(2);
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(df.format(p2)));
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(""));
        cell.setBorder(0);
        cell.setFixedHeight(30);
        table.addCell(cell);

        cell = new PdfPCell(new Phrase("Shipping and Handling (LKR.) : "));
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell.setColspan(2);
        table.addCell(cell);

        cell = new PdfPCell(new Phrase("500.00"));
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(""));
        cell.setBorder(0);
        cell.setFixedHeight(30);
        table.addCell(cell);

        cell = new PdfPCell(new Phrase("Total (LKR.) : ", FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12)));
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        cell.setColspan(2);
        table.addCell(cell);

        cell = new PdfPCell(new Phrase(df.format(pay), FontFactory.getFont(FontFactory.HELVETICA_BOLD, 16)));
        cell.setHorizontalAlignment(Element.ALIGN_RIGHT);
        cell.setVerticalAlignment(Element.ALIGN_MIDDLE);
        table.addCell(cell);

        float[] columnWidths = {10, 5, 3, 6};
        table.setWidths(columnWidths);
//    

        document.add(table);

        document.add(new Phrase(" "));
        Paragraph Oadd6 = new Paragraph("Note(s) :");
        document.add(Oadd6);

        document.add(new Phrase(" "));
        Paragraph Oadd7 = new Paragraph("....................................................................................................................................................................................................................................................................................................................................................................................................................................................................................");
        document.add(Oadd7);

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