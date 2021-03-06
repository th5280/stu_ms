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
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/checkForm.js"></script>
		
		<!--CUSTOM MAIN STYLES-->
		<link href="${pageContext.request.contextPath}/assets/css/custom.css"
			rel="stylesheet" />
			<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
var college_id;
var select_id;
function addOption(option_id)
{
	
	objarr=http_request.responseText.split(",");
    document.getElementById(option_id).length=0; 
    for(i=0;i<objarr.length;i++)
    {
        arr=objarr[i].split("#");
 	    var obj=document.getElementById(option_id); 
        obj.options.add(new Option(arr[1],arr[0])); //这个兼容IE与firefox
    }
}
function createRequest(url) {
    http_request = false;
    if (window.XMLHttpRequest) {    							   // 非IE浏览器
        http_request = new XMLHttpRequest();	                      //创建XMLHttpRequest对象
    } else if (window.ActiveXObject) {     						   // IE浏览器
        try {
            http_request = new ActiveXObject("Msxml2.XMLHTTP");	   //创建XMLHttpRequest对象
        } catch (e) {
            try {
                http_request = new ActiveXObject("Microsoft.XMLHTTP");  //创建XMLHttpRequest对象
           } catch (e) {}
        }
    }
    if (!http_request) {
        alert("不能创建XMLHttpRequest对象实例！");
        return false;
    }
    http_request.onreadystatechange = getResult;					   //调用返回结果处理函数
    
    http_request.open('GET', url, true);							   //创建与服务器的连接
	
    http_request.send(null);									   //向服务器发送请求
}

function getResult() {
    if (http_request.readyState == 4) {     		// 判断请求状态
        if (http_request.status == 200) {     		// 请求成功，开始处理返回结果
           addOption(select_id);
        } else {     						// 请求页面有错误
            alert("您所请求的页面有错误！");
        }
    }
}

</script>
</head>
<body>
<div id="wrapper">
<%@ include file="common_side.jsp"%>
			
<div id="page-wrapper">
<div id="page-inner">
<div class="row">
	<div class="col-md-12">
		<h1 class="page-head-line">
			Grid System
		</h1>
		<h1 class="page-subhead-line">
			This is dummy text , you can replace it with your original text.
		</h1>
	</div>
</div>
					
<div class="row">
<div class="col-md-12">
<form action="editTeaSubmit.action" method="post" onsubmit="return checkTeaForm(this)">
	<div class="form-group row">
		<div class="col-md-4">
			&#12288;姓名：&#12288;&#12288;
			<input type="text" name="name" value="${tea.tea_name}">
		</div>
		<div class="col-md-8">
			性别：
		<select type="text" name="sex" 
	value="<c:choose><c:when test='${tea.tea_sex==1}'>男</c:when><c:otherwise>女</c:otherwise></c:choose>">
	<c:choose>
		<c:when test="${tea.tea_sex==1}">
			<option value=1 selected="selected">男</option>
			<option value=2 >女</option>
		</c:when>
		<c:otherwise>
			<option value=1>男</option>
			<option value=2 selected="selected">女</option>
		</c:otherwise>
	</c:choose>
	
	</select>
		</div>
	</div>
	<div class="form-group row">
		<div class="col-md-4">
			&#12288;身份证号：
			<input type="text" name="tea_nid" value="${tea.tea_nid}"/>
		</div>
		<div class="col-md-8">
			电话：
			<input type="text" name="tel" value="${tea.tea_tel}">
		</div>
	</div>

	<div class="form-group row">
		<div class="col-md-4">								
			&#12288;教职工号:&#12288;<input type="text" name="tea_tid" value="${tea.tea_tid}"  readonly="true"/>
		</div>
		<div class="col-md-8">
			学院：
			<select id="college_select" name="college_select" onchange="return select_college(this);">
				<c:forEach items="${college_list}" var="college">
				<c:choose>
        		<c:when  test="${college.college_id==tea.tea_college_id}">
        			<option value=${college.college_id} selected="selected">${college.college_name}</option>
        		</c:when>
        		<c:otherwise>
					<option value=${college.college_id}>${college.college_name}</option>　
				</c:otherwise>  	
        		</c:choose>
   	 			</c:forEach>
			</select>
		</div>
	</div>
	<div class="form-group row">
		<div class="col-md-4">
		&#12288;&#12288;职称：&#12288;
		<input type="text" id="title" name="title" value="${tea.tea_title}"/>
		</div>
		<div class="col-md-8">
			专业：
		<select id="major_select" name="major_select">
        	<c:forEach items="${major_list}" var="major">
        		<c:choose>
        			<c:when  test="${major.major_id==tea.tea_major_id}">
        				<option value=${major.major_id} selected="selected">${major.major_name}</option>
        			</c:when>
        			<c:otherwise>
        				<option value=${major.major_id}>${major.major_name}</option>
　					</c:otherwise>  	
        		</c:choose>
        	</c:forEach>
		</select>
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
