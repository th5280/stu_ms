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
				<dt>学生管理</dt>
				<dd><a  href="${pageContext.request.contextPath}/stu/queryStu.action">查询</a></dd>
				<dd><a  href="${pageContext.request.contextPath}/stu/addStu.action">添加</a></dd>
			</dl>
				<dl>
				<dt>教师管理</dt>
				<dd><a href="${pageContext.request.contextPath}/tea/queryTea.action">查询</a></dd>
				<dd><a href="${pageContext.request.contextPath}/tea/addTea.action">添加</a></dd>
			</dl>
				<dl>
				<dt>专业管理</dt>
				<dd><a href="${pageContext.request.contextPath}/major/queryMajor.action">查询</a></dd>
				<dd><a href="${pageContext.request.contextPath}/major/addMajor.action">添加</a></dd>
			</dl>
				<dl>
				<dt>课程管理</dt>
				<dd>查询</dd>
				<dd>添加</dd>
			</dl>
			
		</div>
		
	</div>
</div>
</body>
</html>