<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%--<%@include file="/common/taglib.jsp" %>--%>

<%@taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="dec" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%--    dec:title được định nghĩa là default -> trang nào ko có title thì tự động title là default--%>
    <title><dec:title default="Trang chủ"/></title>

    <!-- css -->
    <link href="<c:url value='/template/web/bootstrap/css/bootstrap.min.css' />" rel="stylesheet" type="text/css"
          media="all"/>
    <link href="<c:url value='/template/web/css/style.css' />" rel="stylesheet" type="text/css" media="all"/>

</head>
<body>
<!-- header -->
<%@ include file="/common/web/header.jsp" %>
<!-- header -->

<div class="container">
    <dec:body/>
<%--    dec ở đây là cái biến gọi cho taglib decorator--%>
</div>

<!-- footer -->
<%@ include file="/common/web/footer.jsp" %>
<!-- footer -->

<script type="text/javascript" src="<c:url  ><value>/template/web/jquery/jquery.min.js</value></c:url>"></script>
<script type="text/javascript"
        src="<c:url  ><value>/template/web/bootstrap/js/bootstrap.bundle.min.js</value></c:url>"></script>

</body>
</html>
