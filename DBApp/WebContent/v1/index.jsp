<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>���� ���� ����Ʈ</h1>
<a href="addSawon.html">��� �߰�</a><br/><br/>
<table border="1">
	<tr>
		<th>ID</th><th>�̸�</th><th>�н�����</th><th>����</th>
		<th>�ٹ���</th><th>�ּ�<th>�μ���</th><th>������ȣ</th>
	</tr>
<%
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	String url = "jdbc:oracle:thin:@192.168.0.29:1521:orcl";
	String id = "scott";
	String pw = "1111";
	
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection(url, id, pw);
		
		String sql = "select * from tblsawon";
		stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		while(rs.next()){
			int s_no = rs.getInt("no");
			String s_id = rs.getString("id");
			String s_name = rs.getString("name");
			String s_pw = rs.getString("pass");
			int s_age = rs.getInt("age");
			String s_addr = rs.getString("addr");
			String s_dept = rs.getString("dept");
			String s_ext = rs.getString("ext");
%>
	<tr>
		<td><%=s_no%></td> <td><%=s_id%></td> <td><%=s_name%></td>
		<td><%=s_pw%></td> <td><%=s_age%></td> <td><%=s_addr%></td>
		<td><%=s_dept%></td> <td><%=s_ext%></td> 
	</tr>
<%
		}
	}
	catch(Exception err){
		System.out.println("index.jsp : " + err);
	}
	finally{
		if(rs != null) try{ rs.close(); } catch(Exception err){}
		if(stmt != null) try{ stmt.close(); } catch(Exception err){}
		if(con != null)	try{ con.close(); } catch(Exception err){}
	}
%>
</table>
</body>
</html>