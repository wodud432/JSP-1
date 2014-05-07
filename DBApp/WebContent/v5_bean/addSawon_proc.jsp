<%@ page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="dao" class="mybean.dao.EmpDao" />
<jsp:useBean id="dto" class="mybean.dto.EmpDto" />
<%
request.setCharacterEncoding("euc-kr");
response.setCharacterEncoding("euc-kr");

dto.setId(request.getParameter("s_id"));
dto.setName(request.getParameter("s_name"));
dto.setPass(request.getParameter("s_pw"));
dto.setAge(Integer.parseInt(request.getParameter("s_age")));
dto.setAddr(request.getParameter("s_addr"));
dto.setExt(request.getParameter("s_ext"));
dto.setDept(request.getParameter("s_dept"));

dao.addSawon(dto);
%>
	<h2>사원 정보가 잘 추가 되었다.</h2>
	<a href="addSawon.html">입력 화면으로</a><br/>
	<a href="index.jsp">메인 화면으로</a>	