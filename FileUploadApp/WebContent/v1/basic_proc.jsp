<%@page import="java.io.File"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	ServletContext ctx = getServletContext();
	String path = ctx.getRealPath("upload");
	//out.println(ctx.getRealPath("upload"));
	// D:\\netsong7\\jsp\\EclipseWebApps\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\FileUploadApp\\upload
	int max = 5 * 1024 * 1024;
	
	MultipartRequest multi = 
		new MultipartRequest(request, path, max, "euc-kr", 
							new DefaultFileRenamePolicy());
	
	//out.println(request.getParameter("user"));
	out.println(multi.getParameter("user") + "<br/>");
	out.println(multi.getParameter("title") + "<br/>");
	
	Enumeration enumer = multi.getParameterNames();
	while(enumer.hasMoreElements()){
		String name = (String)enumer.nextElement();
		out.println(multi.getParameter(name) + "<br/>");
	}
	
	enumer = multi.getFileNames();
	while(enumer.hasMoreElements()){
		String name = (String)enumer.nextElement();
		out.println("실제 파일명 : " + multi.getOriginalFileName(name) + "<br/>");
		out.println("저장될 파일명 : " + multi.getFilesystemName(name) + "<br/>");
		out.println("파일 타입 : " + multi.getContentType(name)+ "<br/>");
		
		File f = multi.getFile(name);
		out.println("파일의 크기 : " + f.length() + "byte <br/>");
		out.println("파일의 경로 : " + f.getPath() + " <br/>");
		f.delete();
	}
%>


