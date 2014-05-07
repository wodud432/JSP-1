<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
	response.setCharacterEncoding("euc-kr");
%>
<jsp:useBean id="dao" class="mybean.dao.EmpDao" />
<jsp:useBean id="dto" class="mybean.dto.EmpDto" />
<jsp:setProperty property="*" name="dto"/>
<%
	dao.modifySawon(dto);
%>
	<h2>사원 정보가 잘 수정 되었다.</h2>
	<a href="index.jsp">메인 화면으로</a>	