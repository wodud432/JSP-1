<%@ page contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<h1>오라클 연결 테스트</h1>
<%
	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url = "jdbc:oracle:thin:@192.168.0.29:1521:orcl";
		Connection con = 
			DriverManager.getConnection(url, "scott", "1111");
		if(con != null){
			out.println("연결 성공");
		}
	}
	catch(Exception err){
		System.out.println("연결 실패 : " + err);
	}
%>
</body>
</html>