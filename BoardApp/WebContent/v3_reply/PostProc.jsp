<%@ page contentType="text/html; charset=EUC-KR"%>
<% request.setCharacterEncoding("euc-kr");  %>

<jsp:useBean id="dao" class="mybean.board.BoardDao" />
<jsp:useBean id="dto" class="mybean.board.BoardDto" />
<jsp:setProperty property="*" name="dto"/>

<%
	// setter�޼��� 12���� ȣ���ϴ���
	dao.insertBoard(dto);	
	response.sendRedirect("List.jsp");
%>