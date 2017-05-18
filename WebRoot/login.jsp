<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <title>Login Form</title>
      <script type="text/javascript" src="js/base_function.js"></script>
  
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login_style.css" type="text/css">
</head>
 <script>
	window.onload=function() {
	
		create_verycode();
	}
</script>
<body>
  <section class="container">
    <div class="login">
      <h1>系统登录</h1>
    <form id="loginForm" method="post" action="login.action" onsubmit="return checkForm(this)">
        <p>
        	账号：
		<input id="user_id"  name="user_id" type="text"  placeholder="账号"></p>
        <p>
        	密码：
		<input id="password" value="" name="password" type="text" placeholder="密码"></p>
		<p>
		验证码
		<input id="verycodeinput" value="" name="verycodeinput" type="text" placeholder="验证码">&nbsp;
		<span id="verycode" style="border:1px solid #0000">  </span></p>
		<p></p>
        <p class="select_type">
        <input id="super" type="radio" name="usertype" value="1">&nbsp;超级管理员
		<input id="common" type="radio" name="usertype" value="2">&nbsp;普通管理员
		<input id="teacher" type="radio" name="usertype" value="3">&nbsp;教师
		<input id="student" type="radio" name="usertype" value="4">&nbsp;学生
        </p>
        <p class="submit"><input type="submit" name="submit" value="立即登录"/>
        </p>
      </form>
    </div>

</body>
</html>
