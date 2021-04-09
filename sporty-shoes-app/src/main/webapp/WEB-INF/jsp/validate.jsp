<%@ page import ="java.sql.*" %>
<%
    String user = request.getParameter("name");    
    String pwd = request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sporty-shoes",
            "root", "Sailucky@123");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from admin where username='" + user + "' and password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("user", user);
        //out.println("welcome " + userid);
        out.println("<a href='logout.jsp'>Log out</a>");
        out.println("Welcome to "+user);
	   
    } else {
        out.println("Invalid password <a href='login.jsp'>try again</a>");
    }
%>