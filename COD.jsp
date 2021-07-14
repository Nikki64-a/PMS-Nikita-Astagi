<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import ="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
String fname = request.getParameter("fname");
String pname= request.getParameter("pname");
String pquantity= request.getParameter("pquantity");
String hno=request.getParameter("hno");
String didt=request.getParameter("didt");
String state=request.getParameter("state");
String amnt=request.getParameter("amnt");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase","root","admin");
Statement st = con.createStatement();
//ResultSet rs;
int i = st.executeUpdate("insert into cod(fname,pname,pquantity,hno,didt,state,amnt) values ('" + fname + "','" + pname + "','" +pquantity + "','" +hno+ "','" +didt + "','"+state+"','"+amnt+"' )");
if (i > 0) {
//session.setAttribute("userid", user);
response.sendRedirect("Login.html");
// out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
} 
%>
</body>
</html>