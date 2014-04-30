<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>세션을 이용한 타이머 예제</h1>
<jsp:useBean id="timer" class="mybean.scope.SessionBean" scope="session"> 
	세션 시작입니다. 타이머 작동을 시작합니다.
</jsp:useBean>
<br/><br/>

bean의 property를 마지막으로 접근한 뒤에 경과한 시간은
<jsp:getProperty property="elapsedTimeAfterLastAccess" name="timer"/>
초 입니다.<br/><br/>

<jsp:setProperty property="restart" name="timer"/>

타이머 리셋한 뒤에 경과된 시간은
<jsp:getProperty property="elapsedTime" name="timer"/><br/><br/>

타이머가 시작된 뒤에 경과된 시간은
<jsp:getProperty property="elapsedTimeAfterInst" name="timer"/>
초 입니다.<br/><br/>

<form action="sessionScope.jsp" method="post">
	<input type="submit" name="check" value="경과시간 확인" />
	&nbsp;&nbsp;&nbsp;
	<input type="submit" name="restart" value="타이머 리셋" />
</form>
</body>
</html>
<!-- 
	name						r/w		data type		desc
	------------------------------------------------------------------
	elapsedTime					r		long		타이머 리셋 후 경과 시간
	restart						w		boolean		타이머 리셋
	elapsedTimeAfterInst		r		long		객체 생성 후 경과시간
	elapsedTimeAfterLastAccess	r		long		마지막 접근 후 경과시간
 -->





