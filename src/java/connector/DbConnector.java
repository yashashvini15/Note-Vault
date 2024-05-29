package connector;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Yashashvini
 */
public class DbConnector
{
    
     static Connection con = null;
     static Statement st = null;
     
       static {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver Loaded..");
            
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/notevault","root","root");
            System.out.println("connected...");
            
            st = con.createStatement();
            
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println(e);
        }
    }
       
     public static Connection getConnection ()
     {
         return con;
     }
     
     public static Statement getStatement()
     {
         return st;
     }
}    
//     public static PreparedStatement getPreparedStatement(Connection con, String sql) throws SQLException {
//        return con.prepareStatement(sql);
//    }
//}
