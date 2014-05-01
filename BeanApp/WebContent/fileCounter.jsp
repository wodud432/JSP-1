<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.io.BufferedReader"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
</head>
<body>
<%!
	int counter;
	BufferedReader br;
	PrintWriter pw;
	
	public void jspInit(){
		try{
			String path = getServletContext().getRealPath("/");
			//System.out.println(path);
			br = new BufferedReader(new FileReader(path + "\\counter.txt"));
			String cnt = br.readLine();
			
			if(cnt != null){
				counter = Integer.parseInt(cnt);
			}
			else{
				counter = 0;
			}
		}
		catch(Exception err){
			System.out.println("카운터값 가져오려다 실패 : " + err);
		}
		finally{
			if(br != null)
				try { br.close(); } catch(Exception err){};
		}
	}
	
	public void saveCounter(){
		try{
			pw = new PrintWriter(getServletContext().getRealPath("/") + "\\counter.txt");
			pw.println(counter);
		}
		catch(Exception err){
			System.out.println("카운터값 저장하려다 실패 : " + err);
		}
		finally{
			if(pw != null)
				try { pw.close(); } catch(Exception err){};
		}
	}
	
	public void jspDestroy(){
		saveCounter();
	}
%>
<%
	if(session.isNew()){
		counter++;
		saveCounter();
	}
%>
<h2>총 방문자 수 : <%=counter%>명</h2>
</body>
</html>









