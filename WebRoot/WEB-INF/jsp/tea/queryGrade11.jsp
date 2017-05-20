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
<table class="bordered" id="grade_table">

 <tr class="thread">
        <th>学生学号</th>        
        <th>学生姓名</th>
        <th>专业</th>
        <th>班级</th>
        <th>平时成绩</th>
        <th>考试成绩</th>
        <th>总成绩</th>     
    </tr>
<c:forEach items="${gradeView_list}" var="grade_view">
<tr>
	<th>${grade_view.stu_sid}</th>
	<th>${grade_view.stu_name}</th>
	<th>${grade_view.major_name}</th>
	<th>${grade_view.stu_class}</th>
	<th>${grade_view.usual_grade}</th>
	<th>${grade_view.test_grade}</th>
	<th>${grade_view.final_grade}</th>
	
</tr>
</c:forEach>   
</table>

</body>
</html>