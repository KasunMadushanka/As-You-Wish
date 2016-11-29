package AsYouWish;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DBBackup {
    
    public static boolean mysqlDatabaseRestore(String dbName, String dbUserName, String dbPassword, String source) {
        boolean status = false;
        String[] executeCmd = new String[]{"C:\\Program Files\\MySQL\\MySQL Server 5.7\\bin\\mysql", "--user=" + dbUserName, "--password=" + dbPassword, dbName, "-e", " source " + source};
        Process runtimeProcess;
        try {
            runtimeProcess = Runtime.getRuntime().exec(executeCmd);
            int processComplete = runtimeProcess.waitFor();
            if (processComplete == 0) {
                System.out.println("Backup restored successfully");
                status = true;
                return status;
            } else {
                System.out.println("Could not restore the backup");
                status = false;
                return status;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        System.out.println(status);
        return status;
        
    }
    
    public static String mysqlDatabaseBackUp() {
        String status = "";
        File file = null;
        
        try {
            ResultSet rs = DB.getCon().createStatement().executeQuery("Select backup_path from backup_settings");
            if (rs.first()) {
                file = new File(rs.getString("backup_path"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
      
        if (!file.exists()) {
            if (file.mkdir()) {
                System.out.println("Directory is created!");
                
                String backUpPath = "E:\\Backups";
                String host = "localhost";
                String mysqlPort = "3306";
                String dbUser = "root";
                String dbPassword = "1234";
                String database = "db";
                DBBackup dbBackup = new DBBackup();
                try {
                    DateFormat dayFormat = new SimpleDateFormat("dd");
                    DateFormat monthFormat = new SimpleDateFormat("MM");
                    DateFormat yearFormat = new SimpleDateFormat("yyyy");
                    DateFormat timeFormat = new SimpleDateFormat("hh:mm a");
                    Calendar cal = Calendar.getInstance();
                    String backupDate = dayFormat.format(cal.getTime()) + "-" + monthFormat.format(cal.getTime()) + "-" + yearFormat.format(cal.getTime() + "-" + timeFormat.format(cal.getTime()));
                    byte[] data = dbBackup.getData(host, mysqlPort, dbUser, dbPassword, database).getBytes();
                    
                    File fileDestination = new File(backUpPath + "\\" + database + "_" + backupDate + ".sql");
                    FileOutputStream destination = new FileOutputStream(fileDestination);
                    destination.write(data);
                    
                    destination.close();
                    status = "y";
                    System.out.println("Back Up Success");
                    return status;
                } catch (Exception ex) {
                    System.out.println("Back Up Failed");
                    status = "n";
                    return status;
                    
                }
                
            } else {
                System.out.println("Failed to create directory!");
            }
        } else {
            String backUpPath = "E:\\Backups";
            String host = "localhost";
            String mysqlPort = "3306";
            String dbUser = "root";
            String dbPassword = "1234";
            String database = "db";
            DBBackup dbBackup = new DBBackup();
            try {
                DateFormat dayFormat = new SimpleDateFormat("dd");
                DateFormat monthFormat = new SimpleDateFormat("MM");
                DateFormat yearFormat = new SimpleDateFormat("yyyy");
                DateFormat hourFormat = new SimpleDateFormat("HH");
                DateFormat minuteFormat = new SimpleDateFormat("mm");
                Date date = new Date();
                String backupDate = dayFormat.format(date) + "-" + monthFormat.format(date) + "-" + yearFormat.format(date) + " " + hourFormat.format(date) + "." + minuteFormat.format(date);
                byte[] data = dbBackup.getData(host, mysqlPort, dbUser, dbPassword, database).getBytes();
                
                File fileDestination = new File(backUpPath + "\\" + database + "_" + backupDate + ".sql");
                FileOutputStream destination = new FileOutputStream(fileDestination);
                destination.write(data);
                
                destination.close();
                
                System.out.println("Back Up Success");
                status = "y";
                return status;
            } catch (Exception ex) {
                System.out.println("Back Up Failed");
                status = "n";
                return status;
                
            }
            
        }
        
        return status;
    }
    
    private static ResultSet rs;
    private static Connection con;
    private Statement st;
    private int BUFFER = 99999;
    
    public String getData(String host, String port, String user, String password, String db) {
        String Mysqlpath = getMysqlBinPath(user, password, db);
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.print("cant access mysql driver");
        }
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + db, user, password);
            st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
        } catch (Exception e) {
            System.out.print("connection error");
            e.printStackTrace();
        }
        System.out.println(Mysqlpath);
        Process run = null;
        try {
            System.out.println(Mysqlpath + "mysqldump --host=" + host + " --port=" + port + " --user=" + user + " --password=" + password + " --compact --complete-insert --extended-insert " + "--skip-comments --skip-triggers " + db);
            run = Runtime.getRuntime().exec(Mysqlpath + "mysqldump --host=" + host + " --port=" + port + " --user=" + user + " --password=" + password + "  " + "--skip-comments --skip-triggers " + db);
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        
        InputStream in = run.getInputStream();
        BufferedReader br = new BufferedReader(new InputStreamReader(in));
        StringBuffer temp = new StringBuffer();
        
        int count;
        char[] cbuf = new char[BUFFER];
        try {
            while ((count = br.read(cbuf, 0, BUFFER)) != -1) {
                temp.append(cbuf, 0, count);
            }
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        try {
            br.close();
            in.close();
        } catch (IOException ex) {
            ex.printStackTrace();
        }
        return temp.toString();
    }

// Mysql path is required to locate the bin folder inside it because it contains the Mysqldump which performs a //main role while taking backup.
/*Function to find MySql Path*/
    public String getMysqlBinPath(String dbUser, String dbPassword, String databaseName) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.print("driver loading failed");
        }
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/" + databaseName, dbUser, dbPassword);
            st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
        } catch (Exception e) {
            System.out.print("connection error");
            e.printStackTrace();
        }
        
        String a = "";
        
        try {
            rs = st.executeQuery("select @@basedir");
            while (rs.next()) {
                a = rs.getString(1);
            }
        } catch (Exception eee) {
            eee.printStackTrace();
        }
        a = a + "bin\\";
        System.err.println("Mysql path is :" + a);
        return a;
    }
}
