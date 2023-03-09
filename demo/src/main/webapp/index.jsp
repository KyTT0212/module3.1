<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

-------------------------Mặc định trang index cũng là trang /adminServlet------------------------
<%--<c:redirect url="/adminServlet"/>--%>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<%--<h1>hello world</h1>--%>
<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="/adminServlet">Hello Servlet</a>
<a href="/WebServlet">Hello Servlet</a>
</body>
</html>