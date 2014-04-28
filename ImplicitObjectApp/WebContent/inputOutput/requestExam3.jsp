<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>request객체의 Context관련 메서드 테스트</h1>
<%
	Date date = (Date)request.getAttribute("currentDate");
%>
현재 날짜는 <%=date %> 입니다.<br/><br/>
<%
	request.setAttribute("currentDate", new Date());
	date = (Date)request.getAttribute("currentDate");
%>
다시 현재 날짜는 <%=date %> 입니다.<br/><br/>
<%
	request.removeAttribute("currentDate");
	date = (Date)request.getAttribute("currentDate");
%>
또 다시 현재 날짜는 <%=date %> 입니다.<br/><br/>
</body>
</html>


