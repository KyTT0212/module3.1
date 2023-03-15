<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 3/14/2023
  Time: 11:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
<head>
  <title>List</title>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <style>
    .table tr:nth-child(even) {
      background-color: white;
    }

    .table tr:nth-child(odd) {
      background-color: #eee;
    }

    th {
      background-color: #718093;
      color: aliceblue
    }

    table, td, th {
      border: 1px solid green;
      width: auto;
      text-align: center;
    }

    h1 {
      text-align: center;
      margin-top: 20px
    }
  </style>
</head>
<body>
<h1>BẢNG DANH SÁCH</h1>
<a href="/book?action=create" class="btn btn-secondary mb-3" style="margin-right: 15%;margin-left: 73%">THÊM MỚI</a>
<div class="container">
  <table class="table">
    <thead>
    <tr>
      <th>STT</th>
      <th>ID</th>
      <th>NAME</th>
      <th>Page Size</th>
      <th>Authors</th>
      <th>Category</th>
      <th>Lựa chọn</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${booksList}" var="book" varStatus="loop">
      <tr>
        <td>${loop.count}</td>
        <td>${book.id}</td>
        <td>${book.name}</td>
        <td>${book.pageSize}</td>
        <td>
          <c:if test="${book.authors.id == 1}">Nguyễn Thái Học</c:if>
          <c:if test="${book.authors.id == 2}">Trần Mình Hoàng</c:if>
          <c:if test="${book.authors.id == 3}">Dương Trung Quốc</c:if>
          <c:if test="${book.authors.id == 4}">Lê Văn Hiến</c:if>
          <c:if test="${book.authors.id == 5}">Hà Văn Minh</c:if>
        </td>
        <td>
          <c:if test="${book.category.id == 1}">Tự nhiên</c:if>
          <c:if test="${book.category.id == 2}">Xã Hội</c:if>
          <c:if test="${book.category.id == 3}">Truyện</c:if>
          <c:if test="${book.category.id == 4}">Tiểu Thuyết</c:if>
          <c:if test="${book.category.id == 5}">Khác</c:if>
        </td>
        <td>
          <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
             title="Chỉnh sửa" href='/book?action=update&id=${book.id}'>
            <i class="fa fa-pencil-square-o" aria-hidden="true"></i>
          </a>

          <a class="btn btn-sm btn-primary btn-edit" data-toggle="tooltip"
             title="Xóa" onclick="confirm('Bạn có muốn xóa hay không?');" href='/book?action=delete&id=${book.id}' style="background: #e74c3c;border-color: #e74c3c;">
            <i class="fa fa-trash-o bigger-110 pink"></i>
          </a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

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
