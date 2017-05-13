<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">  

<title></title>
<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet" type="text/css">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">

var select_id;
var enter_year;
var major_id;
var college_id;
//是几班的
var class_id;
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

function deleteRow(stu_id)
{
	var table = document.getElementById("course_table");	
	for(var i=0;i<table.rows.length;i++)
	{
		if(table.rows[i].cells[0].innerText==stu_id)
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
function getTable()
{
	 if (http_request.readyState == 4) {     		// 判断请求状态
	        if (http_request.status == 200) {     		// 请求成功，开始处理返回结果
	           addTable();
	        } else {     						// 请求页面有错误
	            alert("您所请求的页面有错误！");
	        }
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
function createTableRequest(url)
{
	initial_request();
		
	http_request.onreadystatechange = getTable;					   //调用返回结果处理函数
	    
	http_request.open('POST', url, true);							   //创建与服务器的连接
		
    http_request.send(null);							
}
function createDeleteRequest(url)
{
	initial_request();

	http_request.onreadystatechange = getDeleteResult;					   //调用返回结果处理函数
    
	http_request.open('POST', url, true);							   //创建与服务器的连接
		
    http_request.send(null);	
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
</script>
</head>
<body>
<%@ include file="../head.jsp" %>
<%@ include file="../common_side.jsp" %>
<div class="operate">
<form action="addCourseSubmit.action" method="post">
	<div>课程名称：<input type="text" name="course_name" /></div><br/>
	<div>学分：<input type="text" name="course_credit" ></div><br/>
	<div>学&#12288;&#12288;院：
		<select id="college_select" name="college_select"  onchange="return select_college(this);">
			<option value=0> 选择学院</option >
			<c:forEach items="${college_list}" var="college">
       			<option value=${college.college_id}>${college.college_name}</option>
   	 		</c:forEach>
		</select>
	</div>
	<div>专&#12288;&#12288;业：
		<select id="major_select" name="major_select" onchange="return select_major(this);">
        	<option value=0>选择专业</option>        	
		</select>
	</div>
	<div>
	教&#12288;&#12288;师：
	<select id="tea_select" name="tea_select" onchange="return select_tea(this)">
		<option value=0>选择教师</option>
	</select>
	</div>
	<div>
	课程性质：
	<select id="nature_select" name="nature_select">
		<option value=0>选择课程性质</option>
		<option value=1>必修课</option>
		<option value=2>选修课</option>
	</select>
	</div>
	<div>开课时间：<input type="text" name="course_time" /></div><br/>
	<div>开课地点：<input type="text" name="course_classroom" /></div><br/>
	<div>课程人数：<input type="text" name="course_stu_num" /></div><br/>
	<div>已选课人数：<input type="text" name="course_selection" ></div>
	<div><input type="submit" value="提交" width="300px" class="button"  ></div>
</form>		
</div>
<script>
function select_college(obj)
{
	if(obj.value!=0)
	{
		document.getElementById("major_select").length=1;
		document.getElementById("tea_select").length=1;
		college_id=obj.value;
		createRequest("getMajorList.action?college_id="+obj.value);
		select_id='major_select';
	}

}
function select_major(obj)
{
	if(obj.value!=0)
	{
		major_id=obj.value;
		document.getElementById("tea_select").length=1;
		select_id='tea_select';
		createRequest("getTeaList.action?major_id="+obj.value);
	}	
}
function delete_remind(stu_id)
{
	if(confirm('是否删除?'))
	{
		createDeleteRequest("deleteCourse.action?course_id="+stu_id);
	}	
}
</script>
</body>
</html>