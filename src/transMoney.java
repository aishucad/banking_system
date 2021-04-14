

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class transMoney
 */
@WebServlet("/transMoney")
public class transMoney extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sndacno=request.getParameter("sndacno");
		String sndname=request.getParameter("sndname");
		String rcvname=request.getParameter("rcvname");
		String rcvacno=request.getParameter("rcvacno");
		String amnt=request.getParameter("amnt");
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankingsystem","root","root");
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select AccountBalance from custdet where AccountNo='"+sndacno+"'");
			rs.next();
			int amt = rs.getInt(1);
			if(Integer.parseInt(amnt) < amt)
			{
				Statement st1=con.createStatement();
				ResultSet rs1= st1.executeQuery("select AccountBalance from custdet where AccountNo='"+rcvacno+"'");
				rs1.next();
				int recAmt = rs1.getInt(1);
				int totamt = recAmt + Integer.parseInt(amnt);
				
				Statement st2=con.createStatement();
				st2.executeUpdate("update custdet set AccountBalance='"+totamt+"' where AccountNo='"+rcvacno+"'");
				
				int minamt = amt - Integer.parseInt(amnt);
				Statement st3=con.createStatement();
				st3.executeUpdate("update custdet set AccountBalance='"+minamt+"' where AccountNo='"+sndacno+"'");
				
				response.sendRedirect("transucc.jsp");
			}
			else
			{
				response.sendRedirect("tranfail.jsp");
			}
		}
		catch(Exception ex){
			System.out.println(ex);
		}
	}
}
