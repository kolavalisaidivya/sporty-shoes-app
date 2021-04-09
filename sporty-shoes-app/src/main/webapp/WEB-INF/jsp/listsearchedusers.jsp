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
String fname = request.getParameter("fname");    
String lname = request.getParameter("lname");    
String email = request.getParameter("email");    

try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql1 ="select * from user where firstname='" + fname + "' and lastname='" + lname + "' and email='"+email+"'";
resultSet = statement.executeQuery(sql1);
 %>
<!DOCTYPE html>
<html>
<body>

<h4>See the users who signed up</h4>
<table border="1">
<tr>
<td>first name</td>
<td>last name</td>
<td>Email</td>
</tr>
<% 
while(resultSet.next()){
%>

<tr>
<td><%=resultSet.getString("firstname") %></td>
<td><%=resultSet.getString("lastname") %></td>
<td><%=resultSet.getString("email") %></td>
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