<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 3/9/2023
  Time: 2:41 PM
  To change this template use File | Settings | File Templates.
--%>
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
  <form action="/LoginServlet" method="post">
    <div class="container" style="border: 1px solid black; width: 26%;">
      <h1 style="text-align: center;font-family: 'Kanit', sans-serif;">LOGIN</h1>
      <h3 style="color: red; font-size: 0.95rem;">${messlogin}</h3>

      <div class="form-group">
        <label for="username">User Name: </label>
        <input type="text"
               class="form-control" name="user" id="username" aria-describedby="helpId" placeholder="Input User Name">
      </div>
      <div class="form-group">
        <label for="password">Pass Word: </label>
        <input type="text"
               class="form-control" name="pass" id="password" aria-describedby="helpId" placeholder="Input Pass Word">
      </div>
      <div style="text-align: center;">
        <input class="btn btn-outline-secondary input" style="margin-bottom: 12px;background-image: linear-gradient(to bottom right,#9AECDB,#ffcccc)" type="submit" value="login"></div>

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
