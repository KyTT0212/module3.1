<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 3/13/2023
  Time: 8:25 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
    <title>Update</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
        h1 {
            text-align: center;
            margin-top: 18px;
        }

        .container {
            border: 1px solid;
            padding: 13px 20px;
            max-width: 684px;
        }
    </style>
</head>
<body style="background-image: url('https://mega.com.vn/media/news/2707_hinh-nen-lam-slide-chuyen-nghiep.jpg');background-size: cover">
<form action="/Book?action=update" method="post">
    <div>
        <h1>Bảng chỉnh sửa thông tin</h1>
        <div class="container" style="background: aliceblue">
            <input type="hidden" name="id" id="id" class="form-control" value="${book.id}">
            <div class="form-group">
                <label for="title">Title</label>
                <input type="text"
                       class="form-control" name="title" id="title" value="${book.title}">
            </div>
            <div class="form-group">
                <label for="pageSize">Page Size</label>
                <input type="text"
                       class="form-control" name="page" id="pageSize" value="${book.pageSize}">
            </div>
            <div class="form-group">
                <label for="author">Author</label>
                <input type="text"
                       class="form-control" name="author" id="author" value="${book.author}">
            </div>
            <div>
                <span>Category</span>
                <select name="category" id="category" style=" margin-left: 5px;">
                    <option value="0" disabled="disabled">--Thể loại--</option>
                    <option value="1">Pháp luật</option>
                    <option value="2">Công nghệ</option>
                    <option value="3">Nghệ thuật</option>
                    <option value="4">Tiểu thuyết</option>
                    <option value="5">Tâm linh</option>
                    <option value="6" selected="selected">Truyện</option>
                </select>
            </div>
            <input type="submit" class="btn btn-outline-info" style="width: 14%;margin: 20px 43% 0;}" value="Update">


            <%--  <input type="hidden" name="id" id="id" class="form-control" value="${book.id}">--%>

            <%--  <lable for="title">title</lable>--%>
            <%--  <input type="text" name="title" id="title" class="form-control" value="${book.title}">--%>

            <%--  <lable for="pageSize">pageSize</lable>--%>
            <%--  <input type="text" name="pageSize" id="pageSize" class="form-control" value="${book.pageSize}">--%>

            <%--  <lable for="author">author</lable>--%>
            <%--  <input type="text" name="author" id="author" class="form-control" value="${book.author}">--%>

            <%--  <lable for="category">category</lable>--%>
            <%--  <input type="text" name="category" id="category" class="form-control" value="${book.category}">--%>

            <%--  <input type="submit" value="Cập nhập sản phẩm">--%>
        </div>

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
