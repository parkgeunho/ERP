<%@ page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();

	Calendar cal2 = Calendar.getInstance();
	
	//오늘 날짜 구하기
	int nowYear2 = cal2.get(Calendar.YEAR);
	int nowMonth2 = cal2.get(Calendar.MONTH)+1;
	int nowDay2 = cal2.get(Calendar.DAY_OF_MONTH);
	
	String strYear2 = request.getParameter("year2");
	String strMonth2 = request.getParameter("month2");
	
	int year2 = nowYear2;
	int month2 = nowMonth2;
	
	if(strYear2 != null)
		year2 = Integer.parseInt(strYear2);
	
	if(strMonth2 != null)
		month2 = Integer.parseInt(strMonth2);
	
	int preYear2 = year2, preMonth2 = month2-1;
	
	if(preMonth2<1){
		preYear2 = year2-1;
		preMonth2 = 12;
	}
	
	int nextYear2 = year2, nextMonth2 = month2+1;
	
	if(nextMonth2>12){
		
		nextYear2 = year2+1;
		nextMonth2=1;
	}
	
	cal2.set(year2, month2-1, 1);
	
	int startDay2 = 1;
	int endDay2 = cal2.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	int week2 = cal2.get(Calendar.DAY_OF_WEEK);
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

	function sel2() {
		
		var f2 = document.myform2;
	
		var syear2 = f2.year2;
		var year2 = <%=year2%>;
		
		for (var i=0; i<11; i++) {
			syear2[i] = new Option(year2-5, year2-5);
			
			if (syear2[i].value == <%=year2%>)
				syear2[i].selected = true; 
			year2++;
		}
	
		var smonth2 = f2.month2;
		for (i=0; i<12; i++)
			smonth2[i] = new Option(i+1, i+1);
		
		for (i=0; i<12; i++){
			
			if (smonth2[i].value == <%=month2%>)
				smonth2[i].selected = true; 
		}	
	}
	
	function calendar2() {
		var f2 = document.myform2;
		f2.submit();
	}

</script>

</head>

<body onload="sel2()">

<br/><br/>

<form method="get" name="myform2">

<table align="center" cellpadding="2" cellspacing="1">

	<tr>
		<td align="center">
		
		<a href="calendar2?year2=<%=nowYear2%>&month2=<%=nowMonth2%>">
		<img src="/erp/resources/schedule/image/today.jpg" width="25" height="17" align="left"></a>
		
		<a href="calendar2?year2=<%=preYear2%>&month2=<%=preMonth2%>">
		<img src="/erp/resources/schedule/image/left.jpg" width="20" height="17" border="0"></a>	
		
			<%=year2%>년
			
			<%=month2%>월
		
		<a href="calendar2?year2=<%=nextYear2%>&month2=<%=nextMonth2%>">
		<img src="/erp/resources/schedule/image/right.jpg" width="20" height="17" border="0"></a>
		</td>
	</tr>
</table>

</form>

<table align="left" cellpadding="0" cellspacing="1" bgcolor="#cccccc">

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
		int newLine2 = 0;
	
		out.print("<tr height='20'>");
		
		for(int i=1; i<week2; i++){
			
			out.print("<td bgcolor='#ffffff'>&nbsp;</td>");
			newLine2++;
		}
		
		for(int i=startDay2; i<=endDay2; i++){
			
			String fontColor2 = (newLine2==0)?"red":(newLine2==6)?"blue":"black";
			
			String bgColor2 = (nowYear2==year2)&&(nowMonth2==month2)&&(nowDay2==i)?"#e6e4e6":"#ffffff";
			
			out.print("<td style=\"cursor: pointer; width:210px; height: 150px; vertical-align: top;\" onclick=\"window.location='http://kin.naver.com'\" align='right' bgcolor='" 
			+ bgColor2 + "'><font color='" + fontColor2 + "'>" + i + "</font></td>");
			//<td align='center' bgcolor='#e6e4e6'><font color='black'>5</font></td>
			
			newLine2++;
			
			if(newLine2==7 && i!=endDay2){
				
				out.print("</tr><tr height='20'>");
				newLine2=0;
			}
		}
		
		while(newLine2>0 && newLine2<7){
			
			out.print("<td bgcolor='#ffffff'>&nbsp;</td>");
			newLine2++;
		}
		
		out.print("</tr>");
	%>
</table>

</body>
</html>