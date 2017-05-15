<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title></title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet" type="text/css">
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
<%@ include file="../head.jsp" %>
<%@ include file="../common_side.jsp" %>
<div class="query">
<div>
	<select id="college_select" name="college_select"  onchange="return select_college(this);">
		<option value=0> 选择学院</option >
		<c:forEach items="${college_list}" var="college">
       		<option value=${college.college_id}>${college.college_name}</option>
   	 	</c:forEach>
	</select>
</div>
	<table class="bordered" id="major_table">
    <tr class="thread">
        <th>专业编号</th>        
        <th>专业名称</th>
        <th>专业人数</th>
        <th>系主任</th>
        <th>操作</th>
    </tr>
</table>
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
	
</div>
</body>
</html>