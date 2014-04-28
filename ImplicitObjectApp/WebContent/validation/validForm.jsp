<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>입력한 내용 확인</h1>
이름 : <%=request.getParameter("name") %><br/>
아이디 : <%=request.getParameter("id") %><br/>
패스워드 : <%=request.getParameter("pw1") %><br/>
이메일 : <%=request.getParameter("email") %><br/>
</body>
</html>