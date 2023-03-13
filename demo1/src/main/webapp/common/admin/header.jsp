<%--
  Created by IntelliJ IDEA.
  User: ACER
  Date: 3/10/2023
  Time: 6:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@include file="/common/taglib.jsp"%>--%>

<%@taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="dec" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div id="navbar" class="navbar navbar-default          ace-save-state">
    <div class="navbar-container ace-save-state" id="navbar-container">
        <div class="navbar-header pull-left">
            <a href="#" class="navbar-brand">
                <small>
                    <i class="fa fa-leaf"></i>
                    Trang quản trị
                </small>
            </a>
        </div>
        <div class="navbar-buttons navbar-header pull-right collapse navbar-collapse" role="navigation">
            <ul class="nav ace-nav">
                <li class="light-blue dropdown-modal">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle">
                        Xin chào, [tên quản trị]
<%--                        ${USERMODEL.fullName}--%>
                    </a>
                <li class="light-blue dropdown-modal">
<%--                    <a href='<c:url value="/thoat?action=logout"/>'>--%>
<%--                    <a href='<c:url value="/thoat"/>'>--%>
<%--                        <c:url value="/thoat"/> ==>     #--%>
                    <a href='#>'>
                        <i class="ace-icon fa fa-power-off"></i>
                        Thoát
                    </a>
                </li>
                </li>
            </ul>
        </div>
    </div>
</div>
