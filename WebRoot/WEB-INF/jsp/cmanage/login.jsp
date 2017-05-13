<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
     <script type="text/javascript" src="js/base_function.js"></script>
  </head>
  <script>
	window.onload=function() {
	
		create_verycode();
	}
</script>
  <body>
  <form id="loginForm" method="post" action="login" onsubmit="return checkForm(this)">
  	<div class="form-group">
    	<label for="" class="">账&nbsp;&nbsp;号：</label> 
		<input id="username" value="" name="" type="text" >
  	</div>
  	<div class="form-group">
  		<label for="" class="">密&nbsp;&nbsp;码：</label> 
		<input id="password" value="" name="" type="text" >
 	 </div>
  	<div  class="form-group">
  		<label for="" class="">验证码：</label> 
		<input id="verycodeinput" value="" name="" type="text" >&nbsp;
		<span id="verycode" style="border:1px solid #0000">  </span>
		
  	</div>
 	<div class="form-group">
		<input id="super" type="radio" name="usertype" value="super">&nbsp;超级管理员
		<input id="common" type="radio" name="usertype" value="common">&nbsp;普通管理员
		<input id="teacher" type="radio" name="usertype" value="teacher">&nbsp;教师
		<input id="student" type="radio" name="usertype" value="student">&nbsp;学生
  	</div>
  	<input type="submit" name="submit" value="立即登录" onclick="this.form.submit()"/>
  </form>
  
  
  </body>
</html>
