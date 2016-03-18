<%@ page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	int week = (Integer)request.getAttribute("week");
	int startDay = (Integer)request.getAttribute("startDay");
	int endDay = (Integer)request.getAttribute("endDay");
	int nowYear = (Integer)request.getAttribute("nowYear");
	int year = (Integer)request.getAttribute("year");
	int nowMonth = (Integer)request.getAttribute("nowMonth");
	int month = (Integer)request.getAttribute("month");
	int nowDay = (Integer)request.getAttribute("nowDay");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/erp/resources/schedule/list.css" type="text/css"/>
 
<script type="text/javascript">

</script>

</head>

<br/><br/>

<table align="center" width="210" cellpadding="2" cellspacing="1">

	<tr>
		<td align="center">
		<input type="hidden" id="year" value="${preYear}">
		<input type="hidden" id="month" value="${preMonth}">
		
		<a href="calendar?year=${nowYear}&month=${nowMonth}">
		<img src="/erp/resources/schedule/image/today.jpg" width="25" height="17" align="left"/></a>
		
		<img id="preCal" src="/erp/resources/schedule/image/left.jpg" width="20" height="17" border="0"/>
		
			${year}년
			
			${month}월
		
		<a href="calendar?year=${nextYear}&month=${nextMonth}">
		<img src="/erp/resources/schedule/image/right.jpg" width="20" height="17" border="0"/></a>
		</td>
	</tr>
</table>

<table align="center" width="210" cellpadding="0" cellspacing="1" bgcolor="#cccccc">

	<tr>
		<td bgcolor="#e6e4e6" align="center"><font color="red">일</font></td>
		<td bgcolor="#e6e4e6" align="center">월</td>
		<td bgcolor="#e6e4e6" align="center">화</td>
		<td bgcolor="#e6e4e6" align="center">수</td>
		<td bgcolor="#e6e4e6" align="center">목</td>
		<td bgcolor="#e6e4e6" align="center">금</td>
		<td bgcolor="#e6e4e6" align="center"><font color="blue">토</font></td>
	</tr>

	<%
		int newLine = 0;
	
		out.print("<tr height='20'>");
		
		for(int i=1; i<week; i++){
			
			out.print("<td bgcolor='#ffffff'>&nbsp;</td>");
			newLine++;
		}
		
		for(int i=startDay; i<=endDay; i++){
			
			String fontColor = (newLine==0)?"red":(newLine==6)?"blue":"black";
			
			String bgColor = (nowYear==year)&&(nowMonth==month)&&(nowDay==i)?"#e6e4e6":"#ffffff";
			
			out.print("<td onclick=\"window.location='http://kin.naver.com'\" style=\"cursor: pointer;\" align='center' bgcolor='" + bgColor + "'><font color='" + fontColor + "'>" + i + "</font></td>");
			
			newLine++;
			
			if(newLine==7 && i!=endDay){
				
				out.print("</tr><tr height='20'>");
				newLine=0;
			}
		}
		
		while(newLine>0 && newLine<7){
			
			out.print("<td bgcolor='#ffffff'>&nbsp;</td>");
			newLine++;
		}
		
		out.print("</tr>");
	%>
	
</table>

