<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file= "../config/db_connection.jsp" %>
<%
    String service1 = request.getParameter("service1");
    String service2 = request.getParameter("service2");
    String service3 = request.getParameter("service3");
    String service4 = request.getParameter("service4");
    String service5 = request.getParameter("service5");
    String service6 = request.getParameter("service6");
    String service7 = request.getParameter("service7");
    String service8 = request.getParameter("service8");
    String service9 = request.getParameter("service9");

    String budget1 = request.getParameter("budget1");
    String budget2 = request.getParameter("budget2");
    String budget3 = request.getParameter("budget3");
    String budget4 = request.getParameter("budget4");
    String budget5 = request.getParameter("budget5");
    String budget6 = request.getParameter("budget6");
    String budget7 = request.getParameter("budget7");
    String budget8 = request.getParameter("budget8");
    String budget9 = request.getParameter("budget9");

    int[] service_list = new int[9];
    int[] budget_list = new int[9];

    if (service1.equals("true")) {
        service_list[0] = 1;
        budget_list[0] = Integer.parseInt(budget1);
    }
    if (service2.equals("true")) {
        service_list[1] = 1;
        budget_list[1] = Integer.parseInt(budget2);
    }
    if (service3.equals("true")) {
        service_list[2] = 1;
        budget_list[2] = Integer.parseInt(budget3);
    }
    if (service4.equals("true")) {
        service_list[3] = 1;
        budget_list[3] = Integer.parseInt(budget4);
    }
    if (service5.equals("true")) {
        service_list[4] = 1;
        budget_list[4] = Integer.parseInt(budget5);
    }
    if (service6.equals("true")) {
        service_list[5] = 1;
        budget_list[5] = Integer.parseInt(budget6);
    }
    if (service7.equals("true")) {
        service_list[6] = 1;
        budget_list[6] = Integer.parseInt(budget7);
    }
    if (service8.equals("true")) {
        service_list[7] = 1;
        budget_list[7] = Integer.parseInt(budget8);
    }
    if (service9.equals("true")) {
        service_list[8] = 1;
        budget_list[8] = Integer.parseInt(budget9);
    }

    String[][] vendors = new String[9][1];
    String[][] amounts = new String[9][1];
    String[][] addresses = new String[9][1];
    String[][] contacts = new String[9][1];
    String[][] images = new String[9][1];

    String[] service_names = {"Reception Halls", "Cake Designers", "Beauticians", "Bridal Dresses", "Groom Suits", "Photography", "Decorations", "Entertainment Groups", "Wedding Cars"};

    for (int i = 0; i < service_list.length; i++) {
        if (service_list[i] == 1) {

            ArrayList vendor_list = new ArrayList();
            ArrayList amount_list = new ArrayList();
            ArrayList address_list = new ArrayList();
            ArrayList contact_list = new ArrayList();
            ArrayList image_list = new ArrayList();
            String SqlQ = "Select* from service_registry where service_id='" + (i + 1) + "'";
            
            ResultSet rs = getCon().createStatement().executeQuery(SqlQ);
            out.println(SqlQ);
            while (rs.next()) {

                ResultSet rs1 = getCon().createStatement().executeQuery("Select* from vendor where vendor_id='" + rs.getInt("vendor_id") + "' ");
                if (rs1.first()) {
                    vendor_list.add(rs1.getString("company_name"));
                    address_list.add(rs1.getString("company_no") + ", " + rs1.getString("company_street") + ", " + rs1.getString("company_city"));
                    contact_list.add(rs1.getString("company_contact_no"));

                }

                amount_list.add(rs.getInt("amount"));
                image_list.add(rs.getString("image_url"));

            }

            if (vendor_list.size() > 0) {

                String[][] data = sort(budget_list[i], vendor_list, amount_list, address_list, contact_list, image_list);
                vendors[i] = data[0];
                amounts[i] = data[1];
                addresses[i] = data[2];
                contacts[i] = data[3];
                images[i] = data[4];

            }

        }
    }


%>

<%! String[][] sort(int budget, ArrayList vendor_list, ArrayList amount_list, ArrayList address_list, ArrayList contact_list, ArrayList image_list) {

        int n = amount_list.size();

        int[] differences = new int[n];
        String[] vendors = new String[n];
        String[] amounts = new String[n];
        String[] addresses = new String[n];
        String[] contacts = new String[n];
        String[] images = new String[n];

        for (int i = 0; i < n; i++) {
            differences[i] = Math.abs(budget - (Integer)amount_list.get(i));
            vendors[i] = vendor_list.get(i).toString();
            amounts[i] = amount_list.get(i).toString();
            addresses[i] = address_list.get(i).toString();
            contacts[i] = contact_list.get(i).toString();
            images[i] = image_list.get(i).toString();

        }

        int temp = 0;
        String temp1, temp2, temp3, temp4, temp5 = null;

        for (int i = 0; i < n; i++) {
            for (int j = 1; j < n - i; j++) {
                if (differences[j - 1] > differences[j]) {

                    temp = differences[j];
                    temp1 = vendors[j];
                    temp2 = amounts[j];
                    temp3 = addresses[j];
                    temp4 = contacts[j];
                    temp5 = images[j];

                    differences[j] = differences[j - 1];
                    vendors[j] = vendors[j - 1];
                    amounts[j] = amounts[j - 1];
                    addresses[j] = addresses[j - 1];
                    contacts[j] = contacts[j - 1];
                    images[j] = images[j - 1];

                    differences[j - 1] = temp;
                    vendors[j - 1] = temp1;
                    amounts[j - 1] = temp2;
                    addresses[j - 1] = temp3;
                    contacts[j - 1] = temp4;
                    images[j - 1] = temp5;
                }

            }
        }

        String data[][] = {vendors, amounts, addresses, contacts, images};
        return data;
    }
%>
