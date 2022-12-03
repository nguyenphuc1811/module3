<%--
  Created by IntelliJ IDEA.
  User: Welcome
  Date: 12/3/2022
  Time: 10:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="/product?action=edit">
    <table>
        <tr><input type="hidden" name="id" value="${product.id}" ></tr>
        <tr>
            <td>Nhập tên:</td>
            <td><label>
                <input type="text" name="name" value="${product.name}" >
            </label></td>
        </tr>
        <tr>
            <td>Nhập giá:</td>
            <td><label>
                <input type="text" name="price" value="${product.price}">
            </label></td>
        </tr>
        <tr>
            <td>Nhập mô tả:</td>
            <td><label>
                <input type="text" name="description" value="${product.description}">
            </label></td>
        </tr>
        <tr>
            <td>Nhập hãng sản xuất:</td>
            <td><label>
                <input type="text" name="brand" value="${product.brand}">
            </label></td>
        </tr>
        <tr><td><button type="submit">Save</button></td></tr>
    </table>

</form>
<a href="/product">Back to List</a>
</body>
</html>
