<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%
String curp=request.getParameter("name");
String np=request.getParameter("password");
String cnp=request.getParameter("cpassword");
String connurl = "jdbc:mysql://localhost:3306/sporty-shoes";
Connection con=null;
String pass="";
String username="";
try{
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection(connurl, "root", "Sailucky@123");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select * from admin where password='"+curp+"'");
while(rs.next()){
username=rs.getString(1);
pass=rs.getString(2);
} 
if(pass.equals(curp)){
Statement st1=con.createStatement();
int i=st1.executeUpdate("update admin set password='"+np+"' where password='"+curp+"'");
out.println("Password changed successfully");
%>
<br/><br/>s<a href="/login">Go To Login Page</a>
<%
st1.close();
con.close();
}
}
catch(Exception e){
out.println(e);
}
%>
