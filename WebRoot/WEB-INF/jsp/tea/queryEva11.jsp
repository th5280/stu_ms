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

<%@ include file="tea_side.jsp" %>
<div class="query">
<table class="bordered" id="eva_table">
    <tr class="thread">
        <th>课程编号</th>
        <th>课程名称</th>        
        <th>教师编号</th>
        <th>教师名称</th>
        <th>评分</th>
 
    </tr>
<c:forEach items="${evaResult_list}" var="eva">
  	<tr>
  		<th>${eva.eva_course_id}</th>
  		<th>${eva.course_name}</th>
  		<th>${eva.tea_tid}</th>
  		<th>${eva.tea_name}</th>
  		<th>${eva.avg_point}</th>
  	</tr>
</c:forEach>  

</table>
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