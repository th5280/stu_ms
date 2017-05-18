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
<form action="inputGradeSubmit.action?course_id=${courseView.course_id}" method="post">
<table class="bordered" id="course_table">
    <tr class="thread">
    	<th>学生学号</th>
    	<th>学生姓名</th>
        <th>课程编号</th>
        <th>课程名称</th>        
    	<th>平时成绩</th>
    	<th>考试成绩</th>
    	<th>总成绩</th>
    </tr>
<c:forEach items="${studentView_list}" var="stu_view">
  	<tr>
  		<th><input type="text" name="stu_sid" value="${stu_view.stu_sid}" readonly="true"></th>
   		<th>${stu_view.stu_name}</th>
  		<th>${courseView.course_id}</th>
  		<th>${courseView.course_name}</th>
  		<th><input type="text" name="usual_grade"></th>
  		<th><input type="text" name="test_grade"></th>
  		<th><input type="text" name="final_grade"></th>
  	</tr>
</c:forEach>  

</table>
<input type="submit" value="提交">
</form>
<script>
function select_sem(obj)
{
	if(obj.value!=0)
	{
		college_id=obj.value;
		createRequest("getCourseTable.action?");
	}
}

function quit_remind(course_id)
{
	if(confirm('是否删除?'))
	{
		createQuitRequest("quitCourse.action?course_id="+course_id);
	}	
}
</script>
</body>
</html>