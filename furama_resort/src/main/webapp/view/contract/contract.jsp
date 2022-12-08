<%--
  Created by IntelliJ IDEA.
  User: Welcome
  Date: 12/7/2022
  Time: 2:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../../bootstrap-5.1.3-dist/css/bootstrap.css">
<script src="../../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="../header.jsp"%>
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
    </thead>
</table>
<%@include file="../footer.jsp"%>
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
                        <button class="btn btn-sm btn-outline-success" data-bs-toggle="modal" data-bs-target="#addService">+</button>
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
</body>
</html>
