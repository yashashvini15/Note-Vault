package model;

import connector.DbConnector;
import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Yashashvini
 */
public class Notes {
    public static boolean addNote(UserDTO user)
    {
        String uid = user.getUserId();
        String title = user.getTitle();
        String content = user.getContent();
        
        try {
            Connection con = DbConnector.getConnection();
            
            String query = "INSERT INTO post (title , content , id) VALUES(?,?,?) ";
            
            PreparedStatement pst = con.prepareStatement(query);
         
            pst.setString(1, title);
            pst.setString(2, content);
            pst.setString(3, uid);
            
            int i = pst.executeUpdate();
            
            if(i==1)
            {
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Notes addnotes method "+e);
        }
        return false;
    }
    
    
    
    public List<UserDTO> getData(String id){
//        System.out.println("Get data "+id);
        List<UserDTO> ulist = new ArrayList<UserDTO>();
        UserDTO user = null;
        try {
            
            String query = "SELECT * FROM POST WHERE id = ?";
            Connection con = DbConnector.getConnection();
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, id);
            ResultSet rs= pst.executeQuery();
            while (rs.next()) {  
                user = new UserDTO();
                user.setPostId(rs.getString(1));
                user.setTitle(rs.getString(2));
                user.setContent(rs.getString(3));
                user.setPostdate(rs.getDate(4));
                ulist.add(user);
//                System.out.println(ulist);
//                System.out.println(ulist.size());
//                System.out.println("getdata chal raha hai");
            }
            
        } catch (Exception e) {
            System.err.println("notes getData method error");
                    e.printStackTrace();
        }
        
        return ulist;
    }
    
    public UserDTO getDataById(String id){
//        System.out.println("Get data by id "+id);
        
        UserDTO userdata = new UserDTO();
        try {
            Connection con = DbConnector.getConnection();
            
            String query = "SELECT * FROM POST WHERE pid= ?";
            
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, id);
            
            ResultSet rs = pst.executeQuery();
            
//            System.out.println(rs.next());
            
            if(rs.next()){
                userdata.setPostId(rs.getString(1));
                userdata.setTitle(rs.getString(2));
                userdata.setContent(rs.getString(3));
            }
            
        } catch (SQLException | NullPointerException e) {
            System.out.println("getdatabyid method "+e);
            e.printStackTrace();
        }
        
        return userdata;
    }
    
    
    public static boolean NoteUpdate(String id , String title , String content)
    {
        
        try {
        Connection con = DbConnector.getConnection();
       
        String query = " UPDATE post SET title = ? ,content = ? WHERE pid=? ";
        
        PreparedStatement pst = con.prepareStatement(query);
        
        pst.setString(1, title);
        pst.setString(2, content);
        pst.setString(3, id);
        
        int i = pst.executeUpdate();
        
        if(i==1){
            return true;
        }
        
        } catch (SQLException |NullPointerException e) {
            System.out.println("Update method "+e);
            e.printStackTrace();
        }
        return false;
    }
    
    
    public static boolean DeleteNote(String id)
    {
        try {
            Connection con = DbConnector.getConnection();
            
            String query = "DELETE FROM post WHERE pid=?  ";
            
            PreparedStatement pst = con.prepareStatement(query);
            
            pst.setString(1, id);
            
            int i = pst.executeUpdate();
            
            if(i==1){
                return true;
            }
        } catch (SQLException |NullPointerException e) {
            System.out.println("Delete Method "+e);
            e.printStackTrace();
        }
        return false;
    }
    
}
