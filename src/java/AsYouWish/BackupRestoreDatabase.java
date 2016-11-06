package AsYouWish;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class BackupRestoreDatabase extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("backup") != null) {

            String status = DBBackup.mysqlDatabaseBackUp();
            if (status.equals("y")) {
                response.sendRedirect("backupsuccess.jsp");
            } else if (status.equals("n")) {

                response.sendRedirect("backupfailure.jsp");
            }

        } else if (request.getParameter("restore") != null) {

            String fileName = request.getParameter("file");
            

            boolean status = DBBackup.mysqlDatabaseRestore("kasun", "root", "1234", "C:\\Backups\\" + fileName);
            if (status == true) {
                System.out.println("restore success"); 
                response.sendRedirect("restoresuccess.jsp");
            } else {
                System.out.println("restore failure");
                response.sendRedirect("restorefailure.jsp");
            }

        }
    }
}
