<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
<script type="text/javascript">
	function fnElementChk(f){
		//var cnt = document.forms[0].add.value;
		var cnt = f.elements.length;
		var paramIndex = 1;
		for(var i=0; i<cnt; i++){
			if(f.elements[i].type == "file"){
				if(f.elements[i].value == ""){
					alert(paramIndex + "��° ĭ�� ����ֽ��ϴ�.\n����� �Է��ض�.");
					f.elements[i].focus();
					return;
				}
				paramIndex++;
			}
		}	
		f.submit();
	}
	
	function fnAddInput(){
		var cnt = document.forms[0].add.value;
		var div = document.getElementById("inputDiv");
		div.innerHTML = "";
		
		for(var i=0; i<cnt; i++){
			var str = "<input type='file' name='upFile" + i + "'/><br/>";
			div.innerHTML += str;
		}
	}
</script>
</head>
<body>
<h1>���� ���� ���ε�</h1>
<form method="post" action="multiFile_proc.jsp" enctype="multipart/form-data">
<table width="60%" border="1">
<tr>
	<td>�����</td>
	<td><input type="text" name="user" /></td>
	<td>����</td>
	<td><input type="text" name="title" /></td>
</tr>
<tr>
	<td>�ϰ� ���� �� :</td>
	<td colspan="3"><textarea rows="3" cols="70" name="note"></textarea></td>
</tr>
<tr>
	<td colspan="4">
		�߰��� ���� �� �Է� : <input type="text" name="add"/>&nbsp;&nbsp;
		<input type="button" value="Ȯ��" onclick="fnAddInput()"/> 
	</td>
</tr>
</table>
<table border="1">
<tr>
	<td>
		<div id="inputDiv"></div>
	</td>
	<td><input type="button" value="���ε�" onclick="fnElementChk(this.form)"/></td>
</tr>
</table>
</form>
</body>
</html>