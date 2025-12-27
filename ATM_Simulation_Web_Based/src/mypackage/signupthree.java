package mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/signupthree")
public class signupthree extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public signupthree() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String formNumber = (String) request.getSession().getAttribute("formNumber");

        String accountTypeChecked = request.getParameter("AccountType");
        String AccountType;

        if ("savingaccount".equals(accountTypeChecked)) {
            AccountType = "Saving Account";
        } else if ("currentaccount".equals(accountTypeChecked)) {
            AccountType = "Current Account";
        } else if ("fixeddepositaccount".equals(accountTypeChecked)) {
            AccountType = "Fixed Deposit Account";
        } else {
            AccountType = "Recurring Deposit Account";
        }

        String[] services = request.getParameterValues("ServiceRequired");
        String ServiceRequired = "";

        if (services != null) {
            for (int i = 0; i < services.length; i++) {
                ServiceRequired += services[i];
                if (i < services.length - 1) {
                    ServiceRequired += ", ";
                }
            }
        }

      
        String cardNumber = "";
        for (int i = 0; i < 16; i++) {
            cardNumber += (int) (Math.random() * 10);
        }

        int pin = (int) (Math.random() * 9000) + 1000;
        String pinNumber = String.valueOf(pin);

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/atm", "root", "");

          
            String q1 = "INSERT INTO signupthree VALUES (?,?,?,?,?)";
            PreparedStatement pst1 = con.prepareStatement(q1);
            pst1.setString(1, formNumber);
            pst1.setString(2, AccountType);
            pst1.setString(3, cardNumber);
            pst1.setString(4, pinNumber);
            pst1.setString(5, ServiceRequired);
            pst1.executeUpdate();

          
            String q2 = "INSERT INTO login VALUES (?,?,?)";
            PreparedStatement pst2 = con.prepareStatement(q2);
            pst2.setString(1, formNumber);
            pst2.setString(2, cardNumber);
            pst2.setString(3, pinNumber);
            pst2.executeUpdate();

          
            
            request.setAttribute("cardNumber", cardNumber);
            request.setAttribute("pinNumber", pinNumber);
            
            RequestDispatcher rd = request.getRequestDispatcher("success.jsp");
            rd.forward(request, response);

        } catch (Exception e) {

            request.setAttribute("message", "Database error: " + e.getMessage());
            request.setAttribute("messageType", "error");

            RequestDispatcher rd = request.getRequestDispatcher("signupthree.jsp");
            rd.forward(request, response);

            e.printStackTrace();
        }
    }
}
