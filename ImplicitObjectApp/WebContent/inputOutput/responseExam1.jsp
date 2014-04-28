<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>response객체를 이용한 페이지 이동</h1>
1. 다른 웹사이트로의 이동<br/>
<%
	//response.sendRedirect("http://www.naver.com");
%>
2. 다른 페이지로 이동<br/>
<%
	//response.sendRedirect("requestExam1.html");
%>
3. 선택에 따른 페이지 이동
<%
	//http://localhost:8080/ImplicitObjectApp/inputOutput/responseExam1.jsp?val=ok
	String val = request.getParameter("val");
	if(val == null || val.isEmpty()){
		response.sendRedirect("http://apache.org");
	}
	else{
		response.sendRedirect("requestExam1.html");
	}
%>
</body>
</html>





