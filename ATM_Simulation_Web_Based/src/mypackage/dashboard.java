package mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

@WebServlet("/dashboard")
public class dashboard extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public dashboard() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String action = request.getParameter("action");
        
        String CardNo = (String) request.getSession().getAttribute("CardNo");
        
        System.out.println("Dashboard - CardNo from session: " + CardNo); // Debug
        
        if("deposit".equals(action)){
            RequestDispatcher rd = request.getRequestDispatcher("Deposit.jsp");
            rd.forward(request, response);
        }else if("withdraw".equals(action)){
            RequestDispatcher rd = request.getRequestDispatcher("Withdraw.jsp");
            rd.forward(request, response);
        }else if("fastcash".equals(action)){
            RequestDispatcher rd = request.getRequestDispatcher("fastcash.jsp");
            rd.forward(request, response);
        }else if("miniStatement".equals(action)){
            RequestDispatcher rd = request.getRequestDispatcher("mini_statement");
            rd.forward(request, response);
        }else if("pinchange".equals(action)){
            RequestDispatcher rd = request.getRequestDispatcher("pinchange.jsp");
            rd.forward(request, response);
        }else if("balanceenquiry".equals(action)){
            RequestDispatcher rd = request.getRequestDispatcher("BalanceEnquiry");
            rd.forward(request, response);
            
        }else if("exit".equals(action)){
            request.setAttribute("message", "Loging Out. Redirecting to Login Page...");
            request.setAttribute("messageType", "success");
            request.setAttribute("redirect", "login.jsp");
            RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
            rd.forward(request, response);
        }
    }
}