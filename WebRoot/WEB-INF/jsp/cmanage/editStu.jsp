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
var college_id;
var select_id;
function addOption(option_id)
{
	 alert(option_id);
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
           alert("返回成功");
           alert(http_request.responseText);
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
<form action="editStuSubmit.action" method="post">
	<div>学&#12288;&#12288;号：<input type="text" name="stu_sid" value="${stu.stu_sid}"  readonly="true"/></div><br/>
	<div>姓&#12288;&#12288;名：<input type="text" name="name" value="${stu.stu_name}"></div><br/>
	<div>性&#12288;&#12288;别：
	<select type="text" name="sex" 
	value="<c:choose><c:when test='${stu.stu_sex==1}'>男</c:when><c:otherwise>女</c:otherwise></c:choose>">
	<c:choose>
		<c:when test="${stu.stu_sex==1}">
			<option value=1 selected="selected">男</option>
			<option value=2 >女</option>
		</c:when>
		<c:otherwise>
			<option value=1>男</option>
			<option value=2 selected="selected">女</option>
		</c:otherwise>
	</c:choose>
	
	</select>
	
	</div><br/>
	<div>身份证号：<input type="text" name="stu_nid" value="${stu.stu_nid}"/></div>
	<div>电&#12288;&#12288;话：<input type="text" name="tel" value="${stu.stu_tel}"></div><br/>
	<div>入学年份：<input type="text" id="enter_year" name="enter_year" value="${stu.stu_enter_year}"/></div><br/>
	<div>学&#12288;&#12288;院：
		<select id="college_select" name="college_select" onchange="return select_college(this);">
			<c:forEach items="${college_list}" var="college">
			<c:choose>
			
        	<c:when  test="${college.college_id==stu.stu_college_id}">
        		<option value=${college.college_id} selected="selected">${college.college_name}</option>
        	</c:when>
        	<c:otherwise>
				<option value=${college.college_id}>${college.college_name}</option>　
			</c:otherwise>  	
        	</c:choose>
       			
   	 		</c:forEach>
		</select>
	</div><br/>
	<div>专&#12288;&#12288;业：
		<select id="major_select" name="major_select">
        	<c:forEach items="${major_list}" var="major">
        		<c:choose>
        			<c:when  test="${major.major_id==stu.stu_major_id}">
        				<option value=${major.major_id} selected="selected">${major.major_name}</option>
        			</c:when>
        			<c:otherwise>
        				<option value=${major.major_id}>${major.major_name}</option>
　					</c:otherwise>  	
        		</c:choose>
        	</c:forEach>
		</select>
	</div><br/>
	<div>班&#12288;&#12288;级：<input type="text" name="class" value="${stu.stu_class}"></div>
	<div><input type="submit" value="提交" width="300px" class="button"  ></div>
</form>		
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
</body>
</html>