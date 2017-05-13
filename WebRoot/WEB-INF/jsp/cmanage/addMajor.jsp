<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title></title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet" type="text/css">
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
<%@ include file="../head.jsp" %>
<%@ include file="../common_side.jsp" %>
<div class="operate">
<form action="addMajorSubmit.action" class="operate" method="post">
<div>专业名称：<input type="text" name="major_name" ></div>
<div>学&#12288;&#12288;院：
	<select id="college_select" name="college_select" onchange="return select_college(this);" style="height:30px;font-size:15px;">
		<option value=0> 选择学院</option >
		<c:forEach items="${college_list}" var="college">
       		<option value=${college.college_id}>${college.college_name}</option>
   	 	</c:forEach>
	</select>
</div>
<div>系主任名：
	<select id="major_head_select" name="major_head_select" style="height:30px;font-size:15px;">
	<option>选择教师</option>	
	<c:forEach items="${tea_list}" var="tea">
		<option value=${tea.tea_tid} selected="selected">${tea.tea_name}</option>	   
	</c:forEach>
	</select>
	</div>
<div><input type="submit" value="添加" width="300px" class="button"  ></div>
</form>		
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
</body>
</html>