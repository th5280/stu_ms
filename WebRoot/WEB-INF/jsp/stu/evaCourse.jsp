<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet" type="text/css">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.4.4.min.js"></script>

</head>


</script>
<body>
<%@ include file="../head.jsp" %>
<%@ include file="stu_side.jsp" %>
<div class="query">
<form action="evaCourseSubmit.action" method="post">
<table class="bordered" id="course_table">
<tr class="thread">
        <th>课程编号</th>
        <th>课程名称</th>        
        <th>课程教师</th>
        <th>打分（1-10）</th>
</tr>

<c:forEach items="${courseView_list}" var="course_view">
<tr>
<th><input type="text" name="course_id" value="${course_view.course_id}" readonly="true"></th>
<th>${course_view.course_name}</th>
<th>${course_view.tea_name}</th>
<th><input type="text" name="point"/></th>
</tr>
</c:forEach>
</table>
<input type="submit" value="提交">
</form>
</body>
</html>