package mypackage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/successRedirect")
public class success extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        request.setAttribute("message", "Account created successfully! You can now login with your new credentials.");
       request.setAttribute("messageType", "success");        
       
      RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
       rd.forward(request, response);
        
        
        
    }
}