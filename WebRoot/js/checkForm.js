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
	
	switch (obj.id)
	{
	case "point":
		alert(obj.value);
	}
	return true;
}
function checkGradeInput(obj)
{
	var els = obj.getElementsByTagName("input");
	for (var i = 0; i < els.length; i++) {
		if(!checkGrade(els[i]))
		{
			
			return false;
		}
	}
	return true;
}
function checkGrade(obj)
{
	if(obj.id=="usual_grade"||obj.id=="test_grade"||obj.id=="final_grade")
	{
		if(obj.value=="")
		{
			alert("输入不能有空！");
			return false;
		}
		if(isNaN(obj.value))
		{
			alert("输入数据不合法！");
			obj.value="";
			return false;

		}
		if(obj.value>100||obj.value<0)
		{
			alert("输入数据不合法！");
			obj.value="";
			return false;
		}
	}
	return true;
}