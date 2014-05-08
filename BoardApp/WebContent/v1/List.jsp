<%@page import="mybean.board.BoardDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html;charset=euc-kr" %>
<HTML>
<link href="style.css" rel="stylesheet" type="text/css">
<script>
	function check(){
		if(document.search.keyWord.value == ""){
			alert("검색어를 입력하세요.");
			document.search.keyWord.focus();
			return;
		}
		document.search.submit();
	}
	
	function list(){
		document.list.action="List.jsp";
		document.list.submit();
	}
	
	function read(param){
		document.read.num.value=param;
		document.read.submit();
	}
</script>
<BODY>
<center><br>
<h2>JSP Board</h2>
<jsp:useBean id="dao" class="mybean.board.BoardDao" />
<%!
	public String getParam(HttpServletRequest req, String pName){
		if(req.getParameter("keyWord") != null)
			return req.getParameter("keyWord");
		else
			return "";
	}
%>
<%
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	
	if(keyField == null)
		keyField = "name"; 
	
	if(request.getParameter("reload") != null){
		if(request.getParameter("reload").equals("true")){
			keyWord = "";
		}
	}
	
	Vector list = dao.getBoardList(keyField, keyWord);
%>
<table align=center border=0 width=80%>
<tr>
	<td align=left>Total :  <%=list.size()%> Articles(
		<font color=red>  1 / 10 Pages </font>)
	</td>
</tr>
</table>

<table align=center width=80% border=0 cellspacing=0 cellpadding=3>
<tr>
	<td align=center colspan=2>
		<table border=0 width=100% cellpadding=2 cellspacing=0>
			<tr align=center bgcolor=#D0D0D0 height=120%>
				<td width="10%"> 번호 </td>
				<td widht="40%"> 제목 </td>
				<td width="20%"> 이름 </td>
				<td width="20%"> 날짜 </td>
				<td width="10%"> 조회수 </td>
			</tr>		
			<% if(list.isEmpty()){ %>
					<b>등록된 글이 없습니다.</b>
			<%
				}
				else{
					for(int i=0; i<list.size(); i++){
						BoardDto dto = (BoardDto)list.get(i);
			%>
			<tr>
				<td><%=dto.getNum()%></td>
				<td><a href="javascript:read('<%=dto.getNum()%>')"><%=dto.getSubject()%></a></td>
				<td><a href="mailto:<%=dto.getEmail()%>"><%=dto.getName()%></a></td>
				<td><%=dto.getRegdate()%></td>
				<td><%=dto.getCount()%></td>
			</tr>
			<%
					}
				}
			%>
		</table>
	</td>
</tr>
<tr><td></td></tr>
<tr>
	<td align="left">Go to Page </td>
	<td align=right>
		<a href="Post.jsp">[글쓰기]</a>
		<a href="javascript:list()">[처음으로]</a>
	</td>
</tr>
</table>
<BR>
<form action="List.jsp" name="search" method="post">
	<table border=0 width=527 align=center cellpadding=4 cellspacing=0>
	<tr>
		<td align=center valign=bottom>
			<select name="keyField" size="1">
				<option value="name" <% if(keyField.equals("name")) { %> selected <%} %>> 이름
				<option value="subject" <% if(keyField.equals("subject")) { %> selected <%} %>> 제목
				<option value="content" <% if(keyField.equals("content")) { %> selected <%} %>> 내용
			</select>

			<input type="text" size="16" name="keyWord" value='<%=getParam(request, "keyWord")%>'>
			<input type="button" value="찾기" onClick="check()">
			<input type="hidden" name="page" value= "0">
		</td>
	</tr>
	</table>
</form>
<form name="list" method="post">
	<input type="hidden" name="reload" value="true" />
</form>

<form name="read" method="post" action="Read.jsp">
	<input type="hidden" name="num" />
	<input type="hidden" name="keyField" value="<%=keyField%>"/>
	<input type="hidden" name="keyWord" value="<%=keyWord%>"/>
</form>
</center>	
</BODY>
</HTML>