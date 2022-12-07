<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Welcome
  Date: 12/6/2022
  Time: 11:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.css">
<script src="../../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="/view/header.jsp" %>
<div class="d-flex justify-content-between m-2">
    <button class="btn btn-sm btn-outline-success" data-bs-toggle="modal" data-bs-target="#add">Add</button>
    <span aria-required="false">
        ${mess}
    </span>
    <form class="d-flex" method="post" action="/customer?action=search">
        <input name="name" class="form-control me-2" type="search" placeholder="Name" aria-label="Name">
        <select name="typeCustomer">
            <option value="1">Diamond</option>
            <option value="2">Platinium</option>
            <option value="3">Gold</option>
            <option value="4">Silver</option>
            <option value="5" selected>Member</option>
        </select>
        <input name="address" class="form-control me-2" type="search" placeholder="Address" aria-label="Address">
        <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
</div>
<table class="table table-striped table-hover" style="--bs-table-hover-bg: lightblue" id="tableStudent">
    <thead>
    <tr class="bg-dark text-light">
        <th scope="col">STT</th>
        <th scope="col">Customer Type</th>
        <th scope="col">Name</th>
        <th scope="col">Date Of Birth</th>
        <th scope="col">Gender</th>
        <th scope="col">Id Card</th>
        <th scope="col">Phone number</th>
        <th scope="col">Email</th>
        <th scope="col">Address</th>
        <th scope="col"></th>
        <th scope="col"></th>

    </tr>
    </thead>

    <tbody>
    <c:forEach var="customer" items="${list}" varStatus="ct">
        <tr>
            <td>${ct.count}</td>
            <td>
                <c:choose>
                    <c:when test="${customer.getCustomerTypeId() == 1}">Diamond</c:when>
                    <c:when test="${customer.getCustomerTypeId() == 2}">Platinium</c:when>
                    <c:when test="${customer.getCustomerTypeId() == 3}">Gold</c:when>
                    <c:when test="${customer.getCustomerTypeId() == 4}">Silver</c:when>
                    <c:otherwise>Member</c:otherwise>
                </c:choose>
            </td>
            <td>${customer.getName()}</td>
            <td>${customer.getDate()}</td>
            <td>
                <c:if test="${customer.isGender()}">Nam</c:if>
                <c:if test="${!customer.isGender()}">Nữ</c:if>
            </td>
            <td>${customer.getIdCard()}</td>
            <td>${customer.getPhoneNumber()}</td>
            <td>${customer.getEmail()}</td>
            <td>${customer.getAddress()}</td>
            <td>
                <button onclick="editModal('${customer.getId()}','${customer.getCustomerTypeId()}','${customer.getName()}','${customer.getDate()}'
                        ,'${customer.isGender()}','${customer.getIdCard()}','${customer.getPhoneNumber()}','${customer.getEmail()}'
                        ,'${customer.getAddress()}')" class="btn btn-sm btn-outline-info" data-bs-toggle="modal"
                        data-bs-target="#edit">Edit
                </button>
            </td>
            <td>
                <button onclick="deleteModal('${customer.getId()}','${customer.getName()}')"
                        class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#delete">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<%@include file="../footer.jsp" %>

<script src="../../jquery/jquery-3.5.1.min.js"></script>
<script src="../../datatables/js/jquery.dataTables.min.js"></script>
<script src="../../datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableStudent').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>

<div class="modal fade" id="delete" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1"
     aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">Delete Confirm</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                Do you want delete <span id="name"></span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <form method="post" action="/customer?action=delete">
                    <input type="text" id="id" name="id" hidden>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="add" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Customer</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="post" action="/customer?action=add">
                <div class="modal-body">
                    <div>
                        <select name="typeCustomer">
                            <option value="1">Diamond</option>
                            <option value="2">Platinium</option>
                            <option value="3">Gold</option>
                            <option value="4">Silver</option>
                            <option value="5" selected>Member</option>
                        </select>
                    </div>
                    <div>
                        <input type="text" name="name" class="form-control" placeholder="Name">
                    </div>
                    <div>
                        <input type="date" name="date" class="form-control" placeholder="Date : YYYY/mm/dd">
                    </div>
                    <div>
                        <select name="gender">
                            <option value="true">Nam</option>
                            <option value="false">Nữ</option>
                        </select>
                    </div>
                    <div>
                        <input type="text" name="idCard" class="form-control" placeholder="Id Card">
                    </div>
                    <div>
                        <input type="text" name="phoneNumber" class="form-control" placeholder="Phone Number">
                    </div>
                    <div>
                        <input type="email" name="email" class="form-control" aria-describedby="emailHelp"
                               placeholder="Email">
                    </div>
                    <div>
                        <input type="text" name="address" class="form-control" placeholder="Address">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save Add</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="edit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit customer</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/customer?action=edit" method="post">
                <div class="modal-body">
                    <input name="id" id="idEdit" hidden>
                    <div>
                        <select id="typeCustomer" name="typeCustomer">
                            <option value="1">Diamond</option>
                            <option value="2">Platinium</option>
                            <option value="3">Gold</option>
                            <option value="4">Silver</option>
                            <option value="5" selected>Member</option>
                        </select>
                    </div>
                    <div>
                        <input id="nameEdit" type="text" name="name" class="form-control">
                    </div>
                    <div>
                        <input id="dateEdit" type="date" name="date" class="form-control">
                    </div>
                    <div>
                        <select name="gender" id="genderEdit">
                            <option value="true">Nam</option>
                            <option value="false">Nữ</option>
                        </select>
                    </div>
                    <div>
                        <input id="idCardEdit" type="text" name="idCard" class="form-control">
                    </div>
                    <div>
                        <input id="phoneNumberEdit" type="text" name="phoneNumber" class="form-control">
                    </div>
                    <div>
                        <input id="emailEdit" type="email" name="email" class="form-control"
                               aria-describedby="emailHelp">
                    </div>
                    <div>
                        <input id="addressEdit" type="text" name="address" class="form-control">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save Change</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
<script>
    function deleteModal(id, name) {
        document.getElementById("id").value = id;
        document.getElementById("name").innerText = name;
    }

    function editModal(id, typeCustomer, name, date, gender, idCard, phoneNumber, email, address) {
        document.getElementById("idEdit").value = id;
        document.getElementById("typeCustomer").value = typeCustomer;
        document.getElementById("nameEdit").value = name;
        document.getElementById("dateEdit").value = date;
        document.getElementById("genderEdit").value = gender;
        document.getElementById("idCardEdit").value = idCard;
        document.getElementById("phoneNumberEdit").value = phoneNumber;
        document.getElementById("emailEdit").value = email;
        document.getElementById("addressEdit").value = address;
    }
</script>
</html>
