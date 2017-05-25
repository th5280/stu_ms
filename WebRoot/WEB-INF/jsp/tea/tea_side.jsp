<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<link href="css/base.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.side-block a{
	text-decoration:none;
	color:black;
	}
</style>
 <script src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS -->
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.metisMenu.js"></script>
       <!-- CUSTOM SCRIPTS -->
    <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>
	<!-- BOOTSTRAP STYLES-->
		<link
			href="${pageContext.request.contextPath}/assets/css/bootstrap.css"
			rel="stylesheet" />
		<!-- FONTAWESOME STYLES-->
		<link
			href="${pageContext.request.contextPath}/assets/css/font-awesome.css"
			rel="stylesheet" />
		<!--CUSTOM BASIC STYLES-->
		<link href="${pageContext.request.contextPath}/assets/css/basic.css"
			rel="stylesheet" />
		<!--CUSTOM MAIN STYLES-->
		<link href="${pageContext.request.contextPath}/assets/css/custom.css"
			rel="stylesheet" />
		<link href="${pageContext.request.contextPath}/css/base.css"
			rel="stylesheet" type="text/css">
	
</head>
<body>
<nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">学生成绩管理系统</a>
            </div>

             <div class="header-right">

                
                <a href="${pageContext.request.contextPath}/logout.action" class="btn btn-danger" title="Logout"><i class="fa fa-exclamation-circle fa-2x"></i></a>

            </div>
        </nav>
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li>
                        <div class="user-img-div">
                            <img src="${pageContext.request.contextPath}/assets/img/user.png" class="img-thumbnail" />

                            <div class="inner-text">
                                ${sessionScope.user.user_id}
                            <br />
                                <small>身份：教师</small>
                            </div>
                        </div>

                    </li>

                    <li>
                        <a href="#"><i class="fa fa-desktop "></i>课程管理<span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/tea_course/queryCourse.action"><i class="fa fa-toggle-on"></i>查询课程</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/tea_course/queryEva.action"><i class="fa fa-bell "></i>查看评课</a>
                            </li>
                             
                        </ul>
                    </li>
                         
                </ul>

            </div>

        </nav>
</body>
</html>