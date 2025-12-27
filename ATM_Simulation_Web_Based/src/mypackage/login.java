package mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.mysql.jdbc.Connection;

@WebServlet("/login")
public class login extends HttpServlet {
    private static final long serialVersionUID = 1L;
	private static final Object Card_Number = null;
       
    public login() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String action = request.getParameter("action");

        // SIGNUP
        if ("signup".equals(action)) {
        	
        	Random ran = new Random();
    		int random = ran.nextInt(9000) + 1000; 
    		String random_value = String.valueOf(random);

    		request.getSession().setAttribute("formNumber", random_value);

        	 request.setAttribute("message", "Redirecting to application form...");
             request.setAttribute("messageType", "success");
             request.setAttribute("redirect", "signupone.jsp"); 
             RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
             rd.forward(request, response);
        	
            
        }

        // CLEAR
        if ("clear".equals(action)) {
            response.sendRedirect("login.jsp");
            return;
        }

        // SIGNIN
        if ("signin".equals(action)) {
            String CardNo = request.getParameter("CardNo");
            String PIN = request.getParameter("PIN");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/atm", "root", "");

                String str = "SELECT Card_Number, Pin_Number FROM login WHERE Card_Number=? AND Pin_Number=?";
                PreparedStatement pst = con.prepareStatement(str);
                pst.setString(1, CardNo);
                pst.setString(2, PIN);

                ResultSet rs = pst.executeQuery();

                if (rs.next()) {
                	request.getSession().setAttribute("CardNo", CardNo);
                    
                    request.setAttribute("message", "Login verified. Redirecting to ATM services...");
                    request.setAttribute("messageType", "success");
                    request.setAttribute("redirect", "dashboard.jsp");
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                } else {
                   
                    request.setAttribute("message", "Invalid card number or PIN");
                    request.setAttribute("messageType", "error");
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                }

                
                rs.close();
                pst.close();
                con.close();

            } catch (Exception e) {
                request.setAttribute("message", "Database error: " + e.getMessage());
                request.setAttribute("messageType", "error");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
                e.printStackTrace();
            }
        }
    }	
}