<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 06/08/2021
  Time: 10:55 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html lang="en">

<head>
    <title> SESSION | Games </title>
    <link rel="stylesheet" href="${context}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">

</head>

<body>

<br>

<br>

<br>

<form action="${context}/login" method="POST">

    <div class="col-auto">
        <label for="correo" class="visually-hidden">Correo:</label>
        <input type="correo" class="form-control" id="correo" placeholder="correo">
    </div>

    <div class="col-auto">
        <label for="password" class="visually-hidden">Password:</label>
        <input type="password" class="form-control" id="password" placeholder="Password">
    </div>

    <div class="col-auto">
        <button type="submit" class="btn btn-success"><i class="fas fa-plus"></i> Agregar</button>
    </div>

</form>

<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

</body>
</html>