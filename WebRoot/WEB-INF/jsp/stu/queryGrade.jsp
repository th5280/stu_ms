<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>Responsive Bootstrap Advance Admin Template</title>
		<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

		<script type="text/javascript" src="/stu_ms/js/manage_function.js"></script>
		<script type="text/javascript" src="/stu_ms/js/jquery-1.4.4.min.js"></script>
		<link href="css/base.css" rel="stylesheet" type="text/css">

		

</head>
<body>

<div id="wrapper">
<%@include file="stu_side.jsp"%>
<div id="page-wrapper">
<div class="row">
<div class="col-md-12">
<h1 class="page-head-line">INVOICE</h1>
</div>
</div>
<div class="row">
<div class="col-md-12">
<div>
<div class="row">
<div class="col-lg-12 col-md-12 col-sm-12">
<div class="table-responsive">
<table id="grade_table" class="table table-striped table-bordered table-hover">

<thead>
<tr class="thread">
        <th>课程编号</th>
        <th>课程名称</th>        
        <th>平时成绩</th>
        <th>考试成绩</th>
        <th>总成绩</th>
    </tr>
</thead>
<tbody>
  	<c:forEach items="${gradeView_list}" var="gradeView">
  	<tr>
  		<th>${gradeView.course_id}</th>
  		<th>${gradeView.course_name}</th>
 		<th>${gradeView.usual_grade}</th>
 		<th>${gradeView.test_grade}</th>
  		<th>${gradeView.final_grade}</th>			
  	</tr>
  	</c:forEach>
</tbody>
</table>
</div>
<hr />



</div>
</div>

</div>

<!-- /. FOOTER  -->
<!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
<!-- JQUERY SCRIPTS -->
<script src="assets/js/jquery-1.10.2.js"></script>
<!-- BOOTSTRAP SCRIPTS -->
<script src="assets/js/bootstrap.js"></script>
<!-- METISMENU SCRIPTS -->
<script src="assets/js/jquery.metisMenu.js"></script>
<!-- CUSTOM SCRIPTS -->
<script src="assets/js/custom.js"></script>


</body>
</html>
