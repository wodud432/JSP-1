<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="basic" class="mybean.upload.basic.BasicBean" />

<%
	basic.setPath(request, "upload");
	basic.setMax(5*1024*1024);
	basic.setEncType("euc-kr");
	basic.setMulti(request);
%>
����� : <jsp:getProperty property="user" name="basic"/><br/>
���� : <jsp:getProperty property="title" name="basic"/><br/>
<br/>
���� ���� :<br/>
<jsp:getProperty property="upFile" name="basic"/>
