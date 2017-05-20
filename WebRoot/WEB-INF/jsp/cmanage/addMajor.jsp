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
<script type="text/javascript">
var select_id;

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
function createRequest(url) {
	initial_request();
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
<form action="addMajorSubmit.action" method="post">
	<div class="form-group row">
		<div class="col-md-4">
			专业编号：
			<input type="text" name="major_id"   readonly="true"/>
		</div>
		<div class="col-md-8">
			学&#12288;&#12288;院：
	<select id="college_select" name="college_select" onchange="return select_college(this);" style="height:30px;font-size:15px;">
		<option value=0> 选择学院</option >
		<c:forEach items="${college_list}" var="college">
       		<option value=${college.college_id}>${college.college_name}</option>
   	 	</c:forEach>
	</select>
		</div>
	</div>
	<div class="form-group row">
		<div class="col-md-4">
			专业名称：
			<input type="text" name="major_name" >
		</div>
		<div class="col-md-8">
			系主任名：
	<select id="major_head_select" name="major_head_select" style="height:30px;font-size:15px;">
	<option>选择教师</option>	
	<c:forEach items="${tea_list}" var="tea">
		<option value=${tea.tea_tid} selected="selected">${tea.tea_name}</option>	   
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
		document.getElementById("major_head_select").length=1;
		college_id=obj.value;

		createRequest("getTeaList.action?college_id="+obj.value);
		select_id='major_head_select';
	}

}
</script>
</script>
	


</body>
</html>
