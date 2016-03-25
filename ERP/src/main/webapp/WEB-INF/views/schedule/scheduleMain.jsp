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
<link rel="stylesheet" type="text/css" href="/erp/resources/schedule/css/schedule.css">

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
		     
		    var src2 = ($('#fol').attr('src')=='/erp/resources/schedule/image/열린폴더.png') ?'/erp/resources/schedule/image/닫힌폴더.png':'/erp/resources/schedule/image/열린폴더.png';
		    $('#fol').attr('src',src2);
			
			var obj = $('.'+ this.id);

			var obj2 = $('#fol').id;
			
			if(obj.css('display')=='none'){
				obj.show();
				obj2.show();
			}
			else{
				obj.hide();
				obj2.hide();
			}
		});
	});
	
	$(function(){
		leftCal();
		rightCal();
	});
	
	function leftCal(){

		var url = "leftCalChange";
		
		$.post(url,function(args){
			
			$("#leftCal").html(args);
		});
		
		$("#leftCal").show();
	}
	
	function rightCal(){

		var url = "rightCalChange";
		
		$.post(url,function(args){
			
			$("#rightCal").html(args);
		});
		
		$("#rightCal").show();
	}
	
	function agendaDayCall(day){
		
		var year = $("#year").val();
		var month = $("#month").val();
		var day = day;

		var url = "agendaDayCall";
		
		$.post(url,{year:year,month:month,day:day},function(args){
			
			$("#rightCal").html(args);
		});
		
		$("#rightCal").show();
	}

</script>

</head>

<body onload="" style="width: 100%;">

<div style="width: 100%;">
	<div style="width: 270px; float: left" class="buseo1"><font style="font-style: 나눔고딕코딩;">일정</font></div>
	<div style="width: 1568px; float: left" class="buseo2"><font style="font-style: 나눔고딕코딩;">나의 일정</font></div>
</div>

<div style="float: left; height: 761px; border-right:1px solid #CCCCCC; width: 270px; padding-left:0px;">
	<div align="center" style="border-bottom:1px solid #CCCCCC; padding-left:0px; padding-top:10px; padding-bottom :15px; width: 270px;">
		<span id="leftCal" style="padding-top :50px; width: 270px; display: none;"></span>
	</div>
		
	<div style="border-bottom:1px solid #CCCCCC; height: 584px; float:left; text-align:left; padding-left:0px; padding-top:0px; width: 270px;">
		<dl>
			<dd style="text-align: left; padding-left:0px; ">
				<img id="fold-1" src="/erp/resources/schedule/image/minus.png"/>
				<img style="vertical-align: middle;" id="fol" src="/erp/resources/schedule/image/열린폴더.png"/>
				<font color="black" style="vertical-align:middle; font-style: 나눔고딕코딩;">일정</font></dd>
			<dd style="text-align: left; padding-left:0px; " class="fold-1">&nbsp;&nbsp;&nbsp;
			<img style="vertical-align:middle;" src="/erp/resources/schedule/image/점선.png"/>
			<img style="vertical-align:middle;" src="/erp/resources/schedule/image/닫힌폴더.png"/>
			<a style="text-decoration: none;" onmouseover="this.style.textDecoration='underline';" 
			onmouseout="this.style.textDecoration='none';" href="javascript:rightCal()">
			<font color="black" style="font-style: 나눔고딕코딩;">나의일정</font></a></dd>
			<!-- <dd style="text-align: left; padding-left:0px; " class="fold-1">&nbsp;&nbsp;&nbsp;<img src="/erp/resources/schedule/image/re.gif"/> -->
			<!-- <a style="text-decoration: none;" onmouseover="this.style.textDecoration='underline';" 
			onmouseout="this.style.textDecoration='none';" href="calendar2"><font color="black" style="font-style: 나눔고딕코딩;">그룹일정</font></a></dd> -->
			<!-- <dd style="text-align: left; padding-left:0px; " class="fold-1">&nbsp;&nbsp;&nbsp;<img src="/erp/resources/schedule/image/re.gif"/>
			<a style="text-decoration: none;" onmouseover="this.style.textDecoration='underline';" 
			onmouseout="this.style.textDecoration='none';" href="calendar2"><font color="black" style="font-style: 나눔고딕코딩;">전사일정</font></a></dd> -->
			<!-- <dd style="text-align: left; padding-left:0px; "><font color="black" style="font-style: 나눔고딕코딩;">할일작성</font></dd> -->
			<!-- <dd style="text-align: left; padding-left:0px; "><font color="black" style="font-style: 나눔고딕코딩;">회의실예약</font></dd>	 -->		
		</dl>
	</div>
</div>
	
<div align="center" style="border-bottom:1px solid #CCCCCC; overflow:auto; width:100%; max-width:1549px; float:left; height: 740px; padding:10px;">
	<span id="rightCal" style="display: none;"></span>
</div>

</body>
</html>