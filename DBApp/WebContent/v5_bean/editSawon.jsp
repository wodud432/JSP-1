<%@page import="mybean.dto.EmpDto"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="dao" class="mybean.dao.EmpDao" />
<%
	int no = Integer.parseInt(request.getParameter("no"));
	EmpDto dto = dao.getSawon(no);
%>
<h1>사원 정보 수정</h1>
<form method="post" action="editSawon_proc.jsp">
<input type="hidden" name="no" value="<%=no%>" />
<table border="1">
	<tr>
		<td>아이디 : </td> <td><input type="text" name="id" value="<%=dto.getId()%>"/></td>
	</tr>
	<tr>
		<td>이름 : </td> <td><input type="text" name="name" value="<%=dto.getName()%>"/></td>
	</tr>
	<tr>
		<td>나이 : </td> <td><input type="text" name="age" value="<%=dto.getAge()%>"/></td>
	</tr>
	<tr>
		<td>패스워드 : </td> <td><input type="text" name="pass" value="<%=dto.getPass()%>"/></td>
	</tr>
	<tr>
		<td>근무지 : </td> 
		<td>
			<select name="addr">
				<option value="서울" <%if(dto.getAddr().equals("서울")){%> selected="true" <%}%>>서울</option>
				<option value="광주" <%if(dto.getAddr().equals("광주")){%> selected="true" <%}%>>광주</option>
				<option value="부산" <%if(dto.getAddr().equals("부산")){%> selected="true" <%}%>>부산</option>
				<option value="경기" <%if(dto.getAddr().equals("경기")){%> selected="true" <%}%>>경기</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>내선 번호 : </td> <td><input type="text" name="ext" value="<%=dto.getExt()%>"/></td>
	</tr>
	<tr>
		<td>부서명 : </td> 
		<td>
			<select name="dept">
				<option value="영업" <%if(dto.getDept().equals("영업")){%> selected="true" <%}%>>영업</option>
				<option value="기술" <%if(dto.getDept().equals("기술")){%> selected="true" <%}%>>기술</option>
				<option value="기획" <%if(dto.getDept().equals("기획")){%> selected="true" <%}%>>기획</option>
			</select>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" value="추가" />&nbsp;&nbsp;&nbsp;
			<input type="reset" value="다시 작성" />
		</td>
	</tr>
</table>
</form>
</body>
</html>