<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 3/10/2023
  Time: 1:53 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
    <style>
        table tr:nth-child(odd){
            background-color:#eee;
            /*background: rgba(88,37,123, 0.2);*/
            /*opacity: 0.6;*/
        }
        table tr:nth-child(even){
            background-color:white;
            /*opacity: 0.6;*/
        }

        .table {
            width: 64%;
            border: 2px solid;
            margin: auto;
            margin-top: 1rem;

        }

        .table th, .table td{
            border: 1px solid black;
            text-align: center;
        }

        .tr{
            border-bottom-style: solid;
            background: #f7d794 !important;
        }

        * {
            text-align: center;
        }

        div{
            text-align: center;
            background: darkseagreen;
            font-style: italic;
            font-size: xxx-large;
        }
        .p{
            font-family: cursive;
            font-size: xx-large;
            margin-top: 1rem;
        }
        .imageChange {
            max-width: 400px;
            height: auto;
        }


    </style>
</head>
<body style="background-image: url('https://bigfoto.name/uploads/posts/2022-04/1648951944_1-bigfoto-name-p-fon-pol-i-stena-1.jpg')
;background-size: cover">

<%--<span>--%>
<%--    <img src="https://hotronghiencuu.com/wp-content/uploads/hinh-anh-mau-xam-khoi.jpg" class="imageChange" alt="">--%>
<%--    --%>
<%--</span>--%>

<%--<body style="background-clip: " >--%>
<%--<video controls>--%>
<%--    <source src="../file/hdun2.mp4">--%>
<%--    <source src="../file/cjbsj.mp4">--%>
<%--    <source src="../file/bunny.mp4">--%>
<%--</video>--%>
<div>DANH SÁCH HỌC VIÊN</div>
<p class="text-center text-danger p">${msg}</p>
<table class="table">
    <thead>
    <tr class="tr">
        <th style="width: 12%;">Mã học viên</th>
        <th>Tên học viên</th>
        <th>Giới tính</th>
        <th>Điểm</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="a" varStatus="loop">
        <tr>
            <td>${loop.count}</td>
            <td>${a.name}</td>
            <td>
                <c:if test="${a.gioiTinh == 0}">Nam</c:if>
                <c:if test="${a.gioiTinh == 1}">Nữ</c:if>
            </td>
            <td>
                <c:choose>
                    <c:when test="${a.diem >= 90}">Giỏi</c:when>
                    <c:when test="${a.diem >= 80}">Khá</c:when>
                    <c:when test="${a.diem >= 60}">Trung bình</c:when>
                    <c:when test="${a.diem < 60}">Yếu</c:when>
                    <c:otherwise>
                        Danh sách rỗng
                    </c:otherwise>
                </c:choose>
            </td>
        </tr>

    </c:forEach>
    </tbody>
</table>
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
