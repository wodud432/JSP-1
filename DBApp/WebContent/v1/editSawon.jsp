<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@192.168.0.29:1521:orcl";
	String id = "scott";
	String pw = "1111";
	
	String no = request.getParameter("no");
	String s_id = null;
	String s_name = null;
	String s_pw = null;
	int s_age = 0;
	String s_addr = null;
	String s_dept = null;
	String s_ext = null;
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url, id, pw);
		
		String sql = "select * from tblsawon where no=" + no;
		stmt = con.createStatement();
		
		rs = stmt.executeQuery(sql);
		if(rs.next()){
			s_id = rs.getString("id");
			s_name = rs.getString("name");
			s_pw = rs.getString("pass");
			s_age = rs.getInt("age");
			s_addr = rs.getString("addr");
			s_dept = rs.getString("dept");
			s_ext = rs.getString("ext");
		}
	}
	catch(Exception err){
		System.out.println("editSawon.jsp : " + err);
	}
	finally{
		if(rs != null) try{ rs.close(); } catch(Exception err){}
		if(stmt != null) try{ stmt.close(); } catch(Exception err){}
		if(con != null)	try{ con.close(); } catch(Exception err){}
	}
%>
<h1>사원 정보 수정</h1>
<form method="post" action="editSawon_proc.jsp">
<input type="hidden" name="no" value="<%=no%>" />
<table border="1">
	<tr>
		<td>아이디 : </td> <td><input type="text" name="s_id" value="<%=s_id%>"/></td>
	</tr>
	<tr>
		<td>이름 : </td> <td><input type="text" name="s_name" value="<%=s_name%>"/></td>
	</tr>
	<tr>
		<td>나이 : </td> <td><input type="text" name="s_age" value="<%=s_age%>"/></td>
	</tr>
	<tr>
		<td>패스워드 : </td> <td><input type="text" name="s_pw" value="<%=s_pw%>"/></td>
	</tr>
	<tr>
		<td>근무지 : </td> 
		<td>
			<select name="s_addr">
				<option value="서울" <%if(s_addr.equals("서울")){%> selected="true" <%}%>>서울</option>
				<option value="광주" <%if(s_addr.equals("광주")){%> selected="true" <%}%>>광주</option>
				<option value="부산" <%if(s_addr.equals("부산")){%> selected="true" <%}%>>부산</option>
				<option value="경기" <%if(s_addr.equals("경기")){%> selected="true" <%}%>>경기</option>
			</select>
		</td>
	</tr>
	<tr>
		<td>내선 번호 : </td> <td><input type="text" name="s_ext" value="<%=s_ext%>"/></td>
	</tr>
	<tr>
		<td>부서명 : </td> 
		<td>
			<select name="s_dept">
				<option value="영업" <%if(s_dept.equals("영업")){%> selected="true" <%}%>>영업</option>
				<option value="기술" <%if(s_dept.equals("기술")){%> selected="true" <%}%>>기술</option>
				<option value="기획" <%if(s_dept.equals("기획")){%> selected="true" <%}%>>기획</option>
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