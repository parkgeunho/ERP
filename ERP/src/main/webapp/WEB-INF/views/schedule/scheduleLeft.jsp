<%@ page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/erp/resources/schedule/list.css" type="text/css"/>

	<style type="text/css">
		
		body{
			font-size: 12pt;
		
		}
		td{
			font-size: 12pt;
		}
	
	</style>
 
<script type="text/javascript">

	<%-- function sel() {
		
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
	} --%>
	
	/* function calendar() {
		var f = document.myform;
		f.submit();
	} */
	
	$(document).ready(function(){
		
		$('[id^="fold-"]').click(function(){
			
			var src = ($(this).attr('src')=='/erp/resources/schedule/image/minus.png') ?'/erp/resources/schedule/image/plus.png':'/erp/resources/schedule/image/minus.png';
		     $(this).attr('src',src);
			
			var obj = $('.'+ this.id);
			
			if(obj.css('display')=='none')
				obj.show();
			else
				obj.hide();
		});
	});
	
	$(document).ready(function(){
		
		$("#preCal").click(function(){
			
			var params = "year=" + $("#year").val() + "&month=" + $("#month").val();
			
			$.ajax({
				
				type : "POST",
				url  : "preCal",
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
	
	$(function(){
		leftCal();
	});
	
	function leftCal(){

		var url = "preCal";
		
		$.post(url,function(args){
			
			$("#leftCal").html(args);
		});
		
		$("#leftCal").show();
	}

</script>

</head>

<body onload="sel()">

<span id="leftCal" style="display: none;"></span>

	<div>
		<dl>
			<dd><img id="preCal" src="/erp/resources/schedule/image/left.jpg" width="20" height="17" border="0"/>	
				<img id="fold-1" src="/erp/resources/schedule/image/minus.png"/>&nbsp;일정</dd>
			<dd class="fold-1">&nbsp;&nbsp;&nbsp;<img src="/erp/resources/schedule/image/re.gif"/>
			&nbsp;<a style="text-decoration: none;" onmouseover="this.style.textDecoration='underline';" 
			onmouseout="this.style.textDecoration='none';" href="calendar2"><font color="black">나의일정</font></a></dd>
			<dd class="fold-1">&nbsp;&nbsp;&nbsp;<img src="/erp/resources/schedule/image/re.gif"/>
			&nbsp;<a style="text-decoration: none;" onmouseover="this.style.textDecoration='underline';" 
			onmouseout="this.style.textDecoration='none';" href="calendar2"><font color="black">그룹일정</font></a></dd>
			<dd class="fold-1">&nbsp;&nbsp;&nbsp;<img src="/erp/resources/schedule/image/re.gif"/>
			&nbsp;<a style="text-decoration: none;" onmouseover="this.style.textDecoration='underline';" 
			onmouseout="this.style.textDecoration='none';" href="calendar2"><font color="black">전사일정</font></a></dd>
			<dd>할일작성</dd>
			<dd>회의실예약</dd>			
		</dl>
	</div>	

</body>
</html>