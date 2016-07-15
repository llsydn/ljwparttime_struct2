 //用户名校验
function checkname(name){
	var checkname=document.getElementById('checkname');
	var reg=/^[a-zA-Z]\w{5,20}$/;  //用户必须以字母开头
	if (!reg.test(name)) {
		checkname.innerHTML="<font color='red'>字母开头,并且是6位以上</font>";
	}else{
		checkname.innerHTML="<font color='red'>ok</font>";
	}
}
//密码校验
function checkpassword(password){
	var checkpsw1=document.getElementById('checkpsw1');
	//alert(name);
	var reg=/^\w{6,40}$/;  //密码必须在6位以上
	if (!reg.test(password)) {
		checkpsw1.innerHTML="<font color='red'>密码必须在6位以上</font>";
	}else{
		checkpsw1.innerHTML="<font color='red'>ok</font>";
	}
}
//确认密码
function checkpassword2(password){
	var checkpsw2=document.getElementById('checkpsw2');
	//alert(password);
	var checkpsw1=document.getElementById('psw').value;
	//alert(psd);
	if (checkpsw1!=password) {  //两次密码必须一致
		checkpsw2.innerHTML="<font color='red'>密码必须一致</font>";
	}else{
		checkpsw2.innerHTML="<font color='red'>ok</font>";
	}
}
//一点击后，按钮变灰,防止表单重复提交
function dosubmit(){
	var  submit=document.getElementById("submit");
	submit.disabled="disable";
	return true;
}
