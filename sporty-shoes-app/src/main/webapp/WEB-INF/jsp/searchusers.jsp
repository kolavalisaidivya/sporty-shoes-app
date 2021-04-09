<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sporty shoes website </title>
</head>
<body>
<h3>Search Users</h3>
<font color="red">${errorMessage}</font>
    <form method="post">
        Firstname : <input type="text" name="fname" /><br/><br/>
        Lastname : <input type="text" name="lname" /><br/><br/>
        Email : <input type="text" name="email" /><br/><br/>
               
        <input type="submit" value="search"/>
    </form>
</body>
</html>