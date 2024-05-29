package model;

/**
 *
 * @author Yashashvini
 */
import connector.DbConnector;
import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.AddressException;

public class Authenticator 
{
    
    Connection con = DbConnector.getConnection();
    
    public static boolean tPass(UserDTO user)
    {
        try {
                String username = user.getUsername();
                String password = user.getPassword();
                String query = "SELECT password FROM user WHERE username = '"+username+"'";
                
                Connection con = DbConnector.getConnection();
                
                PreparedStatement pst = con.prepareStatement(query);
                
//                pst.setString(1, username);
                ResultSet rs = pst.executeQuery();
                 if (rs.next()) {
                   String tablePassword = rs.getString(1);
                    return password.equals(tablePassword);
                 }
        
            } catch (SQLException e) {
                    System.out.println("tpass authenticator method "+e);
                }
             return false;
    }
    
    
       public static String getuserId(UserDTO user)
    {
        try {
                String username = user.getUsername();
                
                String query = "SELECT id FROM user WHERE username = '"+username+"'";
                
                Connection con = DbConnector.getConnection();
                
                PreparedStatement pst = con.prepareStatement(query);
                
//                pst.setString(1, username);
                ResultSet rs = pst.executeQuery();
                 if (rs.next()) {
                    String userId = rs.getString(1);
                    return userId;
                 }
        
            } catch (SQLException e) {
                    System.out.println("userId authenticator method "+e);
                }
             return null;
    } 
    
       
           
       public static String getemail(UserDTO user)
    {
        try {
                String username = user.getUsername();
                
                String query = "SELECT email FROM user WHERE username = '"+username+"'";
                
                Connection con = DbConnector.getConnection();
                
                PreparedStatement pst = con.prepareStatement(query);
                
//                pst.setString(1, username);
                ResultSet rs = pst.executeQuery();
                 if (rs.next()) {
                    String useremail = rs.getString(1);
                    return useremail;
                 }
        
            } catch (SQLException e) {
                    System.out.println("useremail authenticator method "+e);
                }
             return null;
    } 
    
    
   public boolean addUser(UserDTO user)
   {
       String username = user.getUsername();
       String password = user.getPassword();
       String confirmpassword = user .getConfirmpassword();
       String email = user.getEmail();
       
       try {
           String query = "INSERT INTO user Values(?,?,?,?,?)";
           
           PreparedStatement pst =con.prepareStatement(query);
           
           pst.setString(1, null);
           pst.setString(2, username);
           pst.setString(3, password);
           pst.setString(4, confirmpassword);
           pst.setString(5, email);
           
           int i = pst.executeUpdate();
           
           if(i==1)
           {
               return true;
           }
           
       } catch (SQLException e) {
           System.out.println("authenticator add method "+e);
       }
       return false;
   }
    
    public boolean validates(UserDTO user)
    {
        String username =user.getUsername();
        String password =user.getPassword();
        
        Authenticator au = new Authenticator();
        
        if (username!= null && password!= null && !username.isEmpty() && au.tPass(user))
        {
            return true;
        }
        return false;
    }
    public boolean evalidate(String email)
    {
        try {
                InternetAddress emailAddr = new InternetAddress(email);
                emailAddr.validate();
                return true;
            } catch (AddressException ex) {
            return false;
    }
    
  
    }
    public static boolean isLogin(UserDTO user)
    {
//        String username =user.getUsername();
//        String password =user.getPassword();
        
        Authenticator a = new Authenticator();
        if (a.validates(user)) {
            
            return true;
        }
        return false;
    }
    
    public static boolean isRegister(UserDTO user)
    {  
        String username = user.getUsername();
        String password = user.getPassword();
        String confirmpassword = user .getConfirmpassword();
        String email = user.getEmail();
       
        Authenticator a= new Authenticator();
        if (!password.equals(confirmpassword)) {
            System.out.println("Password and confirm password do not match.");
        return false;
        }

        if (!a.validates(user)) {
            System.out.println("User validation failed.");
        return false;
        }

        if (!a.evalidate(email)) {
            System.out.println("Email validation failed.");
        return false;
        }

        return true;
    }
}
