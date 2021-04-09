<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "sporty-shoes";
String userid = "root";
String password = "Sailucky@123";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;

%>


<%

try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql1 ="select * from products";
resultSet = statement.executeQuery(sql1);
 %>
<!DOCTYPE html>
<html>

<head>
<meta charset="ISO-8859-1">
<title>Sporty shoes website</title>
</head>
<body>
<a href="/addproduct">Add product</a>
<font color="red">${errorMessage}</font>
    <form method="post">
        Date : <input type="text" name="date" /><br/>
        Category : <input type="text" name="category" /><br/> 
        
        <input type="submit" value="search" name="search"/>
    </form>
<h4>See the products available</h4>
<table border="1">
<tr>
<td>Product Id</td>
<td>Product Name</td>
<td>Product Cost</td>
<td>Date</td>
<td>Category</td>
<td>UserId</td>

</tr>
<% 
while(resultSet.next()){
%>

<tr>
<td><%=resultSet.getString("productid") %></td>
<td><%=resultSet.getString("productname") %></td>
<td><%=resultSet.getString("productcost") %></td>
<td><%=resultSet.getString("date") %></td>
<td><%=resultSet.getString("category") %></td>
<td><%=resultSet.getString("userid") %></td>

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