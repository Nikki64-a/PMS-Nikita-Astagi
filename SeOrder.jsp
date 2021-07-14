<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String pid = request.getParameter("pid");
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
    			
    			<th>Product ID</th>
    			<th>Product Name</th>
    			<th>Manufacturer Name</th>
    			<th>Manufacture Date</th>
    			<th>Expiry Date</th>
    			<th>Price</th>
    			<th>Action</th>
  			</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from product";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<tr>
    			<td><%=resultSet.getString("pid") %></td>
    			<td><%=resultSet.getString("pname") %></td>
    			<td><%=resultSet.getString("manufacturer") %></td>
    			<td><%=resultSet.getDate("mfg") %></td>
    			<td><%=resultSet.getDate("exp") %></td>
    			<td><%=resultSet.getInt("price") %></td>
  	           <td>
  	             <a href="Delete.jsp?pid=<%=resultSet.getString("pid")%>">delete</a></td>
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