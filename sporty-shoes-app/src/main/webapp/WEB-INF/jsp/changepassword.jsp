<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sporty shoes website</title>
</head>
<body>
<font color="red">${errorMessage}</font>
    <form method="post">
        Current Password : <input type="text" name="name" /><br/><br/>
        Password : <input type="password" name="password" /><br/><br/> 
        Confirm Password : <input type="password" name="cpassword" /> <br/><br/>
        
        <input type="submit" />
    </form>
</body>
</html>