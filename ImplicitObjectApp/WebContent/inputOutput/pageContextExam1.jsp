<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>pageContextExam1.jsp</h1>
<%
	pageContext.setAttribute("addr", "서울시 종로구");
	//session.setAttribute("tel", "111-1111"); 과 동일
	pageContext.setAttribute("tel", "111-1111", PageContext.SESSION_SCOPE);
%>
</body>
</html>