<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>requestScope.jsp</title>
<jsp:useBean id="req" class="mybean.scope.RequestBean" scope="request">
	<jsp:setProperty name="req" property="header" />
	<jsp:setProperty name="req" property="footer" />
</jsp:useBean>
</head>
<body> 
<jsp:include page="inc/header.jsp" />
<form method="post" action="requestScope.jsp">
	머릿말에 들어갈 내용 : <br/>
	<textarea rows="2" cols="60" name="header"></textarea>
	<br/><br/>
	꼬릿말에 들어갈 내용 : <br/> 
	<textarea rows="2" cols="60" name="footer"></textarea>
	<br/><br/>
	<input type="submit" value="새로 고침" />
</form>
<jsp:include page="inc/footer.jsp" />
</body>
</html>
<!-- 
	class name : mybean.scope.RequestBean
	
	name			r/w				data type
	-------------------------------------------
	header			r/w				String
	footer			r/w				String
 -->