<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<link href="css/base.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.side-block a{
	text-decoration:none;
	color:black;
	}
</style>
</head>
<body>
<div class="side">
	<div class="side-bar">
		<div class="side-block">
			<dl>
				<dt>课程管理</dt>
				<dd><a href="${pageContext.request.contextPath}/tea/queryCourse.action">查询</a></dd>
				<dd>选课</dd>
				<dd><a href="${pageContext.request.contextPath}/tea/queryEva.action">查看评课</a></dd>
				<dd>查看成绩</dd>
			</dl>
		</div>
		
	</div>
</div>
</body>
</html>