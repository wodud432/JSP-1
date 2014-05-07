<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
Connection con = null;
PreparedStatement stmt = null;
String url = "jdbc:oracle:thin:@192.168.0.29:1521:orcl";
String id = "scott";
String pw = "1111";

request.setCharacterEncoding("euc-kr");
response.setCharacterEncoding("euc-kr");

String no = request.getParameter("no");
String s_id = request.getParameter("s_id");
String s_name = request.getParameter("s_name");
String s_pw = request.getParameter("s_pw");
String s_age = request.getParameter("s_age");
String s_addr = request.getParameter("s_addr");
String s_ext = request.getParameter("s_ext");
String s_dept = request.getParameter("s_dept");

String sql = "update tblsawon set id=?, name=? , pass=?, age=?" 
	+ ", addr=?, ext=?, dept=? where no=?";

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection(url, id, pw);
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, s_id);
	stmt.setString(2, s_name);
	stmt.setString(3, s_pw);
	stmt.setString(4, s_age);
	stmt.setString(5, s_addr);
	stmt.setString(6, s_ext);
	stmt.setString(7, s_dept);
	stmt.setString(8, no);
	
	stmt.executeUpdate();
%>
	<h2>사원 정보가 잘 수정 되었다.</h2>
	<a href="index.jsp">메인 화면으로</a>	
<%
}
catch(Exception err){
	System.out.println("editSawon_proc.jsp : " + err);
}
finally{
	if(stmt != null) try{ stmt.close(); } catch(Exception err){}
	if(con != null)	try{ con.close(); } catch(Exception err){}
}
%>