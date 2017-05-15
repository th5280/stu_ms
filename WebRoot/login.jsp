<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <script type="text/javascript" src="js/base_function.js"></script>
<style type="text/css">
body{
	background: #0ca3d2;
	font: 13px/20px 'Lucida Grande', Tahoma, Verdana, sans-serif;
	
}
.container{
  	margin:200px 200px;
    width: 640px;
}
</style>
</head>
 <script>
	window.onload=function() {
	
		create_verycode();
	}
</script>
  <body>
  <section class="container">
    <form id="loginForm" method="post" action="login.action" onsubmit="return checkForm(this)">
  	<div class="form-group">
    	<label for="" class="">账&nbsp;&nbsp;号：</label> 
		<input id="user_id" value="" name="user_id" type="text" >
  	</div>
  	<div class="form-group">
  		<label for="" class="">密&nbsp;&nbsp;码：</label> 
		<input id="password" value="" name="password" type="text" >
 	 </div>
  	<div  class="form-group">
  		<label for="" class="">验证码：</label> 
		<input id="verycodeinput" value="" name="verycodeinput" type="text" >&nbsp;
		<span id="verycode" style="border:1px solid #0000">  </span>	
  	</div>
 	<div class="form-group">
		<input id="super" type="radio" name="usertype" value="1">&nbsp;超级管理员
		<input id="common" type="radio" name="usertype" value="2">&nbsp;普通管理员
		<input id="teacher" type="radio" name="usertype" value="3">&nbsp;教师
		<input id="student" type="radio" name="usertype" value="4">&nbsp;学生
  	</div>
  	<input type="submit" name="submit" value="立即登录"/>
  </form>
</section>
  
  </body>
</html>
