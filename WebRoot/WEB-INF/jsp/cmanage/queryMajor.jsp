<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Responsive Bootstrap Advance Admin Template</title>
		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<script type="text/javascript" src="/stu_ms/js/manage_function.js"></script>
		<script type="text/javascript" src="/stu_ms/js/jquery-1.4.4.min.js"></script>
		<link href="css/base.css" rel="stylesheet" type="text/css">

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
		<link href="${pageContext.request.contextPath}/css/base.css"
			rel="stylesheet" type="text/css">

<script type="text/javascript">
var college_id;
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
function addTable()
{
	$("#major_table  tr:not(:first)").empty("");
	var table  = document.getElementById("major_table");
	
	objarr=http_request.responseText.split(",");
	
	for(i=0;i<objarr.length;i++)
    {
        arr=objarr[i].split("#");
        var newTR = table.insertRow(document.getElementById("major_table").rows.length);
        for(j=0;j<arr.length;j++)
        {
        	var newNameTD = newTR.insertCell(j);
            newNameTD.innerHTML = arr[j];
        }
    }
}
function deleteRow(major_id)
{
	var table = document.getElementById("major_table");	
	for(var i=0;i<table.rows.length;i++)
	{
		if(table.rows[i].cells[0].innerText==major_id)
		{
			table.deleteRow(i);
			break;
		}
	}
}
function getResult()
{
	if (http_request.readyState == 4) {     		// 判断请求状态
      if (http_request.status == 200) {     		// 请求成功，开始处理返回结果
         addTable();
      } else {     						// 请求页面有错误
          alert("您所请求的页面有错误！");
      }
   }
}
function getDeleteResult()
{
	if (http_request.readyState == 4) {     		// 判断请求状态
	      if (http_request.status == 200) {     		// 请求成功，开始处理返回结果
		         deleteRow(http_request.responseText);
	      } else {     						// 请求页面有错误
	          alert("您所请求的页面有错误！");
	      }
	  }
}
function createRequest(url)
{
	initial_request();
    http_request.onreadystatechange = getResult;					   //调用返回结果处理函数
    
    http_request.open('GET', url, true);							   //创建与服务器的连接
	
    http_request.send(null);		
}
function createDeleteRequest(url)
{
	initial_request();
	
	http_request.onreadystatechange = getDeleteResult;					   //调用返回结果处理函数
    
    http_request.open('GET', url, true);							   //创建与服务器的连接
	
    http_request.send(null);	
}
</script>
</head>
	<body>

<div id="wrapper">

			<!-- /. NAV TOP  -->
<%@include file="common_side.jsp"%>
			<!-- /. NAV SIDE  -->
<div id="page-wrapper">
<div class="row">
<div class="col-md-12">
<h1 class="page-head-line">INVOICE</h1>
</div>
</div>
<div class="row">
<div class="col-md-12">
<div>
<div class="query">
<select id="college_select" name="college_select"  onchange="return select_college(this);">
		<option value=0> 选择学院</option >
		<c:forEach items="${college_list}" var="college">
       		<option value=${college.college_id}>${college.college_name}</option>
   	 	</c:forEach>
	</select>
</div>
<div class="row">
	<div class="col-lg-12 col-md-12 col-sm-12">
		<div class="table-responsive">
<table id="major_table" class="table table-striped table-bordered table-hover">
<thead>
<tr class="thread">
      <th>专业编号</th>        
      <th>专业名称</th>
      <th>专业人数</th>
      <th>系主任</th>
      <th>操作</th>
</tr>

</thead>										
</table>
</div>
<hr /></div>
</div>

</div>
<script src="assets/js/jquery-1.10.2.js"></script>
<script src="assets/js/bootstrap.js"></script>
<script src="assets/js/jquery.metisMenu.js"></script>
<script src="assets/js/custom.js"></script>

<script type="text/javascript">
function select_college(obj)
{

	if(obj.value!=0)
	{
		college_id=obj.value;
		createRequest("getMajorTable.action?college_id="+obj.value);
	}
}
function delete_remind(major_id)
{
	if(confirm('是否删除?'))
	{
		createDeleteRequest("deleteMajor.action?major_id="+major_id);
	}	
}
</script>
	</body>
</html>
