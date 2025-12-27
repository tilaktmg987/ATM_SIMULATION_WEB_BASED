package mypackage;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

@WebServlet("/Withdraw")
public class Withdraw extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Withdraw() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");

        String CardNo = (String) request.getSession().getAttribute("CardNo");
        String action = request.getParameter("action");
        
        // Create current date
        java.util.Date date = new java.util.Date();

        if ("withdraw".equals(action)) {
            String amountStr = request.getParameter("amount");

            Connection con = null;
            PreparedStatement pst = null;
            PreparedStatement insertStmt = null;
            ResultSet rs = null;

            try {
                // Load MySQL JDBC Driver
                Class.forName("com.mysql.jdbc.Driver");
                
                con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/atm", "root", "");

                // Calculate current balance
                int balance = 0;
                String query = "SELECT type, amount FROM bank WHERE Card_Number = ?";
                pst = (PreparedStatement) con.prepareStatement(query);
                pst.setString(1, CardNo);
                rs = pst.executeQuery();

                while (rs.next()) {
                    String type = rs.getString("type");
                    int amount = rs.getInt("amount");

                    if ("deposit".equals(type)) {
                        balance += amount;
                    } else {
                        balance -= amount;
                    }
                }

                int withdrawAmount = Integer.parseInt(amountStr);

                // Check sufficient balance
                if (withdrawAmount > balance) {
                    request.setAttribute("Withdraw", "Insufficient Balance");
                    RequestDispatcher rd = request.getRequestDispatcher("Withdraw.jsp");
                    rd.forward(request, response);
                    return;
                }

                // Insert withdrawal transaction
                String insertQuery = "INSERT INTO bank (Card_Number, date, type, amount) VALUES (?,'"+date+"', 'withdrawal', ?)";
                insertStmt = (PreparedStatement) con.prepareStatement(insertQuery);
                
                insertStmt.setString(1, CardNo);
                insertStmt.setString(2, String.valueOf(withdrawAmount));
                

                int rowsAffected = insertStmt.executeUpdate();

                if (rowsAffected > 0) {
                    request.setAttribute("Withdraw", "" + withdrawAmount);
                } else {
                    request.setAttribute("Withdraw", "Withdrawal failed");
                }

                RequestDispatcher rd = request.getRequestDispatcher("Withdraw.jsp");
                rd.forward(request, response);

            } catch (Exception e) {
                e.printStackTrace();
                request.setAttribute("Withdraw", "Database Error: " + e.getMessage());
                RequestDispatcher rd = request.getRequestDispatcher("Withdraw.jsp");
                rd.forward(request, response);
            } finally {
                // Close resources
                try {
                    if (rs != null) rs.close();
                    if (pst != null) pst.close();
                    if (insertStmt != null) insertStmt.close();
                    if (con != null) con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }

        } else if ("back".equals(action)) {
            RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
            rd.forward(request, response);
        }
    }
}