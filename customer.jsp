<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String uid = request.getParameter("uid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "drugdatabase";
String userid = "root";
String password = "admin";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
<link rel="stylesheet" href="css/Orders.css">
</head>
<body>
<div class="main">
	<div class="topbar1"></div>
	<div class="topbar2">
		<div class="container1">
			<div class="logout-btn">
				<a href="Logout.jsp">Logout</a>
			</div>
		</div>
	</div>
	<div class="header">
		<div class="container2">
			<div class="navbar">
				<a href="SellerHomepage.jsp">Home</a>
				<a href="AddProduct.html">Add</a>
                <a href="AddInventory.jsp">Restock</a>
				<a href="OrderPlaced.jsp">Online Orders</a>
				<a href="CODPlaced.jsp">COD Orders</a>
				<a href="SeOrder.jsp">Products</a>
				<a href="SeOrder.jsp">Customers</a>
			</div>
		</div>
	</div>
	</div>
<br>
<br>
<br>
<br>
<table class="tables">
			<tr>
    			<th>Id</th>
    			<th>Name</th>
    			<th>Last Name</th>
    			<th>Email</th>
    			<th>Address</th>
    			<th>Phone Number</th>
  			</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select uid,fname,lname,email,address,pno from customer";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<tr>
                <td><%=resultSet.getString("uid") %></td>
    			<td><%=resultSet.getString("fname") %></td>
    			<td><%=resultSet.getString("lname") %></td>
    			<td><%=resultSet.getString("email") %></td>
    			<td><%=resultSet.getDate("address") %></td>
    			<td><%=resultSet.getDate("phno") %></td>
  	           <td>
  	           
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>