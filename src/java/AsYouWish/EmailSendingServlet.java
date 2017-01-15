package AsYouWish;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//@WebServlet("/EmailSendingServlet")
public class EmailSendingServlet extends HttpServlet {

    private String host;
    private String port;
    private String user;
    private String pass;

    public void init() {
        // reads SMTP server setting from web.xml file
        ServletContext context = getServletContext();
        host = "smtp.gmail.com";
        port = "587";
        user = "asyouwish077@gmail.com";
        pass = "asyouwish";
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String recipient_email = request.getParameter("recipient");
        String status = request.getParameter("status");

        PrintWriter out = response.getWriter();

        String content = "";
        String subject = "";

        String recipient_id = null;
        String recipient_name = null;
        String type = null;

        if (status.equals("visitor_message")) {

            try {
                String name=request.getParameter("name");
                subject = request.getParameter("subject");
                content = "Name: "+name+"\n\n"+request.getParameter("content");
               
                EmailUtility.sendEmail(host, port, user, pass, recipient_email, subject, content);
                out.print("sent");
            } catch (Exception ex) {
                ex.printStackTrace();
                out.print("error");
            }

        }
        if (status.equals("customer_verification")) {

            try {
                ResultSet rs = DB.getCon().createStatement().executeQuery("Select* from customer where email='" + recipient_email + "'");
                if (rs.first()) {
                    recipient_id = rs.getString("customer_id");
                    recipient_name = rs.getString("first_name") + " " + rs.getString("last_name");
                    type = "customer";
                }

                content = "Dear " + recipient_name + ",\n\nYou can activate your newly created account by clicking following link.\n" + "http://localhost:8084/AsYouWish/customer_activation.jsp?id=" + recipient_id + "\n\nThe As You Wish Team\nCopyright 2016 CyberSoft. All rights reserved.";
                subject = "As You Wish customer account activation";

                EmailUtility.sendEmail(host, port, user, pass, recipient_email, subject, content);
                out.print("sent");
            } catch (Exception ex) {
                ex.printStackTrace();
                out.print("error");
            }

        } else if (status.equals("vendor_verification")) {

            try {
                ResultSet rs = DB.getCon().createStatement().executeQuery("Select* from vendor where email='" + recipient_email + "'");
                if (rs.first()) {
                    recipient_id = rs.getString("vendor_id");
                    recipient_name = rs.getString("first_name") + " " + rs.getString("last_name");
                }

                content = "Dear " + recipient_name + ",\n\nYou can activate your newly created account by clicking following link.\n" + "http://localhost:8084/AsYouWish/billing.jsp?id=" + recipient_id + "\n\nThe As You Wish Team\nCopyright 2016 CyberSoft. All rights reserved.";
                subject = "As You Wish vendor account activation";

                EmailUtility.sendEmail(host, port, user, pass, recipient_email, subject, content);
                out.print("sent");
            } catch (Exception ex) {
                ex.printStackTrace();
                out.print("error");
            }
        } else if (status.equals("visitor_verification")) {

            try {
                ResultSet rs = DB.getCon().createStatement().executeQuery("Select* from visitor where email='" + recipient_email + "'");
                if (rs.first()) {
                    recipient_id = rs.getString("visitor_id");
                    recipient_name = rs.getString("first_name") + " " + rs.getString("last_name");
                    type = "visitor";
                }

                content = "Dear " + recipient_name + ",\n\nYou can verify your email and will be directed to the contest page by clicking following link.\n" + "http://localhost:8084/AsYouWish/voting.jsp?id=" + recipient_id + "\n\nThe As You Wish Team\nCopyright 2016 CyberSoft. All rights reserved.";
                subject = "Sign In as a guest";

                EmailUtility.sendEmail(host, port, user, pass, recipient_email, subject, content);
                out.print("sent");
            } catch (Exception ex) {
                ex.printStackTrace();
                out.print("error");
            }

        } else if (status.equals("password_reset")) {

            if (recipient_id != null) {

                content = "Dear " + recipient_name + ",\n\nYou can reset your password by clicking following link.\n" + "http://localhost:8084/AsYouWish/password_reset.jsp?id=" + recipient_id + "&type=" + type + "\n\nThe As You Wish Team\nCopyright 2016 CyberSoft. All rights reserved.";
                subject = "Password Reset";

                out.print("registered");

                try {
                    EmailUtility.sendEmail(host, port, user, pass, recipient_email, subject, content);
                } catch (Exception ex) {
                    ex.printStackTrace();
                    out.print("error");
                }
            } else {
                out.print("unregistered");
            }

        } else if (status.equals("reset_confirmation")) {

            subject = "Your As You Wish account password has been changed";
            content = "Dear " + recipient_name + ",\n\nRecently your accout password has changed.\nIf you didn't request this password change please contact the customer support team.\n\nThe As You Wish Team\nCopyright 2016 CyberSoft. All rights reserved.";

            try {
                EmailUtility.sendEmail(host, port, user, pass, recipient_email, subject, content);
            } catch (Exception ex) {
                ex.printStackTrace();
                out.print("error");
            }
        } else if (status.equals("customer_message")) {

            subject = request.getParameter("subject");
            content = request.getParameter("message") + "\n\nThe As You Wish Team\nCopyright 2016 CyberSoft. All rights reserved.";

            try {
                EmailUtility.sendEmail(host, port, user, pass, recipient_email, subject, content);
            } catch (Exception ex) {
                ex.printStackTrace();
                out.print("error");
            }
        }
    }
}
