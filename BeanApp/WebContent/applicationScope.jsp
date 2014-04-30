<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>applicationScope.jsp(과제)</title>
</head>
<body>
<h1>카운터 예제(총 방문자 수)</h1>
<jsp:useBean id="counter" class="mybean.scope.ApplicationBean" />
<jsp:setProperty property="newVisit" name="counter" value="1"/>
<jsp:setProperty property="restart" name="counter"/>

<h2>당신은 이 페이지에 
<jsp:getProperty property="visitCount" name="counter"/>
번째로 방문하셨습니다.</h2>

<form action="applicationScope.jsp" method="post">
	<input type="submit" name="check" value="새로 고침" />
	&nbsp;&nbsp;&nbsp;
	<input type="submit" name="restart" value="카운터 0으로 리셋" />
</form>
</body>
</html>






