<%@page import="mvc.exam2.BookDto"%>
<%@page import="java.util.Vector"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
	Vector bookList = (Vector)session.getAttribute("cart");
%>

<%
	try{
		if( bookList != null || bookList.size() > 0){
%>
<b>현재 주문한 도서</b><br/>
<table border="1">
	<tr>
		<th>도서 제목</th><th>작가</th><th>가격</th><th>수량</th>
	</tr>
<%
	for(int i=0; i<bookList.size(); i++){
		BookDto dto = (BookDto)bookList.get(i);
%>
	<tr>
		<td><%=dto.getTitle() %></td>
		<td><%=dto.getAuthor() %></td>
		<td><%=dto.getPrice() %></td>
		<td><%=dto.getQuantity() %></td>
	</tr>
<%
	}
%>
</table>
<br/>
<form method="post" action="../cart.action">
	<input type="hidden" name="command" value="CHK" />
	<input type="submit" value="체크 아웃" />
</form>
<%
		}
	}
	catch(NullPointerException err){}
%>