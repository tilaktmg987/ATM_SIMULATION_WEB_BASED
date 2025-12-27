package mypackage;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

@WebServlet("/mini_statement")
public class mini_statement extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String card_number = (String) session.getAttribute("CardNo");
        
        System.out.println("MiniStatement - CardNo from session: " + card_number);
        
        // If not in session, check request parameter
        if (card_number == null) {
            card_number = request.getParameter("cardNo");
            System.out.println("MiniStatement - CardNo from parameter: " + card_number);
        }
        
        // If still null, check request attribute (from dashboard forward)
        if (card_number == null) {
            card_number = (String) request.getAttribute("PassedCardNo");
            System.out.println("MiniStatement - CardNo from attribute: " + card_number);
        }
        
        // If we got card number from anywhere, set it in session
        if (card_number != null) {
            session.setAttribute("CardNo", card_number);
        }
        
        // Check if card number exists
        if (card_number == null || card_number.length() < 16) {
            System.out.println("ERROR: No valid card number found!");
            request.setAttribute("error", "No valid card number found. Please login again.");
            request.getRequestDispatcher("mini_statement.jsp").forward(request, response);
            return;
        }
        
        String cardDisplay = card_number.substring(0, 4) + "XXXXXXXX" + card_number.substring(12);
        request.setAttribute("cardDisplay", cardDisplay);

        Connection con = null;
        PreparedStatement pst = null;
        PreparedStatement pst1 = null;
        ResultSet rs = null;
        ResultSet rs1 = null;
        
        int balance = 0;
        List<String[]> transactions = new ArrayList<String[]>();

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/atm", "root", "");
            System.out.println("Database connected successfully for card: " + card_number);

            // Fetch transaction history
            String sql = "SELECT date, type, amount FROM bank WHERE Card_Number = ? ORDER BY date DESC LIMIT 10";
            pst = (PreparedStatement) con.prepareStatement(sql);
            pst.setString(1, card_number);
            rs = pst.executeQuery();

            while (rs.next()) {
                String[] row = new String[3];
                row[0] = rs.getString("date");
                row[1] = rs.getString("type");
                row[2] = "Rs " + rs.getString("amount");
                transactions.add(row);
            }

            // Calculate balance
            String sql2 = "SELECT type, amount FROM bank WHERE Card_Number = ?";
            pst1 = (PreparedStatement) con.prepareStatement(sql2);
            pst1.setString(1, card_number);
            rs1 = pst1.executeQuery();

            while (rs1.next()) {
                String type = rs1.getString("type");
                int amount = rs1.getInt("amount");
                
                if ("deposit".equalsIgnoreCase(type)) {
                    balance += amount;
                } else {
                    balance -= amount;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to fetch transaction details");
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (rs1 != null) rs1.close();
                if (pst != null) pst.close();
                if (pst1 != null) pst1.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        request.setAttribute("transactions", transactions);
        request.setAttribute("balance", String.format("%,d", balance));
        request.getRequestDispatcher("mini_statement.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        doGet(request, response);
    }
}