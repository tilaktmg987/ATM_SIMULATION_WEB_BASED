package mypackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class signuptwo
 */
@WebServlet("/signuptwo")
public class signuptwo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public signuptwo() {
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
	     
	     String formNumber = (String) request.getSession().getAttribute("formNumber");

	     
	     String Religion_checked = request.getParameter("Religion");
	     String Religion;
	     if("Hindu".equals(Religion_checked)){
	    	 Religion = "Hindu";
	     }else if("Muslim".equals(Religion_checked)){
	    	 Religion = "Muslim";
	     }else if("Christian".equals(Religion_checked)){
	    	 Religion = "Christian";
	     }else if("Buddhist".equals(Religion_checked)){
	    	 Religion = "Buddhist";
	     }else{
	    	 Religion = "Others";
	     }
	     
	     String Category_checked = request.getParameter("Category");
	     String Category;
	     if("General".equals(Category_checked)){
	    	 Category = "General";
	     }else if("OBC".equals(Category_checked)){
	    	 Category = "OBC";
	     }else if("ST".equals(Category_checked)){
	    	 Category = "ST";
	     }else if("SC".equals(Category_checked)){
	    	 Category = "SC";
	     }else{
	    	 Category = "Others";
	     }
	     
	     String Income_checked = request.getParameter("Income");
	     String Income;
	     if("Null".equals(Income_checked)){
	    	 Income = "Null";
	     }else if("1,50,000".equals(Income_checked)){
	    	 Income = "1,50,000";
	     }else if("2,50,000".equals(Income_checked)){
	    	 Income = "2,50,000";
	     }else if("5,00,000".equals(Income_checked)){
	    	 Income = "5,00,000";
	     }else{
	    	 Income = "10,00,000";
	     }
	     
	     String Educational_checked = request.getParameter("Educational");
	     String Educational;
	     if("Non_Graduation".equals(Educational_checked)){
	    	 Educational = "Non_Graduation";
	     }else if("Graduate".equals(Educational_checked)){
	    	 Educational = "Graduate";
	     }else if("Post_Graduation".equals(Educational_checked)){
	    	 Educational = "Post_Graduation";
	     }else if("Doctrate".equals(Educational_checked)){
	    	 Educational = "Doctrate";
	     }else{
	    	 Educational = "Others";
	     }
	     
	     String Occupation_checked = request.getParameter("Occupation");
	     String Occupation;
	     if("Salaried".equals(Occupation_checked)){
	    	 Occupation = "Salaried";
	     }else if("Self_Employed".equals(Occupation_checked)){
	    	 Occupation = "Self_Employed";
	     }else if("Business".equals(Occupation_checked)){
	    	 Occupation = "Business";
	     }else if("Student".equals(Occupation_checked)){
	    	 Occupation = "Student";
	     }else if("Retired".equals(Occupation_checked)){
	    	 Occupation = "Retired";
	     }else{
	    	 Occupation = "Others";
	     }
	     
	     String PAN = request.getParameter("PAN");
	     String Citizenship = request.getParameter("Citizenship");
	     
	     String National = request.getParameter("National");
	     String Existing_acc_checked = request.getParameter("Existing_acc");
	     String Existing_acc;
	     if("yes".equals(Existing_acc_checked)){
	    	 Existing_acc = "yes";
	     }else{
	    	 Existing_acc = "no";
	     }
	     
	     try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost/atm", "root", "");
				 String str = "INSERT INTO signuptwo VALUES (?,?,?,?,?,?,?,?,?,?)";
	                PreparedStatement pst = con.prepareStatement(str);
	                pst.setString(1, formNumber);
	                pst.setString(2, Religion);
	                pst.setString(3, Category);
	                pst.setString(4, Income);
	                pst.setString(5, Educational);
	                pst.setString(6, Occupation);
	                pst.setString(7, PAN);
	                pst.setString(8, Citizenship);
	                pst.setString(9, National);
	                pst.setString(10, Existing_acc);
	                pst.executeUpdate();
	                
			}catch(Exception e){
				request.setAttribute("message", "Database error: " + e.getMessage());
             request.setAttribute("messageType", "error");
             RequestDispatcher rd = request.getRequestDispatcher("signupthree.jsp");
             rd.forward(request, response);
             e.printStackTrace();
				
			}
			
			
			
			request.getSession().setAttribute("personalDetails", request.getParameterMap());
			
		
         RequestDispatcher rd = request.getRequestDispatcher("signupthree.jsp");
         rd.forward(request, response);
			
		} 
	}


