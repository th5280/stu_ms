<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">  

<title></title>
<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet" type="text/css">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
<%@ include file="../head.jsp" %>
<%@ include file="../common_side.jsp" %>
<div class="operate">
<form action="editMajorSubmit.action" method="post">
	<div>专业编号：<input type="text" name="major_id" value="${major.major_id}"  readonly="true"/></div><br/>
	<div>专业名称：<input type="text" name="major_name" value="${major.major_name}"></div><br/>
	<div>系主任名：
	<select id="major_head_select" name="major_head_select" >
			<c:forEach items="${tea_list}" var="tea">
			<c:choose>	
        	<c:when  test="${tea.tea_tid==major.major_head_id}">
        		<option value=${tea.tea_tid} selected="selected">${tea.tea_name}</option>
        	</c:when>
        	<c:otherwise>
				<option value=${tea.tea_tid}>${tea.tea_name}</option>　
			</c:otherwise>  	
        	</c:choose>		
   	 		</c:forEach>
		</select>
	</div>
	<div>学&#12288;&#12288;院：
		<select id="college_select" name="college_select" onchange="return select_college(this);">
			<c:forEach items="${college_list}" var="college">
			<c:choose>	
        	<c:when  test="${college.college_id==major.major_college_id}">
        		<option value=${college.college_id} selected="selected">${college.college_name}</option>
        	</c:when>
        	<c:otherwise>
				<option value=${college.college_id}>${college.college_name}</option>　
			</c:otherwise>  	
        	</c:choose>		
   	 		</c:forEach>
		</select>
	</div><br/>
	<div><input type="submit" value="提交" width="300px" class="button"  ></div>
</form>		
</div>
<script>
function select_college(obj)
{
	if(obj.value!=0)
	{
		document.getElementById("major_select").length=0;
		college_id=obj.value;
		createRequest("getMajorList.action?college_id="+obj.value);
		select_id='major_select';
	}
	
	
}
</script>
</body>
</html>