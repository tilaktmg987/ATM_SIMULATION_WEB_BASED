package mypackage;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

@WebServlet("/BalanceEnquiry")
public class BalanceEnquiry extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
       String card_number = (String) session.getAttribute("CardNo");
    	

        

        Connection con = null;
        PreparedStatement pst = null;
        ResultSet rs = null;

        int balance = 0;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/atm", "root", "");
            System.out.println("Database connected successfully for card: " + card_number);

           
            String sql = "SELECT type, amount FROM bank WHERE Card_Number = ?";
            pst = (PreparedStatement) con.prepareStatement(sql);
            pst.setString(1, card_number);
            rs = pst.executeQuery();

            while (rs.next()) {
                String type = rs.getString("type");
                int amount = rs.getInt("amount");

                if ("deposit".equalsIgnoreCase(type)) {
                    balance += amount;
                } else {
                    balance -= amount;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to fetch balance details");
        } finally {
            try {
                if (rs != null) rs.close();
                if (pst != null) pst.close();
                if (con != null) con.close();
            } catch (Exception e) { e.printStackTrace(); }
        }

        request.setAttribute("balance", String.format("%,d", balance));

        request.getRequestDispatcher("BalanceEnquiry.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
