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

     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getParameter("status").equals("backup")) {

            String status = DBBackup.mysqlDatabaseBackUp();
            if (status.equals("y")) {
              
            } else if (status.equals("n")) {

              
            }

        } else if (request.getParameter("status").equals("restore")) {

            String fileName = request.getParameter("file");
            System.out.println(fileName);

            boolean status = DBBackup.mysqlDatabaseRestore("kasun", "root", "1234", "C:\\Backups\\" + fileName);
            if (status == true) {
                System.out.println("restore success"); 
               
            } else {
                System.out.println("restore failure");
              
            }

        }
    }
}
