<%@page import="mybean.dto.EmpDto"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
<script type="text/javascript">
	function delCheck(no){
		var result = confirm("정말 삭제하시겠습니까?");
		if(result == true){
			location.href="deleteSawon.jsp?no=" + no;
		}
	}
</script>
</head>
<body>
<h1>직원 정보 리스트</h1>
<a href="addSawon.html">사원 추가</a><br/><br/>
<form method="post" action="index.jsp">
	<select name="search">
		<option value="id">id</option>
		<option value="addr">근무지</option>
		<option value="dept">부서</option>
		<option value="ext">내선번호</option>
	</select>
	<input type="text" name="searchText" />
	<input type="submit" value="검색" />
</form><br/>
<table border="1">
	<tr>
		<th>사번</th><th>ID</th><th>이름</th><th>패스워드</th><th>나이</th>
		<th>근무지</th><th>부서명</th><th>내선번호</th>
		<th>수정</th><th>삭제</th>
	</tr>
<%
	request.setCharacterEncoding("euc-kr");
	String search = request.getParameter("search");
	String searchText = request.getParameter("searchText");
%>

<jsp:useBean id="dao" class="mybean.dao.EmpDao" />

<%
	List list = dao.getList(search, searchText);
	for(int i=0; i<list.size(); i++){
		EmpDto dto = (EmpDto)list.get(i);
%>
	<tr>
		<td><%=dto.getNo()%></td> <td><%=dto.getId()%></td> 
		<td><%=dto.getName()%></td> <td><%=dto.getPass()%></td> 
		<td><%=dto.getAge()%></td> <td><%=dto.getAddr()%></td>
		<td><%=dto.getDept()%></td> <td><%=dto.getExt()%></td> 
		<td><a href="editSawon.jsp?no=<%=dto.getNo()%>">수정</a></td>
		<td><a href="javascript:delCheck(<%=dto.getNo()%>)">삭제</a></td>
	</tr>
<%
	}
%>
</table>
</body>
</html>