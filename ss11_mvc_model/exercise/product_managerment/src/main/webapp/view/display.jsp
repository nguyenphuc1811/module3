<%--
  Created by IntelliJ IDEA.
  User: Welcome
  Date: 12/1/2022
  Time: 11:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<table class="tab">
    <tr>
        <th>STT</th>
        <th>Name</th>
        <th>Price</th>
        <th>Description</th>
        <th>Brand</th>
    </tr>
    <c:forEach varStatus="stt" var="product" items="${listProduct}">
        <tr>
            <td>${stt.count}</td>
            <td>${product.getName()}</td>
            <td>${product.getPrice()}</td>
            <td>${product.getDescription()}</td>
            <td>${product.getBrand()}</td>
            <td><a href="/product?action=delete&id=${product.getId()}" >Delete</a> </td>
        </tr>
    </c:forEach>
</table>
<a href="/product?action=add">ADD</a>
</body>
</html>
