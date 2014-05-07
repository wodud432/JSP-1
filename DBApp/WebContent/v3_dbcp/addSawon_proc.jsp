<%@page import="mybean.dbcp.DBConnectionMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
Connection con = null;
PreparedStatement stmt = null;
DBConnectionMgr pool = null;

request.setCharacterEncoding("euc-kr");
response.setCharacterEncoding("euc-kr");

String s_id = request.getParameter("s_id");
String s_name = request.getParameter("s_name");
String s_pw = request.getParameter("s_pw");
String s_age = request.getParameter("s_age");
String s_addr = request.getParameter("s_addr");
String s_ext = request.getParameter("s_ext");
String s_dept = request.getParameter("s_dept");

//out.println(s_id + ", " + s_name + ", " + s_pw + ", " + s_age + ", "
//		+ s_addr + ", " + s_ext + ", " + s_dept);

String sql = "insert into tblsawon(no, id, name, pass, age, addr, " +
	"ext, dept) values(seq_no.nextVal,?,?,?,?,?,?,?)";

try{
	pool = DBConnectionMgr.getInstance();
	con = pool.getConnection();
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, s_id);
	stmt.setString(2, s_name);
	stmt.setString(3, s_pw);
	stmt.setString(4, s_age);
	stmt.setString(5, s_addr);
	stmt.setString(6, s_ext);
	stmt.setString(7, s_dept);
	
	stmt.executeUpdate();
%>
	<h2>사원 정보가 잘 추가 되었다.</h2>
	<a href="addSawon.html">입력 화면으로</a><br/>
	<a href="index.jsp">메인 화면으로</a>	
<%
}
catch(Exception err){
	System.out.println("addSawon_proc.jsp : " + err);
}
finally{
	pool.freeConnection(con, stmt);
}
%>