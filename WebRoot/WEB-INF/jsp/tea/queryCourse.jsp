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
<table class="bordered" id="course_table">
    <tr class="thread">
        <th>课程编号</th>
        <th>课程名称</th>        
        <th>课程性质</th>
        <th>学分</th>
        <th>开课时间</th>
        <th>开课地点</th>
        <th>课程人数</th>
        <th>已选人数</th>
        <th>查看</th>
        <th>操作</th>
    </tr>
<c:forEach items="${courseView_list}" var="course">
  	<tr>
  		<th>${course.course_id}</th>
  		<th>${course.course_name}</th>
  		<th>        
  		<c:choose>
        <c:when test="${course.course_nature==1}">
        	必修课
        </c:when>
        <c:otherwise>
        	选修课
        </c:otherwise>
        </c:choose>
        </th>
  		<th>${course.course_credit}</th>
 		<th>${course.course_time}</th>
 		<th>${course.course_classroom}</th>
  		<th>${course.course_stu_num}</th>
  		<th>${course.course_selection}</th>
  		<th><a href="queryStudentByCourse.action?course_id=${course.course_id}">学生</a>
  		<a href="queryGradeByCourse.action?course_id=${course.course_id}">成绩</a></th>
  		<th><a href="inputGrade.action?course_id=${course.course_id}">录入成绩</a></th>	
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