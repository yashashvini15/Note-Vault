package controller;

import connector.DbConnector;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Yashashvini
 */
public class Logout extends HttpServlet 
{

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("landing.jsp");
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        session.invalidate();
        try {
            Connection con = DbConnector.getConnection();
            con.close();
            System.out.println("connection close..");
        } catch (SQLException e) {
            System.out.println("Logout"+e);
        }
        System.out.println("Logout successfully");
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");;
        rd.forward(request, response);
        
    }
}

    
