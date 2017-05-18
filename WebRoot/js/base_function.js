var rcode;
function checkForm(obj)
{
	
	var els = obj.getElementsByTagName("input");
	for (var i = 0; i < els.length; i++) {
		if(!checkItems(els[i]))
			return false;
		
	}
	return true;
}
function checkItems(obj)
{
	
	switch (obj.id) {
	case "username":
		if (obj.value == "") {
			alert("用户名不能为空!");
			return false;
		}
		break;
	case "password":
		if (obj.value == "") {
			alert("密码不能为空！");	
			return false;
		}
		break;
	case "verycodeinput":
		if (obj.value == "") {
			alert("验证码不能为空！")
			return false;
		}else if(obj.value != rcode) {
			alert("验证码错误！");
			
			return false;
		}
		break;
}
	return true;

}
function create_verycode() {
	

	var str="";
	var img="";
	var strsource=['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
	for(var i=0;i<4;i++){
		var n=Math.floor(Math.random()*strsource.length);
		str=str+strsource[n];
		rcode = str;
		document.getElementById("verycode").innerHTML = str;
	}
}
function test22()
{
	alert("test22");
}