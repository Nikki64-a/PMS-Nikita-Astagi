<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String pname = request.getParameter("pname");
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
<th>Name</th>
<th>Product Name</th>
<th>Quantity</th>
<th>H.No</th>
<th>District</th>
<th>State</th>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select fname,pname,pquantity,hno,didt,state from cod";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("fname") %></td>
<td><%=resultSet.getString("pname") %></td>
<td><%=resultSet.getString("pquantity") %></td>
<td><%=resultSet.getString("hno") %></td>
<td><%=resultSet.getString("didt") %></td>
<td><%=resultSet.getString("state") %></td>
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