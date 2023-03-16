<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 3/15/2023
  Time: 12:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <title>Title</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<form action="/book?action=create" method="post">
  <div class="form-group">
    <label for="id">ID</label>
    <input type="text"
           class="form-control" name="id" id="id" aria-describedby="helpId" placeholder="Nhập id">
  </div>
  <div class="form-group">
    <label for="name">NAME</label>
    <input type="text"
           class="form-control" name="name" id="name" aria-describedby="helpId" placeholder="Nhập name">
  </div>
  <div class="form-group">
    <label for="pageSize">Page Size</label>
    <input type="text"
           class="form-control" name="pageSize" id="pageSize" aria-describedby="helpId" placeholder="Nhập số trang">
  </div>
  <div>
    <span>Authors</span>
    <select name="authors" id="authors">
      <option value="0" disabled="disabled">--Tác giả--</option>
      <option value="1">Nguyễn Thái Học</option>
      <option value="2">Trần Mình Hoàng</option>
      <option value="3">Dương Trung Quốc</option>
      <option value="4">Lê Văn Hiến</option>
      <option value="5">Hà Văn Minh</option>
    </select>
  </div>
  <div>
    <span>Category</span>
    <select name="category" id="category">
      <option value="0" disabled="disabled">--Thể loại--</option>
      <option value="1">Tự nhiên</option>
      <option value="2">Xã Hội</option>
      <option value="3">Truyện</option>
      <option value="4">Tiểu Thuyết</option>
      <option value="5">Khác</option>
    </select>
  </div>
  <input type="submit" class="btn btn-outline-info" style="width: 14%;margin: 20px 43% 0;}" value="Update">
</form>

<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
        integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
        integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
        crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
        integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
        crossorigin="anonymous"></script>
</body>
</html>
