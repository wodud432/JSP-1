<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
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
%>
</body>
</html>