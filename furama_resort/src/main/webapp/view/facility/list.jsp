<%--
  Created by IntelliJ IDEA.
  User: Welcome
  Date: 12/7/2022
  Time: 2:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../bootstrap-5.1.3-dist/css/bootstrap.css">
<script src="../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="../header.jsp"%>
<div class="d-flex justify-content-between m-2">
    <button class="btn btn-sm btn-outline-success" data-bs-toggle="modal" data-bs-target="#add">Add</button>
    <form class="d-flex">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
</div>
<table class="table table-striped table-hover border-1" style="--bs-table-hover-bg: lightblue">
    <thead>
    <tr class="bg-dark text-light">
        <th scope="col">STT</th>
        <th scope="col">Name</th>
        <th scope="col">Area</th>
        <th scope="col">Cost</th>
        <th scope="col">Salary</th>
        <th scope="col">Max people</th>
        <th scope="col">Rent Type</th>
        <th scope="col">Facility Type</th>
        <th scope="col">Standard Room</th>
        <th scope="col">Description</th>
        <th scope="col">Pool Area</th>
        <th scope="col">Floor</th>
        <th scope="col" colspan="3">Facility Free</th>
    </tr>
    </thead>
    <tr>
        <th scope="row">1</th>
        <td>Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
        <td>@mdo</td>
        <td>@mdo</td>
        <td>@mdo</td>
        <td>
            <a class="btn btn-sm btn-primary" href="view/facility/contract.jsp">+</a>
            <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Danh sách các
                dịch vụ đi kèm
            </button>
        </td>
    </tr>
</table>
    <%@include file="../footer.jsp"%>

</body>
</html>
