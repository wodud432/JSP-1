<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<% if(request.getMethod().equals("GET")){ %>
	<form method="post" action="requestExam2.jsp">
		이름 : <input type="text" name="irum" /><br/><br/>
		주소 : <input type="text" name="addr" /><br/><br/>
		당신의 취미 : <br/>
		<input type="checkbox" name="hobby" value="낚시" />낚시<br/>
		<input type="checkbox" name="hobby" value="등산" />등산<br/>
		<input type="checkbox" name="hobby" value="독서" />독서<br/><br/>
		<input type="submit" value="전송" /> 
	</form>
<% 
	} // if close 
	else{
%>
	<h1>당신이 보내준 데이터는 다음과 같습니다.</h1>
	<%
		request.setCharacterEncoding("euc-kr");
		String name = request.getParameter("irum");
		String addr = request.getParameter("addr");
	%>
	
	이름 : <%= name %><br/>
	주소 : <%= addr %><br/><br/>

	<%
		String[] hobbies = request.getParameterValues("hobby");
		if(hobbies != null){
			for(String s : hobbies){
	%>
				<li><%=s%></li>
	<%
			}
		}
	}// else close
	%>
</body>
</html>