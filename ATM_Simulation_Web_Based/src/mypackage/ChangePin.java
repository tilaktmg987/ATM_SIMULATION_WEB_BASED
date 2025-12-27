package mypackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ChangePin")
public class ChangePin extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String newpin = request.getParameter("newpin").trim();
        String renewpin = request.getParameter("renewpin").trim();
        String action = request.getParameter("action");

       
        if ("back".equals(action)) {
            response.sendRedirect("dashboard.jsp");
            return;
        }

      
        String card_number = (String) request.getSession().getAttribute("CardNo");

     

        if (card_number == null) {
            request.setAttribute("status", "Session expired. Please login again.");
            request.getRequestDispatcher("pinchange.jsp").forward(request, response);
            return;
        }

       
        if (newpin == null || renewpin == null || newpin.trim().isEmpty() || renewpin.trim().isEmpty()) {
            request.setAttribute("status", "Please re-enter new PIN");
            request.getRequestDispatcher("pinchange.jsp").forward(request, response);
            return;
        }
        
        if(!newpin.matches("\\d+")){
            request.setAttribute("status", "PIN must contain only numbers");
            request.getRequestDispatcher("pinchange.jsp").forward(request, response);
            return;
        }

        if (!newpin.equals(renewpin)) {
            request.setAttribute("status", "Entered PIN does not match");
            request.getRequestDispatcher("pinchange.jsp").forward(request, response);
            return;
        }

        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/atm", "root", "");

            String sql1 = "UPDATE login SET Pin_Number=? WHERE Card_Number=?";
            String sql2 = "UPDATE signupthree SET Pin_Number=? WHERE Card_Number=?";

            PreparedStatement pst1 = con.prepareStatement(sql1);
            pst1.setString(1, renewpin);
            pst1.setString(2, card_number);

            PreparedStatement pst2 = con.prepareStatement(sql2);
            pst2.setString(1, renewpin);
            pst2.setString(2, card_number);

            pst1.executeUpdate();
            pst2.executeUpdate();

            request.setAttribute("status", "PIN changed successfully!");

        } catch (Exception e) {
            request.setAttribute("status", "Database Error: " + e.getMessage());
        }

        request.getRequestDispatcher("pinchange.jsp").forward(request, response);
    }
}
