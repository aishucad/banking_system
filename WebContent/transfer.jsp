<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Transfer page</title>
<link rel="stylesheet" href="transfer.css">
</head>
<body>
<h1>Money Transfer</h1>
<form action="transMoney" method="post">
	<label>Sender Name:</label>
	<input type="text" name="sndname" required><br>
	<label>Sender AccountNo:</label>
	<input type="text" name="sndacno" required><br>
	<label>Receiver Name:</label>
	<input type="text" name="rcvname" required><br>
	<label>Receiver AccountNo:</label>
	<input type="text" name="rcvacno" required><br>
	<label>Amount To Be Transfered:</label>
	<input type="number" min="0" name="amnt" required><br>
	<button type="submit">Transfer</button>
	<button type="reset">Cancel</button>
</form>
</body>
</html>