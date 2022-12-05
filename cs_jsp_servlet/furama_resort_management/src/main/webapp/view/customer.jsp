<%--
  Created by IntelliJ IDEA.
  User: Welcome
  Date: 12/4/2022
  Time: 7:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
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
    <tr>
        <th scope="row">2</th>
        <td>Jacob</td>
        <td>Thornton</td>
        <td>@fat</td>
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
    <tr>
        <th scope="row">3</th>
        <td colspan="2">Larry the Bird</td>
        <td>@twitter</td>
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
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Do you want delete?</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger">Delete</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="edit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editConfirm">Edit</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3 row">
                    <label for="e" class="col-sm-2 col-form-label">info</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="e">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="f" class="col-sm-2 col-form-label">info</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="f">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="g" class="col-sm-2 col-form-label">info</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="g">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="h" class="col-sm-2 col-form-label">info</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="h">
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" href="">Add</button>
            </div>
        </div>
    </div>
</div>
</body>
</body>
</html>
