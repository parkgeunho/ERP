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

	$(document).ready(function(){
		
		$('[id^="cal"]').click(function(){
			
			var params;
			
			if ($(this).attr('id') == 'calLeft') {
				params = "year=" + ${preYear} + "&month=" + ${preMonth};
			} else if($(this).attr('id') == 'calRight'){
				params = "year=" + ${nextYear} + "&month=" + ${nextMonth};
			} else{
				params = "year=" + ${nowYear} + "&month=" + ${nowMonth};
			}
			
			$.ajax({
				
				type : "POST",
				url  : "leftCalChange",
				data : params,
				success : function(args){
					$("#leftCal").html(args);
				},
				error : function(e){
					alert(e.responseText);
				}
			});
		});
	});

</script>

</head>

<table style="padding-top :0px;" align="center" width="210" cellpadding="2" cellspacing="1">

	<tr>
		<td align="center">
		
		<img style="cursor: pointer; vertical-align: middle;" id="calToday" src="/erp/resources/schedule/image/today.jpg" width="25" height="17" border="0"/>
		
		<img style="cursor: pointer; vertical-align: middle;" id="calLeft" src="/erp/resources/schedule/image/left.jpg" width="20" height="17" border="0"/>
		
			<font style="vertical-align: middle;" size="3px">&nbsp;&nbsp;&nbsp;&nbsp;${year}년</font>
			<c:if test="${month<10 }">&nbsp;</c:if>
			<font style="vertical-align: middle;" size="3pt">${month}월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</font>
			<input type="hidden" id="year" name="year" value="${year }">
			<input type="hidden" id="month" name="month" value="${month }">
		<img style="cursor: pointer; vertical-align: middle;" id="calRight" src="/erp/resources/schedule/image/right.jpg" width="20" height="17" border="0"/>
		</td>
	</tr>
</table>

<table align="center" width="210" cellpadding="0" cellspacing="1" bgcolor="#cccccc">

	<tr>
		<td style="padding-top: 2px;" width="25px" bgcolor="#e6e4e6" align="center"><font size="2pt" color="#FF3636">일</font></td>
		<td style="padding-top: 2px;" width="25px" bgcolor="#e6e4e6" align="center"><font size="2pt">월</font></td>
		<td style="padding-top: 2px;" width="25px" bgcolor="#e6e4e6" align="center"><font size="2pt">화</font></td>
		<td style="padding-top: 2px;" width="25px" bgcolor="#e6e4e6" align="center"><font size="2pt">수</font></td>
		<td style="padding-top: 2px;" width="25px" bgcolor="#e6e4e6" align="center"><font size="2pt">목</font></td>
		<td style="padding-top: 2px;" width="25px" bgcolor="#e6e4e6" align="center"><font size="2pt">금</font></td>
		<td style="padding-top: 2px;" width="25px" bgcolor="#e6e4e6" align="center"><font size="2pt" color="#0054FF">토</font></font></td>
	</tr>

	<%
		int newLine = 0;
	
		out.print("<tr height='20'>");
		
		for(int i=1; i<week; i++){
			
			out.print("<td width=\"25px\" bgcolor='#ffffff'>&nbsp;</td>");
			newLine++;
		}
		
		for(int i=startDay; i<=endDay; i++){
			
			String fontColor = (newLine==0)?"#FF3636":(newLine==6)?"#0054FF":"black";
			
			String bgColor = (nowYear==year)&&(nowMonth==month)&&(nowDay==i)?"#e6e4e6":"#ffffff";
			
			out.print("<td width=\"25px\" onclick=\"agendaDayCall(" + i + ")\" style=\"cursor: pointer;\" align='center' bgcolor='" + bgColor + "'><font size=\"2pt\" color='" + fontColor + "'>" + i + "</font></td>");
			
			newLine++;
			
			if(newLine==7 && i!=endDay){
				
				out.print("</tr><tr height='20'>");
				newLine=0;
			}
		}
		
		while(newLine>0 && newLine<7){
			
			out.print("<td width=\"25px\" bgcolor='#ffffff'>&nbsp;</td>");
			newLine++;
		}
		
		out.print("</tr>");
	%>

</table>

