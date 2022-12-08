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
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="../header.jsp" %>
<div class="d-flex justify-content-between m-2">
    <button class="btn btn-sm btn-outline-success" data-bs-toggle="modal" data-bs-target="#add">Add</button>
    <span>${mess}</span>
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
        <th scope="col">Max people</th>
        <th scope="col">Rent Type</th>
        <th scope="col">Facility Type</th>
        <th scope="col">Standard Room</th>
        <th scope="col">Description</th>
        <th scope="col">Pool Area</th>
        <th scope="col">Floor</th>
        <th scope="col">Facility Free</th>
        <th></th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="f" items="${list}" varStatus="stt">
        <tr>
            <td>${stt.count}</td>
            <td>${f.getName()}</td>
            <td>${f.getArea()}</td>
            <td>${f.getCost()}</td>
            <td>${f.getMaxPeople()}</td>
            <td>${f.getRentType().getName()}</td>
            <td>${f.getFacilityType().getName()}</td>
            <td>${f.getStandardRoom()}</td>
            <td>${f.getDescription()}</td>
            <td>${f.getPoolArea()}</td>
            <td>${f.getNumberOfFloor()}</td>
            <td>${f.getFacilityFree()}</td>
            <td>
                <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Edit
                </button>
            </td>
            <td>
                <button onclick="deleteModal('${f.getId()}','${f.getName()}')" class="btn btn-sm btn-danger"
                        data-bs-toggle="modal" data-bs-target="#delete">
                    Delete
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<%@include file="../footer.jsp" %>
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
                <form method="post" action="/facility?action=delete">
                    <input type="text" id="id" name="id" hidden>
                    <button type="submit" class="btn btn-primary">Delete</button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="add" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Add Customer</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form method="post" action="/facility?action=add">
                <div class="modal-body">
                    <div>
                        <input hidden name="facilityType" id="">
                        <button onclick="hideList(1)" id="1">House</button>
                        <button onclick="hideList(2)" id="2">Villa</button>
                        <button onclick="hideList(3)" id="3">Room</button>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Name</span>
                        <input type="text" class="form-control" aria-label="Sizing example input"
                               aria-describedby="inputGroup-sizing-default">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Area</span>
                        <input type="text" class="form-control" aria-label="Sizing example input"
                               aria-describedby="inputGroup-sizing-default">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Cost</span>
                        <input type="text" class="form-control" aria-label="Sizing example input"
                               aria-describedby="inputGroup-sizing-default">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Max People</span>
                        <input type="text" class="form-control" aria-label="Sizing example input"
                               aria-describedby="inputGroup-sizing-default">
                    </div>
                    <div>
                        <select class="form-select" aria-label="Default select example">
                            <option>Rent Type</option>
                            <c:forEach var="rt" items="${rentType}">
                                <option name="rentTypeId" value="${rt.getId()}">${rt.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="row">
                        <p class="col-2 input-group-text">Standard Room</p>
                        <div class="s- col-3">
                            Vip<input name="standardRoom" value="Vip" type="radio"> Normal <input name="standardRoom"
                                                                                                  type="radio"
                                                                                                  value="Normal">
                        </div>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Description</span>
                        <input type="text" class="form-control" aria-label="Sizing example input"
                               aria-describedby="inputGroup-sizing-default">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Pool Area</span>
                        <input type="text" class="form-control" aria-label="Sizing example input"
                               aria-describedby="inputGroup-sizing-default">
                    </div>
                    <div>
                        <select class="form-select" aria-label="Default select example">
                            <option>Floor</option>
                            <option value="0">0</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                        </select>
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Facility Free</span>
                        <input type="text" class="form-control" aria-label="Sizing example input"
                               aria-describedby="inputGroup-sizing-default">
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

<script>
    function deleteModal(id, name) {
        document.getElementById("id").value = id;
        document.getElementById("name").innerText = name;
    }

    function hideList(number) {
        if (a == 1) {
            document.getElementById("asd").style.display = "none";
        } else {
            document.getElementById("asd").style.display = "block";
        }
    }
</script>
</body>
</html>
