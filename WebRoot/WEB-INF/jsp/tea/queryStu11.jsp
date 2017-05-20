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
<%@ include file="tea_side.jsp" %>
<div class="query">
<table class="bordered" id="stu_table">

 <tr class="thread">
        <th>学号</th>        
        <th>姓名</th>
        <th>学院</th>
        <th>专业</th>
        <th>班级</th>
        
    </tr>
<c:forEach items="${studentView_list}" var="stu_view">
<tr>
	<th>${stu_view.stu_sid}</th>
	<th>${stu_view.stu_name}</th>
	<th>${stu_view.college_name}</th>
	<th>${stu_view.major_name}</th>
	<th>${stu_view.stu_class}</th>
	
</tr>
</c:forEach>   
</table>

</body>
</html>