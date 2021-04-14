<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@page import="java.sql.DriverManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer page</title>
<link rel="stylesheet" href="viewall.css">
</head>
<body>
	<nav id="navigation">
        <img id="logo" src="img/logo.jpg" alt="logo">
        <li><a href="index.jsp">Home</a></li>
        <li><a href="transfer.jsp">TransferMoney</a></li>
    </nav>
    <p>Customer Details</p>
    <center>
	<table>
		<tr>
		<th>Account No</th>
		<th>Name</th>
		<th>Email Id</th>
		<th>Account Balance</th>
		<th>Branch Name</th>
		<th>DOB</th>
		<th>Address</th>
		<th>View</th>
		</tr>
		<% 
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost/bankingsystem","root","root");
		Statement st= con.createStatement();
		ResultSet rs=st.executeQuery("select * from custdet" );
		while(rs.next())
		{
		%>
		<tr>
			<td><%=rs.getString(1) %></td>
			<td><%=rs.getString(2) %></td>
			<td><%=rs.getString(3) %></td>
			<td><%=rs.getString(4) %></td>
			<td><%=rs.getString(5) %></td>
			<td><%=rs.getString(6) %></td>
			<td><%=rs.getString(7) %></td>
			<td><a href="selctCust.jsp?actNo=<%=rs.getString(1)%>"><button type="submit">View</button></a><td>
		</tr>
		<%
		}
		%>
	</table>
	</center>
</body>
</html>