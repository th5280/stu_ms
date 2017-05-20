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

                <a href="message-task.html" class="btn btn-info" title="New Message"><b>30 </b><i class="fa fa-envelope-o fa-2x"></i></a>
                <a href="message-task.html" class="btn btn-primary" title="New Task"><b>40 </b><i class="fa fa-bars fa-2x"></i></a>
                <a href="login.html" class="btn btn-danger" title="Logout"><i class="fa fa-exclamation-circle fa-2x"></i></a>

            </div>
        </nav>
        <!-- /. NAV TOP  -->
        <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
                    <li>
                        <div class="user-img-div">
                            <img src="assets/img/user.png" class="img-thumbnail" />

                            <div class="inner-text">
                                Jhon Deo Alex
                            <br />
                                <small>Last Login : 2 Weeks Ago </small>
                            </div>
                        </div>

                    </li>


                    <li>
                        <a class="active-menu" href="index.html"><i class="fa fa-dashboard "></i>Dashboard</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-desktop "></i>学生管理<span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a  href="${pageContext.request.contextPath}/stu/queryStu.action"><i class="fa fa-toggle-on"></i>查询学生</a>
                            </li>
                            <li>
                                <a  href="${pageContext.request.contextPath}/stu/addStu.action"><i class="fa fa-bell "></i>添加学生</a>
                            </li>
                           
                           
                        </ul>
                    </li>
                     <li>
                        <a href="#"><i class="fa fa-desktop "></i>教师管理<span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/tea/queryTea.action"><i class="fa fa-coffee"></i>查询教师</a>
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/tea/addTea.action"><i class="fa fa-flash "></i>添加教师</a>
                            </li>
                      
                        </ul>
                    </li>
   
                     <li>
                        <a href="#"><i class="fa fa-desktop "></i>课程管理 <span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                           
                             <li>
                                <a href="${pageContext.request.contextPath}/course/queryCourse.action"><i class="fa fa-desktop "></i>查询课程 </a>
                            </li>
                             <li>
                                <a href="${pageContext.request.contextPath}/course/addCourse.action"><i class="fa fa-code "></i>添加课程</a>
                            </li>
                             
                           
                        </ul>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-desktop "></i>专业管理<span class="fa arrow"></span></a>
                         <ul class="nav nav-second-level">
                            <li>
                                <a href="${pageContext.request.contextPath}/major/queryMajor.action"><i class="fa fa-bicycle "></i>查询专业</a>
                            </li>
                             <li>
                                <a href="${pageContext.request.contextPath}/major/addMajor.action"><i class="fa fa-flask "></i>添加专业</a>
                            </li>
                        </ul>
                    </li>
                   
                    <li>
                        <a href="blank.html"><i class="fa fa-square-o "></i>Blank Page</a>
                    </li>
                </ul>

            </div>

        </nav>
</body>
</html>