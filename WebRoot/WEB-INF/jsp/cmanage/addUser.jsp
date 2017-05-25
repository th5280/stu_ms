<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Responsive Bootstrap Advance Admin Template</title>

		<!-- BOOTSTRAP STYLES-->
		<link
			href="${pageContext.request.contextPath}/assets/css/bootstrap.css"
			rel="stylesheet" />
		<!-- FONTAWESOME STYLES-->
		<link
			href="${pageContext.request.contextPath}/assets/css/font-awesome.css"
			rel="stylesheet" />
		<!--CUSTOM BASIC STYLES-->
		<link href="${pageContext.request.contextPath}/assets/css/basic.css"
			rel="stylesheet" />
		<!--CUSTOM MAIN STYLES-->
		<link href="${pageContext.request.contextPath}/assets/css/custom.css"
			rel="stylesheet" />
		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/checkForm.js"></script>
		
</head>
<body>
<div id="wrapper">
<%@ include file="common_side.jsp"%>
			
<div id="page-wrapper">
<div id="page-inner">
<div class="row">
	<div class="col-md-12">
		<h1 class="page-head-line">
			添加用户
		</h1>
		<h1 class="page-subhead-line">
			用户id只能为整数
		</h1>
	</div>
</div>
					
<div class="row">
<div class="col-md-12">
<form action="addUserSubmit.action" method="post" onsubmit="return checkUserForm(this)">
	<div class="form-group row">
		<div class="col-md-4">
			用户id：
			<input type="text" name="user_id" value="${user_id}" readonly="true"/>
		</div>
		<div class="col-md-8">
			用户密码：
			<input type="text" name="password" />
		</div>
	</div>
	<div class="form-group row">
	<div class="col-md-4">
		用户类型:&nbsp;<select id="select_type" name="select_type" style="height:30px;" readonly="true">
			<c:choose>
				<c:when test="${type==3}">
					<option value="3" selected="selected">教师</option>
				</c:when>
				<c:otherwise>
					<option value="4"  selected="selected">学生</option>	
				</c:otherwise>
			</c:choose>
				
			</select>
	</div>
	</div>
	</div>
	<div class="form-group row">
	<div class="col-md-2"></div>
	<div class="col-md-4">
		<input type="submit" value="提交"/>
	</div>
	</div>
</div>
</form>
</div>
</div>

</div>
	
</div>
	
</div>

	


</body>
</html>
