package AsYouWish;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;

public class DB {

    public static Connection getCon() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/as_you_wish", "root", "1234");
            return (Connection) con;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }
}
