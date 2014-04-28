<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>pageContextExam2.jsp</h1>
주소 : <%=pageContext.getAttribute("addr")%><br/>
전화번호 : <%=pageContext.getAttribute("tel", 3) %><br/>
<%=session.getAttribute("tel") %>
</body>
</html>