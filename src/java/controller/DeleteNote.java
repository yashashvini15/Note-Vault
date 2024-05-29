package controller;

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
public class DeleteNote extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String postid= request.getParameter("Note_id");

        if(Notes.DeleteNote(postid))
        {
            System.out.println("Data deleted");
            response.sendRedirect("shownote.jsp");
        }else
        {
            System.out.println("Data not deleted");
            response.sendRedirect("delete.jsp");
        }
    }

     
}
