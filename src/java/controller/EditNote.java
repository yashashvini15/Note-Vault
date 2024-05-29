package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Notes;

/**
 *
 * @author Yashashvini
 */
public class EditNote extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("landing.jsp");
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String postid = request.getParameter("postid");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        
        
        if(Notes.NoteUpdate(postid, title, content))
        {
            System.out.println("Data updated");
            response.sendRedirect("shownote.jsp");
        }else{
            System.out.println("Data not updated");
            response.sendRedirect("edit.jsp");
        }
    }
    
    
}
