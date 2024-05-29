package controller;

import dto.UserDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Notes;

/**
 *
 * @author Yashashvini
 */
public class AddNotes extends HttpServlet 
{

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("landing.jsp");
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userid=request.getParameter("userid");
        String title=request.getParameter("title");
        String content=request.getParameter("content");
        
        System.out.println(userid);
        System.out.println(title);
        System.out.println(content);
        
        UserDTO user = new UserDTO();
        user.setUserId(userid);
        user.setTitle(title);
        user.setContent(content);
        
        Notes n = new Notes();
        
        if(n.addNote(user))
        {
            System.out.println("Data inserted ");
            response.sendRedirect("shownote.jsp");
        }else{
            System.out.println("Data not inserted");
            response.sendRedirect("addnote.jsp");
        }
    }
    
    
    
}
