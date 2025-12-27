package mypackage;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class fastcash
 */
@WebServlet("/fastcash")
public class fastcash extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fastcash() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 response.setContentType("text/html");

	        String CardNo = (String) request.getSession().getAttribute("CardNo");
	        String amountStr = request.getParameter("amount"); // comes from button click
	        
	        String action = request.getParameter("action");
	        java.util.Date date = new java.util.Date();
	        
	        if("back".equals(action)){
	        	  request.getRequestDispatcher("dashboard.jsp").forward(request, response);
	        }

	        try {
	            Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/atm", "root", "");

	            int balance = 0;
	            String query = "SELECT type, amount FROM bank WHERE Card_Number = ?";
	            PreparedStatement pst = (PreparedStatement) con.prepareStatement(query);
	            pst.setString(1, CardNo);
	            ResultSet rs = pst.executeQuery();

	            while (rs.next()) {
	                String type = rs.getString("type");
	                int amt = Integer.parseInt(rs.getString("amount"));

	                if (type.equals("deposit"))
	                    balance += amt;
	                else
	                    balance -= amt;
	            }

	            int withdrawAmount = Integer.parseInt(amountStr);

	            if (withdrawAmount > balance) {
	                request.setAttribute("Withdraw", "Insufficient Balance");
	                request.getRequestDispatcher("fastcash.jsp").forward(request, response);
	                return;
	            }

	           
	            Connection con1 = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/atm", "root", "");

	            String insertQuery = "INSERT INTO bank (Card_Number, date, type, amount) VALUES (?, '"+date+"', 'withdrawl', ?)";
	            PreparedStatement insertStmt = (PreparedStatement) con1.prepareStatement(insertQuery);

	            insertStmt.setString(1, CardNo);
	            insertStmt.setString(2, String.valueOf(withdrawAmount));

	            insertStmt.executeUpdate();

	            request.setAttribute("Withdraw", amountStr);
	            request.getRequestDispatcher("fastcash.jsp").forward(request, response);

	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}

}
