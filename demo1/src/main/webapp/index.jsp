<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%----------------------Sử dụng redirect để trỏ trực tiếp đến trang servlet từ index mà không cần thao tác-------------------------%>
<%--<c:redirect url="/WebServlet"/>--%>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>
<h1><%= "trang index nè" %>
</h1>
<br/>
<a href="/WebServlet">Hello Servlet web</a>
<br/>
<a href="/AdminServlet">Hello Servlet admin</a>
</body>
</html>