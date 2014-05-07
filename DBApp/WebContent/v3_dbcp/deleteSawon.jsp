<%@page import="mybean.dbcp.DBConnectionMgr"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<%
Connection con = null;
PreparedStatement stmt = null;
DBConnectionMgr pool = null;

String no = request.getParameter("no");
String sql = "delete from tblsawon where no=?";

try{
	pool = DBConnectionMgr.getInstance();
	con = pool.getConnection();
	
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
	pool.freeConnection(con, stmt);
}
%>