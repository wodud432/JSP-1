<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>simpleBean.jsp</title>
</head>
<body>
<jsp:useBean id="s1" class="mybean.SimpleBean" />
<jsp:setProperty property="message" name="s1" value="정말 간단한 빈"/>
Message : <jsp:getProperty property="message" name="s1"/>
<hr/>
<%
	mybean.SimpleBean s2 = new mybean.SimpleBean();
	s2.setMessage("스크립트릿을 이용한 메서드 호출");
	s1.setMessage("action tag로 만든 인스턴스로 호출");
%>
Message : <%=s2.getMessage() %><br/>
Message : <%=s1.getMessage() %>
</body>
</html>



