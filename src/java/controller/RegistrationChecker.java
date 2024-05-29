package controller;

import dto.UserDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Authenticator;

/**
 *
 * @author Yashashvini
 */
public class RegistrationChecker extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
            response.sendRedirect("landing.jsp");
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String username = request.getParameter("Username");
        String email = request.getParameter("Email");
        String password = request.getParameter("Password");
        String confirmpassword = request.getParameter("ConfirmPassword");
        
        System.out.println(username);
        System.out.println(password);
        System.out.println(confirmpassword);
        System.out.println(email);
        
        UserDTO user = new UserDTO();
        user.setUserId(Authenticator.getuserId(user));
        user.setUsername(username);
        user.setPassword(password);
        user.setConfirmpassword(confirmpassword);
        user.setEmail(email);
        
        
        Authenticator au = new Authenticator();
        if(au.addUser(user))
        {
            System.out.println("Registered succesfully");
            response.sendRedirect("login.jsp");
        }else{
            response.sendRedirect("register.jsp");
        }
        
    }

    
}
