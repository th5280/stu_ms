<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title></title>
<link href="css/base.css" rel="stylesheet" type="text/css">

</head>
<body>
<%@ include file="head.jsp" %>
<%@ include file="common_side.jsp" %>
<div class="addstu">
<form action="">
	<div>姓&#12288;&#12288;名：<input type="text" ></div><br/>
	<div>性&#12288;&#12288;别：<input type="text"></div><br/>
	<div>出生年份：<input type="text"></div><br/>
	<div>电&#12288;&#12288;话：<input type="text"></div><br/>
	<div>入学年份：<input type="text" id="year"></div><br/>
	<div>学&#12288;&#12288;院：<input type="text"></div><br/>
	<div>专&#12288;&#12288;业：<input type="text"></div><br/>
	<div>班&#12288;&#12288;级：<input type="text"></div>
	<div><input type="button" value="添加" width="300px" class="button"  ></div>
</form>		
</div>
</body>
</html>