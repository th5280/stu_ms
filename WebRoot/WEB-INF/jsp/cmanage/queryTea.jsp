<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<title>queryStu</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript"  src="/stu_ms/js/manage_function.js"></script>
<script type="text/javascript"  src="/stu_ms/js/jquery-1.4.4.min.js"></script>

<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
var select_id;
var college_id;
var major_id;
function addTable()
{
	var table  = document.getElementById("tea_table");
	objarr=http_request.responseText.split(",");
	for(i=0;i<objarr.length;i++)
    {
        arr=objarr[i].split("#");
        var newTR = table.insertRow(table.rows.length);
        for(j=0;j<arr.length;j++)
        {
        	var newNameTD = newTR.insertCell(j);
            newNameTD.innerHTML = arr[j];
        }
    }
}
function deleteRow(tea_id)
{
	var table = document.getElementById("tea_table");	
	for(var i=0;i<table.rows.length;i++)
	{
		if(table.rows[i].cells[0].innerText==tea_id)
		{
			table.deleteRow(i);
			break;
		}
	}
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


<div class="query">
<select  id="college_select" name="myselect" onchange="return select_college(this);">
      <option value=0> 选择学院</option >
		<c:forEach items="${college_list}" var="college">
       		<option value=${college.college_id}>${college.college_name}</option>
   	 	</c:forEach>
</select>
<select id="major_select" onchange="return select_major(this)">
        <option value=0>选择专业</option>
</select>

</div>
<table class="bordered" id="tea_table">
    <tr>
        <th>教职工号</th>        
        <th>姓名</th>
        <th>身份证号</th>
        <th>性别</th>
        <th>学院</th>
        <th>专业</th>
        <th>职称</th>
        <th>电话</th>
        <th>操作</th>
    </tr>
</table>

<br><br>

<script>
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
function select_major(obj)
{
	if(obj.value!=0)
	{
		major_id=obj.value;
		createTableRequest("getTeaTable.action?major_id="+major_id);
	}
	
}

function delete_remind(tea_id)
{
	if(confirm('是否删除?'))
	{
		createDeleteRequest("deleteTea.action?tea_tid="+tea_id);
	}	
}
</script>
</body>
</html>