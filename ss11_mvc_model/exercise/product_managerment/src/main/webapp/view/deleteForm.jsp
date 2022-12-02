<%--
  Created by IntelliJ IDEA.
  User: Welcome
  Date: 12/1/2022
  Time: 6:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix=""%>
<html>
<head>
    <title>Title</title>
</head>
<body>
Id: ${product.getid()}<br>
Name: ${product.getName()}<br>
Price: ${product.getPrice()}<br>
Description: ${product.getDescription()}<br>
Brand: ${product.getBrand()}<br>
<button type="submit">Confirm</button>
</body>
</html>
