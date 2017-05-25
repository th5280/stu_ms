<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title>Responsive Bootstrap Advance Admin Template</title>
	<!-- BOOTSTRAP STYLES-->
	<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" />
	<!-- FONTAWESOME STYLES-->
	<link href="${pageContext.request.contextPath}/assets/css/font-awesome.css" rel="stylesheet" />
	<!--CUSTOM BASIC STYLES-->
	<link href="${pageContext.request.contextPath}/assets/css/basic.css" rel="stylesheet" />
	<!--CUSTOM MAIN STYLES-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/checkForm.js"></script>
	
	<link href="${pageContext.request.contextPath}/assets/css/custom.css"
<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet" type="text/css">
</head>
<script type="text/javascript">
var select_id;
var college_id;
function addOption(option_id)
{
	objarr=http_request.responseText.split(",");
    document.getElementById(option_id).length=1; 
    for(i=0;i<objarr.length;i++)
    {
        arr=objarr[i].split("#");
 	    var obj=document.getElementById(option_id); 
        obj.options.add(new Option(arr[1],arr[0])); //这个兼容IE与firefox
    }
}
function getResult()
{
	if (http_request.readyState == 4) {     		// 判断请求状态
        if (http_request.status == 200) {     		// 请求成功，开始处理返回结果
           addOption(select_id);
        } else {     						// 请求页面有错误
            alert("您所请求的页面有错误！");
        }
    }
}
function initial_request()
{
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
    return http_request;
}
function createRequest(url) {
	initial_request();
    http_request.onreadystatechange = getResult;					   //调用返回结果处理函数
    
    http_request.open('GET', url, true);							   //创建与服务器的连接
	
    http_request.send(null);									   //向服务器发送请求
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
			添加教师
		</h1>
		<h1 class="page-subhead-line">
			
		</h1>
	</div>
</div>
					
<div class="row">
<div class="col-md-12">
<form action="addTeaSubmit.action" method="post" onsubmit="return checkTeaForm(this)">
	<div class="form-group row">
		<div class="col-md-4">
			&#12288;姓名：&#12288;&#12288;
			<input type="text" name="name" >
		</div>
		<div class="col-md-8">
			性别：
		<select type="text" name="sex" >
			<option value=1 >男</option>
			<option value=2 >女</option>
		</select>	
		</div>
	</div>
	<div class="form-group row">
		<div class="col-md-4">
			&#12288;身份证号：
			<input type="text" name="tea_nid" />
		</div>
		<div class="col-md-8">
			电话：
			<input type="text" name="tel" >
		</div>
	</div>

	<div class="form-group row">
		<div class="col-md-4">	
		&#12288;&#12288;职称：&#12288;
		<input type="text" id="title" name="title"/>							
		</div>
		<div class="col-md-8">
			学院：
			<select id="college_select" name="college_select" value="${stu.college_name}" onchange="return select_college(this);" style="height:30px;font-size:15px;">
			<option value=0> 选择学院</option >
			<c:forEach items="${college_list}" var="college">
       			<option value=${college.college_id}>${college.college_name}</option>
   	 		</c:forEach>
		</select>
		</div>
	</div>
	<div class="form-group row">
		<div class="col-md-4">
		&#12288;&#12288;专业：&#12288;
		<select id="major_select" name="major_select" style="height:30px;font-size:15px;">
			        <option value=0>选择专业</option>
		</select>
		</div>
	<div class="col-md-8">
		密码:&nbsp;<input id="password" name="password" type="text"/>
	</div>
		</div>
	</div><br/>
	
	<div class="form-group row">
		<div class="col-md-4">
		</div>
		<div class="col-md-4">
		</div>
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
<script type="text/javascript">
function select_college(obj)
{
	if(obj.value!=0)
	{
		document.getElementById("major_select").length=1;
		college_id=obj.value;
		createRequest("getMajorList.action?college_id="+obj.value);
		select_id='major_select';
	}
}
</script>
</body>
</html>
