/**
 * 添加修改学生
 * 应用界面：cmanage/addStu.jsp,cmanage/editStu.jsp
 * 检查学生信息是否正确
 * */
function checkStuForm(obj)
{
	var els = obj.getElementsByTagName("input");
	for (var i = 0; i < els.length; i++) {
		if(!checkStuItems(els[i]))
			return false;
		
	}
	var selects = obj.getElementsByTagName("select");
	for (var i = 0; i < selects.length; i++) {
		if(selects[i].value==0)
		{
			var index = selects[i].selectedIndex;
			alert(selects[i].options[index].text);
			return false;
		}
	}
	return true;
}
function checkStuItems(obj)
{
	var re=/^[0-9]*[1-9][0-9]*$/;
	var nidRe=/^[0-9][0-9]*([0-9]|x)$/;

	switch(obj.name)
	{

	case "name":
		if(obj.value=="")
		{
			alert("学生姓名不能为空！");
			return false;
		}
		break;
	case "stu_nid":
		if(obj.value.length!=18||!nidRe.test(obj.value))
		{
			alert("身份证号错误！");
			return false;
		}
		break;
	case "enter_year":
		if(obj.value.length!=4||!re.test(obj.value))
		{
			alert("入学年份错误！");
			return false;
		}
		break;
	case "class":
		if(!re.test(obj.value))
		{
			alert("班级输入错误");
			return false;
		}
		break;
	case "password":
		if(obj.value.length<6)
		{
			alert("密码长度不能少于六位！");
			return false;
		}
		break;
	}
	return true;
}
/**
 * 添加修改教师数据校验
 * 
 * 
 * */
function checkTeaForm(obj)
{
	
	var els = obj.getElementsByTagName("input");
	for (var i = 0; i < els.length; i++) {
		if(!checkTeaItems(els[i]))
			return false;
		
	}
	
	var selects = obj.getElementsByTagName("select");
	for (var i = 0; i < selects.length; i++) {
		if(selects[i].value==0)
		{
			var index = selects[i].selectedIndex;
			alert(selects[i].options[index].text);
			return false;
		}
	}
	return true;
}
function checkTeaItems(obj)
{

	var re=/^[0-9]+$/;
	var nidRe=/^[0-9][0-9]*([0-9]|x)$/;
	switch(obj.name)
	{
	case "tea_nid":
		if(obj.value.length!=18||!nidRe.test(obj.value))
		{
			alert("身份证号错误！");
			return false;
		}
		break;
	case "name":
		if(obj.value=="")
		{
			alert("教师姓名不能为空！");
			return false;
		}
		break;
	case "title":
		if(obj.value=="")
		{
			alert("职称不能为空！");
			return false;
		}
		break;
	
	case "tel":
		if(obj.value=="")
		{
			alert("电话不能为空！");
			return false;
		}
		else if(!re.test(obj.value))
		{
			
			alert("电话号码错误！");
			return false;
		}
		break;
	case "password":
		if(obj.value.length<6)
		{
			alert("密码长度不能少于六位！");
			return false;
		}
		break;
	}
	return true;
}
/**
 * 添加修改专业校验
 * */
function checkMajorForm(obj)

{
	
	var els = obj.getElementsByTagName("input");
	for (var i = 0; i < els.length; i++) {
		if(!checkMajorItems(els[i]))
			return false;
		
	}
	
	var selects = obj.getElementsByTagName("select");
	for (var i = 0; i < selects.length; i++) {
		if(selects[i].value==0)
		{
			var index = selects[i].selectedIndex;
			alert(selects[i].options[index].text);
			return false;
		}
	}
	return true;
}
function checkMajorItems(obj)
{
	switch(obj.name)
	{
	case "major_name":
		if(obj.value=="")
		{
			alert("专业名不能为空！");
			return false;
		}
	}
	return true;
	
}
/**
 * 课程添加修改信息校验
 * 
 * 
 * */
function checkCourseForm(obj)
{

	var els = obj.getElementsByTagName("input");
	for (var i = 0; i < els.length; i++) {
		if(!checkCourseItems(els[i]))
			return false;
		
	}
	
	var selects = obj.getElementsByTagName("select");
	

	for (var i = 0; i < selects.length; i++) {
		if(selects[i].value==0)
		{
			var index = selects[i].selectedIndex;
			alert(selects[i].options[index].text);
			return false;
		}
	}
	return true;
}
function checkCourseItems(obj)
{
	var timeRe=/^第(一|二|三|四|无|六|七|八)学期[1-9][0-9]*~[1-9][0-9]*周周(一|二|三|四|五|六|七)[1-9][0-9]*~[1-9][0-9]*节$/;
	var re=/^[0-9]+$/;
	switch(obj.name)
	{
		case "course_name":
			if(obj.value=="")
			{
				alert("课程名称不能为空!");
				return false;
				
			}
			break;
		case "course_credit":
		
			if(obj.value==""){
				alert("学分不能为空！");
				return false;
			}
			else if(!re.test(obj.value))
			{
				
				alert("学分必须为数字！");
				return false;
			}
			break;

		case "course_classroom":
			if(obj.value=="")
			{
				alert("课程地点不能为空！");
				return false;
				
			}
			break;
		case "course_time":
			if(!timeRe.test(obj.value))
			{
				alert("课程时间错误！");
				return false;
			}
			break;

		case "course_stu_num":
		if(obj.value=="")
		{
			alert("课程人数不能为空！");
			return false;
		}
		else if(!re.test(obj.value))
		{
			alert("课程人数输入错误！");
			return false;
		}
		break;

		case "course_selection":
		if(obj.value=="")
		{
			alert("选课人数不能为空！");
			return false;
		}
		else if(!re.test(obj.value))
		{
			alert("选课人数输入错误！");
			return false;
		}
		break;

	}
	return true;
}
/**
 * 学生评课
 * 应用界面：stu/evaCourse.jsp
 * 检查课程评分输入
 * */

function checkEvaForm(obj)
{
	var els = obj.getElementsByTagName("input");
	for (var i = 0; i < els.length; i++) {
		if(!checkEvaItems(els[i]))
			return false;
		
	}
	return true;
}
function checkEvaItems(obj)
{
	
	var re=/^[0-9]+$/;
	switch (obj.id)
	{
	case "point":
		if(!re.test(obj.value))
		{
			alert("评分数据错误，请输入1~10的整数！");
			return false;
		}
	}
	return true;
}
/**
 * 用户添加校验
 * 
 * */
function checkUserForm(obj)
{
	var els = obj.getElementsByTagName("input");
	for (var i = 0; i < els.length; i++) {
		if(!checkUserItems(els[i]))
			return false;		
	}
	return true;
}
function checkUserItems(obj)
{
	switch(obj.name)
	{
	case "password":
	
		if(obj.value=="")
		{
			alert("密码不能为空！");
			return false;
		}
		else if(obj.value.length<6)
		{
			alert("密码至少六位！");
			return false;
		}
		break;
	case "user_id":
		if(isNaN(obj.value))
		{
			alert("管理员id只能为数字");
			return false;
		}
		else if(obj.value=="")
		{
			alert("管理员id不能为空！");
			return false;
		}
		break;
	}
	return true;
}
/**
 * 专业信息校验
 * 
 * */
function checkMajorForm(obj)
{
	var els = obj.getElementsByTagName("input");
	for (var i = 0; i < els.length; i++) {
		if(!checkMajorItems(els[i]))
			return false;		
	}
	
	var selects = obj.getElementsByTagName("select");
	for (var i = 0; i < selects.length; i++) {
		if(selects[i].value==0)
		{
			var index = selects[i].selectedIndex;
			alert(selects[i].options[index].text);
			return false;
		}
	}
	return true;
}
function checkMajorItems(obj)
{
	switch(obj.name)
	{
	case "major_name":
		if(obj.value=="")
		{
			alert("专业名称不能为空");
			return false;
		}
		break;
	
	}
	return true;
}
/**
 * 学生成绩管理
 * 应用界面：tea/inputStu.jsp
 * 检查成绩录入是否合格
 * */
function checkGradeInput(obj)
{
	
	
	var els = obj.getElementsByTagName("input");

	for (var i = 0; i < els.length; i++) {
		
		if(!checkGradeItems(els[i]))
		{
			return false;
		}
		
			
		
		
	}
	return false;
}


function checkGradeItems(obj)
{
	
	var re=/^[0-9]+$/;
	if(obj.name=="usual_grade"||obj.name=="test_grade"||obj.name=="final_grade")
	{
		if(obj.value=="")
		{
			alert("输入不能为空");
			return false;
		}
		else if(!re.test(obj.value))
		{
			alert("输入数据不合法！");
			obj.value="";
			return false;
		}
		else if(obj.value>100||obj.value<0)
		{
			alert("输入数据不合法！");
			obj.value="";
			return false;
		}	
	}
	return true;
}
/**
 * 用户id和密码校验
 * 
 * */
function checkUserForm(obj)
{
	var els = obj.getElementsByTagName("input");
	for (var i = 0; i < els.length; i++) {
		if(!checkUserItems(els[i]))
		{
			return false;
		}
	}
	return true;
}
function checkUserItems(obj)
{
	var re=/^[0-9]+$/;

	switch(obj.name)
	{
	case "user_id":
		
		if(obj.value.length<6)
		{
			alert("用户id长度不得少于六位！");
			return false;
		}
		else if(!re.test(obj.value))
		{
			alert("用户id只能为数字！");
			return false;
		}
		break;
	case "password":

		if(obj.value.length<6)
		{
			alert("密码长度不得少于六位！");
			return false;
		}
	}
	return true;
}