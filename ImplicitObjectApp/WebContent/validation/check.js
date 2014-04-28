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



