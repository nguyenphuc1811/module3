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
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="header.jsp"%>
<div class="row">
    <div class="col-3 ">
        <ul class="list-group vh-100 overflow-scroll">
            <li class="list-group-item">An item</li>
            <li class="list-group-item">A second item</li>
            <li class="list-group-item">A third item</li>
            <li class="list-group-item">A fourth item</li>
            <li class="list-group-item">And a fifth one</li>
            <li class="list-group-item">And a fifth one</li>
        </ul>
    </div>
    <div class="col-9">
        <img  src="../picture/home.jpg" height="579" width="100%"/>
    </div>
</div>
<%@include file="footer.jsp"%>
</body>
</html>
