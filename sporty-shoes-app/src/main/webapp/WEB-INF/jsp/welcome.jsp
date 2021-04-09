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
String user = request.getParameter("name");    
String pwd = request.getParameter("password");
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql1 ="select * from admin where username='" + user + "' and password='" + pwd + "'";
resultSet = statement.executeQuery(sql1);
if (resultSet.next()) {
    session.setAttribute("user", user);
    out.println("welcome " + user);
    out.println("<br/><br/>");
    out.println("<a href='/login'>Log out</a>");
    out.println("<br/><br/>");
    out.println("<a href='/users'>Search users</a>");
    out.println("<br/><br/>");
    out.println("<a href='/products'>Search products</a>");
    out.println("<br/><br/>");
    out.println("<a href='/changepassword'>Change Admin Password</a>");

String sql ="select * from user";
resultSet = statement.executeQuery(sql);
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
}} else {
    out.println("Invalid password <a href='/login'>try again</a>");
}

connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>