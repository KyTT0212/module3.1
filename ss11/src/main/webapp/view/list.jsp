<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 3/13/2023
  Time: 11:09 AM
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

    <style>
        .table tr:nth-child(even){
            background-color:white; }

        .table tr:nth-child(odd){
            background-color:#eee; }

        th{
            background-color:#718093; color: aliceblue
        }

        table, td, th {
            border: 1px solid green;
            width: auto;
            text-align: center;
        }

        h1{
            text-align: center;
            margin-top: 20px
        }
    </style>
</head>
<body>
<h1>BẢNG DANH SÁCH</h1>
<a href="/Book?action=create" class="btn btn-secondary mb-3" style="margin-right: 15%;margin-left: 73%">Thêm mới sản phẩm</a>
<div class="container" style="margin-top: 13px">
    <table class="table">
        <thead>
        <tr>
            <th>STT</th>
            <th>title</th>
            <th>pageSize</th>
            <th>author</th>
            <th>category</th>
            <th>Lựa chọn</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${bookList}" var="book" varStatus="loop">
            <tr>
                <td>${loop.count}</td>
                <td>${book.title}</td>
                <td>${book.pageSize}</td>
                <td>${book.author}</td>
                <td>
                    <c:if test="${book.category == 1}">Pháp luật</c:if>
                    <c:if test="${book.category == 2}">Công nghệ</c:if>
                    <c:if test="${book.category == 3}">Nghệ thuật</c:if>
                    <c:if test="${book.category == 4}">Tiểu thuyết</c:if>
                    <c:if test="${book.category == 5}">Tâm linh</c:if>
                    <c:if test="${book.category == 6}">Truyện</c:if>
                </td>
                <td>
                    <a href="">UPDATE</a>
                    <a href="/Book=action?delete&id=${book.id}">DELETE</a>
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
