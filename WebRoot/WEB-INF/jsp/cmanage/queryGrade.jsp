<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"><html>
<head>
<title>queryStu</title>
<link href="css/base.css" rel="stylesheet" type="text/css">
<script type="text/javascript"  src="/stu_ms/js/jquery-1.4.4.min.js"></script>

</head>
<body>
<%@ include file="../head.jsp" %>
<%@ include file="../common_side.jsp" %>
<div class="query_stu">
<select >
        <option> 选择学院</option>
        <option> 10 per page</option>
        <option> 10 per page</option>
        <option> 10 per page</option>
        <option> 5 per page</option>
</select>
<select >
        <option> 选择专业</option>
        <option> 10 per page</option>
        <option> 10 per page</option>
        <option> 10 per page</option>
        <option> 5 per page</option>
</select>
<select >
        <option> 选择班级</option>
        <option> 10 per page</option>
        <option> 10 per page</option>
        <option> 10 per page</option>
        <option> 5 per page</option>
</select>

</div>

<table class="bordered">
    

        <tr class="thread">
        <th>学号</th>        
        <th>姓名</th>
        <th>身份证号</th>
        <th>性别</th>
        <th>电话</th>
        <th>出生年份</th>
    </tr>
    
    <tr>
        <td>1</td>        
        <td>The Shawshank Redemption</td>
		<td>1994</td>
		<td>1994</td>
		<td>1994</td>
        <td>1994</td>
    </tr>        
    <tr>
        <td>2</td>         
        <td>The Godfather</td>
        <td>1972</td>
        <td>1994</td>
        <td>1972</td>
        <td>1972</td>
    </tr>
    <tr>

        <td>3</td>         
        <td>The Godfather: Part II</td>
        <td>1974</td>
        <td>1994</td>
        <td>1972</td>
        <td>1972</td>
    </tr>    
    <tr>
        <td>4</td> 
        <td>The Good, the Bad and the Ugly</td>
        <td>1966</td>
        <td>1994</td>
        <td>1994</td>
		<td>1972</td>
    </tr>
    <tr>
        <td>5</td> 
        <td>Pulp Fiction</td>
        <td>1994</td>
        <td>1994</td>
        <td>1972</td>
        <td>1972</td>
    </tr>
    <tr>
        <td>6</td> 
        <td>12 Angry Men</td>
		<td>1972</td>
		<td>1994</td>
        <td>1957</td>
        <td>1972</td>
    </tr>
    <tr>
        <td>7</td> 
        <td>Schindler's List</td>
        <td>1993</td>
        <td>1994</td>
        <td>1972</td>
        <td>1972</td>
    </tr>    
    <tr>
		
        <td>8</td> 
        <td>1972</td>
        <td>One Flew Over the Cuckoo's Nest</td>
        <td>1975</td>
        <td>1972</td>
        <td>1994</td>
    </tr>
    <tr>
        <td>9</td> 
        <td>The Dark Knight</td>
		<td>1972</td>
		<td>1994</td>
        <td>2008</td>
        <td>1972</td>
    </tr>
    <tr>
        <td>10</td> 
        <td>The Lord of the Rings: The Return of the King</td>
        <td>2003</td>
        <td>1994</td>
        <td>1972</td>
        <td>1972</td>
    </tr> 

</table>

<br><br>


</body>
</html>