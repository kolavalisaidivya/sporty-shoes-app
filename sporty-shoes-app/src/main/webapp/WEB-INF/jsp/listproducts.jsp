<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
String date = request.getParameter("date");    
String category = request.getParameter("category");    
String user = request.getParameter("userid");    

try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql1 ="select * from products where date='" + date + "' and category = '"+category+"' and userid = '"+user +"'";
resultSet = statement.executeQuery(sql1);
 %>
<!DOCTYPE html>
<html>
<body>

<h4>See the products  by category and date</h4>
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
<td><%=resultSet.getInt("productid") %></td>
<td><%=resultSet.getString("productname") %></td>
<td><%=resultSet.getInt("productcost") %></td>
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