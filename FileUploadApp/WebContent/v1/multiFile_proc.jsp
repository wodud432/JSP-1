<%@page import="java.util.Enumeration"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	ServletContext ctx = getServletContext();
	String path = ctx.getRealPath("upload");
	int max = 5 * 1024 * 1024;
	
	MultipartRequest multi = 
		new MultipartRequest(request, path, max, "euc-kr", 
							new DefaultFileRenamePolicy());
	
	String user = multi.getParameter("user");
	String title = multi.getParameter("title");
	String note = multi.getParameter("note").replace("\n", "<br/>");
	
	ArrayList saveFiles = new ArrayList();
	ArrayList originFiles = new ArrayList();
	
	Enumeration enumer = multi.getFileNames();
	while(enumer.hasMoreElements()){
		String name = (String)enumer.nextElement();
		saveFiles.add(multi.getFilesystemName(name));
		originFiles.add(multi.getOriginalFileName(name));
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
사용자 : <%=user%><br/>
제목 : <%=title %><br/>
하고 싶은 말 :<br/>
<%=note%>
<hr/>
<% for(int i=0; i<saveFiles.size(); i++){ %>
	<a href="download.jsp?path=upload&name=<%=saveFiles.get(i)%>"><%= originFiles.get(i) %></a><br/>
<% } %>
</body>
</html>