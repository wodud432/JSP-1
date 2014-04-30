<%@ page contentType="text/html; charset=EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>parking.jsp</title>
</head>
<body>
<jsp:useBean id="car" class="mybean.index.CarDto" /> 
<jsp:useBean id="parking" class="mybean.index.ParkingBean" />

<jsp:setProperty property="enter" name="parking"/>
<jsp:setProperty property="exit" name="parking"/>

<h1>주차 관리 프로그램</h1>
<form action="parking.jsp" method="post">
	주차장에 들어온 차 번호 : <input type="text" name="enter" />
	&nbsp;&nbsp;&nbsp;
	<input type="submit" value="입차" />
</form>

<form action="parking.jsp" method="post">
	주차장에서 나간 차 번호 : <input type="text" name="exit" />
	&nbsp;&nbsp;&nbsp;
	<input type="submit" value="출차" />
</form>
<hr/>
주차된 차량 목록 :<br/>
<table border="1">
	<tr>
		<th>차량 번호</th><th>입차 시간</th>
	</tr>
</table>
<br/>
총 주차대수 : 대
</body>
</html>
<!-- 
	class name : mybean.index.CarDto
	name			r/w			data type
	--------------------------------------
	plateNumber		r			String
	parkingTime		r			java.util.Date
	
	class name : mybean.index.ParkingBean
	name			r/w			data type
	--------------------------------------
	enter			w			String
	exit			w			String
	total			r			int
	carDto			r			CarDto, carDto[]
 -->