<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	if("user1".equals(id) && "1111".equals(pw)){
%>
		<script type="text/javascript">
			alert("login success!");
			location.href="index.jsp";
		</script>
<%
		//response.sendRedirect("index.jsp");
	}
%>
<form method="post" action="login.jsp">
	아이디 : <input type="text" name="id" /><br/><br/>
	패스워드 : <input type="text" name="pw" /><br/><br/>
	<input type="submit" value="로그인" />
</form>
</body>
</html>