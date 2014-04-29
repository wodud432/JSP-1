// check.js로 저장
/*
	널값 여부 검사
	obj : document.form객체.inputType
	name : 메시지
*/
function isNull(obj, msg){
	if(obj.value == ""){
		alert(msg);
		obj.focus();
		return true;
	}
	else{
		return false;
	}
}

/*
	아이디 검사
	문자, 숫자, _를 허용하는 값을 검사
*/

function isId(obj){
	var data = obj.value;
	
	if(data.length == 0)
		return false;
		
	data = data.toUpperCase();
	
	for(var i=0; i<data.length; i++){
		if(!((data.charAt(i)>="A" && data.charAt(i)<="Z")||
			(data.charAt(i)>="0" && data.charAt(i) <="9")||
			data.charAt(i) == "_")){
			return false;
		}
	}
	
	return true;
}

/*
	이메일 검사
	@, .이 있는지 검사
*/
function isEmail(obj){
	var data = obj.value;
	
	if(data == "")
		return false;
		
	var i = data.indexOf("@");
	if(i < 0){
		return false;
	}
	
	var i = data.indexOf(".");
	if(i < 0){
		return false;
	}
	
	return true;
}

/*
	패스워드와 패스워드 확인 검사
*/
function isSame(obj1, obj2){
	var val1 = obj1.value;
	var val2 = obj2.value;
	
	if(val1.length == 0 || val2.length == 0)
		return false;
		
	if(val1 == val2)
		return true;
		
	return false;
}











