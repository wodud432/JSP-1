<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="basic" class="mybean.upload.basic.BasicBean" />

<%
	basic.setPath(request, "upload");
	basic.setMax(5*1024*1024);
	basic.setEncType("euc-kr");
	basic.setMulti(request);
%>
사용자 : <jsp:getProperty property="user" name="basic"/><br/>
제목 : <jsp:getProperty property="title" name="basic"/><br/>
<br/>
파일 정보 :<br/>
<jsp:getProperty property="upFile" name="basic"/>
