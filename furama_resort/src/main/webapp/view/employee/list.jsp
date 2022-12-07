<%--
  Created by IntelliJ IDEA.
  User: Welcome
  Date: 12/7/2022
  Time: 2:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <th scope="col">Date of birth</th>
        <th scope="col">Id card</th>
        <th scope="col">Salary</th>
        <th scope="col">Phone number</th>
        <th scope="col">Email</th>
        <th scope="col">address</th>
        <th scope="col">Position</th>
        <th scope="col">Education</th>
        <th scope="col">Division</th>
        <th scope="col" colspan="3">User Name</th>
    </tr>
<%@include file="../footer.jsp"%>
</body>
</html>
