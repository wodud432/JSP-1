<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
Connection con = null;
PreparedStatement stmt = null;
String url = "jdbc:oracle:thin:@192.168.0.29:1521:orcl";
String id = "scott";
String pw = "1111";

String no = request.getParameter("no");
String sql = "delete from tblsawon where no=?";

try{
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con = DriverManager.getConnection(url, id, pw);
	
	stmt = con.prepareStatement(sql);
	stmt.setString(1, no);
	
	stmt.executeUpdate();
%>
	<script type="text/javascript">
		alert("삭제 되었습니다.");
		location.href="index.jsp";
	</script>
<%
}
catch(Exception err){
	System.out.println("deleteSawon_proc.jsp : " + err);
}
finally{
	if(stmt != null) try{ stmt.close(); } catch(Exception err){}
	if(con != null)	try{ con.close(); } catch(Exception err){}
}
%>