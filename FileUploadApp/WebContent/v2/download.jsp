<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");

	String path = request.getParameter("path");
	String name = request.getParameter("name");
	
	String realPath = getServletContext().getRealPath(path);
	
	//response.setContentType("Application/x-msdownload");
	response.setContentType("Application/octet-stream");
	response.setHeader("Content-Disposition", "attachment;filename="+name);
	
	//File file = new File(realPath + "/" + name);
	File file = new File(realPath + "/" + new String(name.getBytes("8859_1"), "euc-kr"));
	byte[] data = new byte[1024];
	
	//if(file.isFile()){
		try{
			BufferedInputStream bis = 
				new BufferedInputStream(new FileInputStream(file));
			
			BufferedOutputStream bos = 
				new BufferedOutputStream(response.getOutputStream());
			
			int read = bis.read(data);
			System.out.println(read);
			while(read != -1){
				bos.write(data, 0, read);
				read = bis.read(data);
			}
			bos.flush();
			bos.close();
			bis.close();
		}
		catch(Exception err){
			err.printStackTrace();
		}
	//}
%>







