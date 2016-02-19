<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	Calendar cal = Calendar.getInstance();
	
	//오늘 날짜 구하기
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	String strYear = request.getParameter("year");
	String strMonth = request.getParameter("month");
	
	int year = nowYear;
	int month = nowMonth;
	
	if(strYear != null)
		year = Integer.parseInt(strYear);
	
	if(strMonth != null)
		month = Integer.parseInt(strMonth);
	
	int preYear = year, preMonth = month-1;
	
	if(preMonth<1){
		preYear = year-1;
		preMonth = 12;
	}
	
	int nextYear = year, nextMonth = month+1;
	
	if(nextMonth>12){
		
		nextYear = year+1;
		nextMonth=1;
	}
	
	cal.set(year, month-1, 1);
	
	int startDay = 1;
	int endDay = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	int week = cal.get(Calendar.DAY_OF_WEEK);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<style type="text/css">
		
		body{
			font-size: 12pt;
		
		}
		td{
			font-size: 12pt;
		}
	
	</style>
 
 <script type="text/javascript">

	function sel() {
		
		var f = document.myform;
	
		var syear = f.year;
		var year = <%=year%>;
		
		for (var i=0; i<11; i++) {
			syear[i] = new Option(year-5, year-5);
			
			if (syear[i].value == <%=year%>)
				syear[i].selected = true; 
			year++;
		}
	
		var smonth = f.month;
		for (i=0; i<12; i++)
			smonth[i] = new Option(i+1, i+1);
		
		for (i=0; i<12; i++){
			
			if (smonth[i].value == <%=month%>)
				smonth[i].selected = true; 
		}	
	}
	
	function calendar() {
		var f = document.myform;
		f.submit();
	}

</script>
</head>

<body onload="sel()">

<br/><br/>

<form method="get" name="myform">

<table align="center" width="210" cellpadding="2" cellspacing="1">

	<tr>
		<td align="center">
		
		<a href="calendar?year=<%=nowYear%>&month=<%=nowMonth%>">
		<img src="/erp/resources/schedule/image/today.jpg" width="25" height="17" align="left"></a>
		
		<a href="calendar?year=<%=preYear%>&month=<%=preMonth%>">
		<img src="/erp/resources/schedule/image/left.jpg" width="20" height="17" border="0"></a>	
		
			<select name="year" onchange="calendar()">
			</select>년
			
			<select name="month" onchange="calendar()">
			</select>월
		
		<a href="calendar?year=<%=nextYear%>&month=<%=nextMonth%>">
		<img src="/erp/resources/schedule/image/right.jpg" width="20" height="17" border="0"></a>
		</td>
	</tr>
</table>

</form>

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
			
			out.print("<td align='center' bgcolor='" + bgColor + "'><font color='" + fontColor + "'>" + i + "</font></td>");
			//<td align='center' bgcolor='#e6e4e6'><font color='black'>5</font></td>
			
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

</body>
</html>