<%@ page contentType="text/html; charset=EUC-KR"%>
[머릿말]<br/>
<!-- bean에 저장된 데이터를 가져다 출력 -->
<jsp:useBean id="req" class="mybean.scope.RequestBean" scope="request"/>
<jsp:getProperty property="header" name="req"/>
<hr/>