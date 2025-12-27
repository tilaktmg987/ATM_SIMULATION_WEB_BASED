package mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class signupone
 */
@WebServlet("/signupone")
public class signupone extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signupone() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Redirect to doPost
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String action = request.getParameter("action");
		
		
		String formNumber = (String) request.getSession().getAttribute("formNumber");
		
		

		
		String name = request.getParameter("name");
		String fname = request.getParameter("fname");
		String dob = request.getParameter("dob");
		
		String gender_checked = request.getParameter("gender");
		String gender;
		
		if("male".equals(gender_checked)){
			gender="male";
		}else if("female".equals(gender_checked)){
			gender="female";
		}else{
			gender="Other";
		}
		String email = request.getParameter("email");
		String marital_checked = request.getParameter("maritalStatus");
		String Status;
		
		if("married".equals(marital_checked)){
			Status="married";
		}else if("unmarried".equals(marital_checked)){
			Status="unmarried";
		}else{
			Status="Other";
		}

		String address = request.getParameter("address");
		String city = request.getParameter("city");
		String state = request.getParameter("state");
		String pinCode = request.getParameter("pinCode");
		
		

		
		if ("back".equals(action)) {
			
			RequestDispatcher rd1 = request.getRequestDispatcher("login.jsp");
			rd1.forward(request, response);
		} else if ("next".equals(action)) {
			
			
			try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/atm", "root", "");
				 String str = "INSERT INTO signup VALUES (?,?,?,?,?,?,?,?,?,?,?)";
	                PreparedStatement pst = con.prepareStatement(str);
	                pst.setString(1, formNumber);
	                pst.setString(2, name);
	                pst.setString(3, fname);
	                pst.setString(4, dob);
	                pst.setString(5, gender);
	                pst.setString(6, email);
	                pst.setString(7, Status);
	                pst.setString(8, address);
	                pst.setString(9, city);
	                pst.setString(10, state);
	                pst.setString(11, pinCode);
	                pst.executeUpdate();
	                
			}catch(Exception e){
				request.setAttribute("message", "Database error: " + e.getMessage());
                request.setAttribute("messageType", "error");
                RequestDispatcher rd = request.getRequestDispatcher("signupone.jsp");
                rd.forward(request, response);
                e.printStackTrace();
				
			}
			
			
			
			request.getSession().setAttribute("personalDetails", request.getParameterMap());
			
			
            RequestDispatcher rd = request.getRequestDispatcher("signuptwo.jsp");
            rd.forward(request, response);
			
		} else {
			
			response.sendRedirect("signup.jsp");
		}
	}
}