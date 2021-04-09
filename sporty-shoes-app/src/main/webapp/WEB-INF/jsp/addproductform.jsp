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
    <form method="post" align="center">
    <h4>Add product</h4>
            
        ProductName : <input type="text" name="pname" /><br/><br/>
        ProductCost : <input type="int" name="pcost" /> <br/><br/>
        Date : <input type="String" name="date" /> <br/><br/>
        Category : <input type="String" name="category" /> <br/><br/>
        
        <input type="submit" name="add product"/>
    </form>
</body>
</html>