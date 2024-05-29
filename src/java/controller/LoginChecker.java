package controller;

import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Authenticator;
import model.Notes;

/**
 *
 * @author Yashashvini
 */
@WebServlet(name = "LoginChecker", urlPatterns = {"/LoginChecker"})
public class LoginChecker extends HttpServlet 
{

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("landing.jsp");
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("Username");
        String password = request.getParameter("Password");
        
        System.out.println(username);
        System.out.println(password);
        
        UserDTO user = new UserDTO();
        user.setUsername(username);
        user.setPassword(password);
        user.setUserId(Authenticator.getuserId(user));
        
        Authenticator au = new Authenticator();
        if(au.isLogin(user))
        {
            HttpSession session = request.getSession(true);
            session.setAttribute("userdto", user);
            session.setAttribute("userId", Authenticator.getuserId(user));
            session.setAttribute("username", username);
            session.setAttribute("password", password);
            session.setAttribute("email", Authenticator.getemail(user));
            System.out.println("Login succesful");
            response.sendRedirect("home.jsp");
        }
        else
        {
            System.out.println("Login failed");
            response.sendRedirect("login.jsp");
        }
    }
}
