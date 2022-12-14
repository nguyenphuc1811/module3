<%--
  Created by IntelliJ IDEA.
  User: Welcome
  Date: 12/4/2022
  Time: 7:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.css">
<script src="../../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<style>
    input {
        margin-bottom: 5px;
    }
</style>
<html>
<head>
    <title>Title</title>
</head>
<body>
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
        <th scope="col">#</th>
        <th scope="col">Dịch vụ</th>
        <th scope="col">Khách hàng</th>
        <th scope="col">Ngày bắt đầu</th>
        <th scope="col">Ngày kết thúc</th>
        <th scope="col">Tiền đặt cọc</th>
        <th scope="col">Tổng tiền</th>
        <th scope="col">Các dịch vụ đi kèm</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <th scope="row">1</th>
        <td>Mark</td>
        <td>Otto</td>
        <td>@mdo</td>
        <td>@mdo</td>
        <td>@mdo</td>
        <td>@mdo</td>
        <td>
            <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#edit">+</button>
            <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Danh sách các
                dịch vụ đi kèm
            </button>
        </td>
    </tr>
    <tr>
        <th scope="row">2</th>
        <td>Jacob</td>
        <td>Thornton</td>
        <td>@fat</td>
        <td>@mdo</td>
        <td>@mdo</td>
        <td>@mdo</td>
        <td colspan="3">
            <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#edit">+</button>
            <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Danh sách các
                dịch vụ đi kèm
            </button>
        </td>
    </tr>
    <tr>
        <th scope="row">3</th>
        <td colspan="2">Larry the Bird</td>
        <td>@twitter</td>
        <td>@mdo</td>
        <td>@mdo</td>
        <td>@mdo</td>
        <td>
            <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#edit">+</button>
            <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Danh sách các
                dịch vụ đi kèm
            </button>
        </td>
    </tr>
    </tbody>
</table>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteConfirm">Do you want delete?</h5>
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
<div class="modal fade" id="add" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addConfirm">Add</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3 row">
                    <label for="a" class="col-sm-2 col-form-label">info</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="a">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="b" class="col-sm-2 col-form-label">info</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="b">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="c" class="col-sm-2 col-form-label">info</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="c">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="d" class="col-sm-2 col-form-label">info</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="d">
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
<div class="modal fade" id="edit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="editConfirm">Thêm hợp đồng</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3 row">
                    <label for="e" class="col-sm-2 col-form-label">Ngày bắt đầu</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="e" placeholder="dd//mm//yyyy">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="f" class="col-sm-2 col-form-label">Ngày kết thúc</label>
                    <div class="col-sm-10">
                        <input type="password" class="form-control" id="f" placeholder="dd//mm//yyyy">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="g" class="col-sm-2 col-form-label">Tiền gửi</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="g">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="h" class="col-sm-2 col-form-label">Tổng tiền</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control bg-dark" id="h" placeholder="đ0">
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="h" class="col-sm-2 col-form-label">Khách hàng thuê dịch vụ</label>
                    <div class="col-sm-10">
                        <select class="form-select" aria-label="Default select example">
                            <option selected>Chọn khách hàng</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="h" class="col-sm-2 col-form-label">Dịch vụ</label>
                    <div class="col-sm-10">
                        <select class="form-select" aria-label="Default select example">
                            <option selected>Chọn dịch vụ</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="h" class="col-sm-2 col-form-label">Dịch vụ</label>
                    <div class="col-sm-10">
                        <button class="btn btn-sm btn-outline-success" data-bs-toggle="modal"
                                data-bs-target="#addService">+
                        </button>
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-success" href="">Thêm hợp đồng</button>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="addService" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addConfirmService">Add</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3 row">
                    <label class="col-sm-2 col-form-label">Chọn dịch vụ</label>
                    <div class="col-sm-10">
                        <select class="form-select" aria-label="Default select example">
                            <option selected>Mini bar</option>
                            <option value="1">Girl call</option>
                            <option value="2">Beer hug</option>
                            <option value="3">Chicken 45kg</option>
                        </select>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="a1" class="col-sm-2 col-form-label">Số lượng</label>
                    <div class="col-sm-10">
                        <input type="number" class="form-control" id="a1" placeholder="1">
                    </div>
                </div>
            </div>
            <div class="modal-footer justify-content-center">
                <button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#edit">Close
                </button>
                <button type="button" class="btn btn-success" href="">Add</button>
            </div>
        </div>
    </div>
</div>
<nav aria-label="Page navigation example">
    <ul class="pagination justify-content-center">
        <li class="page-item">
            <a class="page-link" href="#" aria-label="Previous">
                <span aria-hidden="true">&laquo;</span>
            </a>
        </li>
        <li class="page-item"><a class="page-link" href="#">Previous</a></li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">Next</a></li>
        <li class="page-item">
            <a class="page-link" href="#" aria-label="Next">
                <span aria-hidden="true">&raquo;</span>
            </a>
        </li>
    </ul>
</nav>
</body>
</html>
