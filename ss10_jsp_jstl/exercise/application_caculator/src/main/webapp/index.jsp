<%--
  Created by IntelliJ IDEA.
  User: Welcome
  Date: 11/30/2022
  Time: 2:27 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<html>
<head>
    <title>$Title$</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form method="post" action="/calculator">
    <div class="mb-3 row">
        <label class="col-sm-2 col-form-label">First operand</label>
        <div class="col-sm-2">
            <input type="text" name="number1" class="form-control">
        </div>
    </div>
    <div class="mb-3 row">
        <label class="col-sm-2 col-form-label">Operator</label>
        <div class="col-sm-4">
            <select name="operator" class="form-select" aria-label="Default select example">
                <option selected value="addition">Addition</option>
                <option value="subtraction">Subtraction</option>
                <option value="multiplication">Multiplication</option>
                <option value="division">Division</option>
            </select>
        </div>
    </div>
    <div class="mb-3 row">
        <label class="col-sm-2 col-form-label">Second operand</label>
        <div class="col-sm-2">
            <input type="text" name="number2" class="form-control">
        </div>
    </div>
    <div class="mb-3 row">
        <div class="col-sm-2"></div>
        <div class="col-sm-3">
            <button type="submit">Calculate</button>
        </div>
    </div>
</form>
</body>
</html>
