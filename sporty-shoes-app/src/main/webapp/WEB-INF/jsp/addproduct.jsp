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
String pname = request.getParameter("pname");    
String pcost=request.getParameter("pcost");
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();

String sql1 ="insert into products(productname,productcost,date,category) values('" +pname+"',"+pcost+",'"+date+"','"+category+"')";
int c = statement.executeUpdate(sql1);
if(c>0){
	out.println("Product Added Successfully");
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
