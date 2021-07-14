<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String pid=request.getParameter("pid");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/drugdatabase", "root", "admin");
Statement st=conn.createStatement();
int i=st.executeUpdate("DELETE FROM product WHERE pid="+pid);
//out.println("Data Deleted Successfully!");
response.sendRedirect("SeOrder.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>