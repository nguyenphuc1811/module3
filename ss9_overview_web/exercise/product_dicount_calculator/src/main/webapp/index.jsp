<%--
  Created by IntelliJ IDEA.
  User: Welcome
  Date: 11/29/2022
  Time: 11:12 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<form style="margin: 20px 30px " action="display-discount" method="post">
    <div class="row g-3 align-items-center">
        <div class="col-2">
            <label class="col-form-label">Product Description</label>
        </div>
        <div class="col-3">
            <input type="text" name="description" class="form-control">
        </div>
    </div>
    </div>
    </div>
    <div class="row g-3 align-items-center">
        <div class="col-2">
            <label class="col-form-label">List Price</label>
        </div>
        <div class="col-3">
            <input type="number" name="price" class="form-control">
        </div>
    </div>
    <div class="row g-3 align-items-center">
        <div class="col-2">
            <label class="col-form-label">Discount Percent (%)</label>
        </div>
        <div class="col-3">
            <input type="text" name="percent" class="form-control">
        </div>
    </div>
    <div class="row">
        <div class="col-1">
            <button class="btn btn-success" type="submit">Calculate Discount</button>
        </div>
    </div>
</form>
</body>
</html>
