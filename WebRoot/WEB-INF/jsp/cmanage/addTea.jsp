<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">  

<title></title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet" type="text/css">
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
<%@ include file="../head.jsp" %>
<%@ include file="../common_side.jsp" %>
<div class="operate">
<form action="addTeaSubmit.action" method="post" style="width:80%;float:left">
	<div>姓&#12288;&#12288;名：<input type="text" name="name" value="${tea.tea_name}"></div>
	<div>性&#12288;&#12288;别：
	<select type="text" name="sex" >
	<option value=1 >男</option>
	<option value=2 >女</option>
	</select>	
	</div><br/>
	<div>身份证号：<input type="text" name="tea_nid" /></div>
	<div>电&#12288;&#12288;话：<input type="text" name="tel" ></div><br/>
	<div>职&#12288;&#12288;称：<input type="text" id="title" name="title" /></div><br/>
	<div>学&#12288;&#12288;院：<select id="college_select" name="college_select" value="${stu.college_name}" onchange="return select_college(this);" style="height:30px;font-size:15px;">
			<option value=0> 选择学院</option >
			<c:forEach items="${college_list}" var="college">
       			<option value=${college.college_id}>${college.college_name}</option>
   	 		</c:forEach>
		</select>
	</div><br/>
	<div>专&#12288;&#12288;业：<select id="major_select" name="major_select" style="height:30px;font-size:15px;"/></div>
	<div><input type="submit" value="提交" width="300px" class="button"  ></div>
</form>		
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