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

String no = request.getParameter("no");
String s_id = request.getParameter("s_id");
String s_name = request.getParameter("s_name");
String s_pw = request.getParameter("s_pw");
String s_age = request.getParameter("s_age");
String s_addr = request.getParameter("s_addr");
String s_ext = request.getParameter("s_ext");
String s_dept = request.getParameter("s_dept");

String sql = "update tblsawon set id='" + s_id + "', name='" + s_name
	+ "', pass='" + s_pw + "', age=" + s_age + ", addr='" + s_addr
	+ "', ext='" + s_ext + "', dept='" + s_dept + "' where no=" + no;
//out.println(sql);

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection(url, id, pw);
	
	stmt = con.createStatement();
	stmt.executeUpdate(sql);
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