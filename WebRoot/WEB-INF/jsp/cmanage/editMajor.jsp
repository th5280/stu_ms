<%@ page language="java" contentType="text/html; charset=utf-8"pageEncoding="utf-8"%>
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
		
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/checkForm.js"></script>
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
<form action="editMajorSubmit.action" method="post" onsubmit="return checkMajorForm(this)">
	<div class="form-group row">
		<div class="col-md-4">
			专业编号：
			<input type="text" name="major_id" value="${major.major_id}"  readonly="true"/>
		</div>
		<div class="col-md-8">
			学&#12288;&#12288;院：
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
		</div>
	</div>
	<div class="form-group row">
		<div class="col-md-4">
			专业名称：
			<input type="text" name="major_name" value="${major.major_name}">
		</div>
		<div class="col-md-8">
			系主任名：
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
	</div>

	<div class="form-group row">
		
		
		
	</div>
	<div class="form-group row">
		
		
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
</script>
	


</body>
</html>