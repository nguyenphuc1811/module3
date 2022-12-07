<%--
  Created by IntelliJ IDEA.
  User: Welcome
  Date: 12/6/2022
  Time: 10:38 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="../bootstrap-5.1.3-dist/css/bootstrap.css">
<script src="../bootstrap-5.1.3-dist/js/bootstrap.js"></script>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="row">
    <div class="col-lg-10">
        <img src="../picture/logo.jpg" height="75" width="133">
    </div>
    <div class="col-lg-2 ">
        <p>Nguyễn Văn A</p>
    </div>
</div>
<nav class="navbar navbar-expand-lg navbar-light bg-light sticky-top ">
    <div class="container-fluid">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 d-flex justify-content-center ">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Employee</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/customer">Customer</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/facility">Service</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Contract</a>
                </li>
            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
</body>
</html>
