package mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.DriverManager;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class Deposit
 */
@WebServlet("/Deposit")
public class Deposit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Deposit() {
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
		PrintWriter out = response.getWriter();

		String CardNo = (String) request.getSession().getAttribute("CardNo");
		
		String action = request.getParameter("action");
		java.util.Date date = new java.util.Date();
		


		
		if ("deposit".equals(action)) {

		    String amountStr = request.getParameter("amount");
		    try {
		        Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/atm", "root","");
		        String str = "INSERT INTO bank VALUES (?,'"+date+"','deposit',?)";
		       
		        PreparedStatement pst = (PreparedStatement) con.prepareStatement(str);
		        pst.setString(1, CardNo);
		        pst.setString(2, amountStr);
		        pst.executeUpdate();

		      
		        request.setAttribute("deposited", amountStr);

		        RequestDispatcher rd = request.getRequestDispatcher("Deposit.jsp");
		        rd.forward(request, response);

		    } catch(Exception e) {
		        e.printStackTrace();
		    }
		}else if("back".equals(action)){
			RequestDispatcher rd = request.getRequestDispatcher("dashboard.jsp");
            rd.forward(request, response);
		}
	}

}
