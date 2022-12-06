<%--
  Created by IntelliJ IDEA.
  User: Welcome
  Date: 12/6/2022
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="header.jsp"%>
<div class="d-flex justify-content-between m-2">
    <button class="btn btn-sm btn-outline-success">Add</button>
    <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
</div>
<table class="table table-striped table-hover" style="--bs-table-hover-bg: lightblue">
    <thead>
    <tr class="bg-dark text-light">
        <th scope="col">Number</th>
        <th scope="col">Type</th>
        <th scope="col">Name</th>
        <th scope="col">Gender</th>
        <th scope="col">Id Card</th>
        <th scope="col">Phone number</th>
        <th scope="col">Email</th>
        <th scope="col" colspan="3">Address</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">1</th>
        <td>Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
        <td>Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
        <td>Mark</td>
        <td>
            <button class="btn btn-sm btn-outline-info" data-bs-toggle="modal" data-bs-target="#edit">Edit</button>
        </td>
        <td>
            <button class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#exampleModal">Delete
            </button>
        </td>
    </tr>
    </tbody>
</table>
<%@include file="footer.jsp"%>
</body>
</html>
