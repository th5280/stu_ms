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
<style type="text/css">

</style>
		
<script type="text/javascript">
var select_id;
var enter_year;
var major_id;
var college_id;
var course_id;
//是几班的
var class_id;

function deleteRow(course_tid)
{
	var table = document.getElementById("course_table");	
	for(var i=0;i<table.rows.length;i++)
	{
		if(table.rows[i].cells[0].innerText==course_tid)
		{
			table.deleteRow(i);
			break;
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

</script>

<script type="text/javascript">

function createSelectRequest(url)
{
	initial_request();

	http_request.onreadystatechange = getSelectResult;					   //调用返回结果处理函数
    
	http_request.open('POST', url, true);							   //创建与服务器的连接
		
    http_request.send(null);	
}
function getSelectResult()
{
	if (http_request.readyState == 4) {     		// 判断请求状态
	      if (http_request.status == 200) {     		// 请求成功，开始处理返回结果
		         deleteRow(http_request.responseText);
	      } else {     						// 请求页面有错误
	          alert("您所请求的页面有错误！");
	      }
	  }
}
</script>
</head>
<body>

<div id="wrapper">
<%@include file="stu_side.jsp"%>
<div id="page-wrapper">
<div class="row">
<div class="col-md-12">
<h1 class="page-head-line">INVOICE</h1>
</div>
</div>
<div class="row">
<div class="col-md-12">
<div>
<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12">
<div class="table-responsive">
<table id="course_table" class="table table-striped table-bordered table-hover">

<thead>
<tr class="thread">
        <th>课程编号</th>
        <th>课程名称</th>        
        <th>课程性质</th>
        <th>学分</th>
        <th>开课时间</th>
        <th>开课地点</th>
        <th>课程人数</th>
        <th>已选人数</th>
        <th>选课</th>
    </tr>
</thead>
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
  		<th><a id="cc" href="javaScript:select_remind(${course.course_id})" >选课</a></th>
  			
  	</tr>
  	</c:forEach>

</table>
</div>
<hr />



</div>
</div>

</div>



<script>
function select_sem(obj)
{
	if(obj.value!=0)
	{
		college_id=obj.value;
		createRequest("getCourseTable.action?");
	}
}

function select_remind(course_id)
{
	if(confirm('是否选择该课程?'))
	{
		createSelectRequest("selectCourse.action?course_id="+course_id);
	}	
}
</script>
</body>
</html>
