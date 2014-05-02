<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
Connection con = null;
Statement stmt = null;
String url = "jdbc:oracle:thin:@192.168.0.29:1521:orcl";
String id = "scott";
String pw = "1111";

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
	"ext, dept) values(seq_no.nextVal, '" + s_id + "', '" + s_name + 
	"', '" + s_pw + "', " + s_age + ",'" + s_addr + "','" + s_ext + 
	"',	'" + s_dept + "')";
//out.println(sql);

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection(url, id, pw);
	
	stmt = con.createStatement();
	stmt.executeUpdate(sql);
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
	if(stmt != null) try{ stmt.close(); } catch(Exception err){}
	if(con != null)	try{ con.close(); } catch(Exception err){}
}
%>