<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<title>queryStu</title>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script type="text/javascript" src="js/jquery-1.4.4.min.js"></script>
<script type="text/javascript"  src="js/manage_function.js"></script>
<script type="text/javascript" src="js/AjaxRequest.js"></script>

<link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet" type="text/css">
</head>



<script language="javascript">
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
    http_request.open('POST', url, true);							   //创建与服务器的连接
    http_request.send(null);									   //向服务器发送请求
}
function post()
{
	$.ajax({  
	    type: "POST",  
	    url: "queryStu.action", //orderModifyStatus  
	    data: {"qq":"2927021697"},  
	    dataType:"json",  
	    async:false,  
	    cache:false,  
	    success: function(data){  
	        var member = eval("("+data+")"); //包数据解析为json 格式                                                            
	        if(member.success=="true"){  
	            flag = true;  
	        }else if(member.success=="false") {  
	            alert(member.info);  
	        }  
	    }, 
	    error: function(json){  
            alert("订单取消异常，请刷新后重试...");  
        }  
    });   
}

    
</script>


<body>
<%@ include file="../head.jsp" %>
<%@ include file="../common_side.jsp" %>

<div class="query_stu">
<select  id="college_select" name="myselect" onchange="return select_college(this);">
       <option> 选择学院</option >
       <c:forEach items="${college_list}" var="college">
       		 <option value=${college.college_id }>${college.college_name}</option>
       </c:forEach>
</select>
<select name="major_select">
        <option> 选择专业</option>
      	<c:forEach items="${major_list}" var="major">
       		 <option value=${major.college_id }>${major.college_name}</option>
       </c:forEach>
</select>
<select name="class_select">
        <option> 选择班级</option>
      
</select>
<select name="grade_select">
        <option> 选择年级</option>
</select>

</div>

<table class="bordered">
    

    <tr>
        <th>学号</th>        
        <th>姓名</th>
        <th>身份证号</th>
        <th>性别</th>
        <th>电话</th>
    </tr>
    <c:forEach var="stu" items="${student_list}" >
    <tr>
    	<td>${stu.stu_sid}</td>        
        <td>${stu.stu_name}</td>
		<td>${stu.stu_nid}</td>
		<td>${stu.stu_sex}</td>
		<td>${stu.stu_tel}</td>
    </tr>
    </c:forEach>
</table>

<br><br>

<script type="text/javascript">
function select_college(obj){

	//var selected_val = obj.value;
	
	post();
	//createRequest("queryStu.action");
	
}

</script>
</body>
</html>