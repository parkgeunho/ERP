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

<link rel='stylesheet' href='/erp/resources/schedule/calendar/fullcalendar.css'/>
<link href='/erp/resources/schedule/calendar/scheduler.css' rel='stylesheet' />
<link href='/erp/resources/schedule/calendar/jquery-ui.css' rel='stylesheet' />
<script src='/erp/resources/schedule/calendar/jquery.min.js'></script>
<script src='/erp/resources/schedule/calendar/jquery-ui.js'></script>
<script src='/erp/resources/schedule/calendar/moment.min.js'></script>
<script src='/erp/resources/schedule/calendar/fullcalendar.js'></script>
<script src='/erp/resources/schedule/calendar/scheduler.js'></script>

	<style type="text/css">
		
		body{
			font-size: 12pt;
		
		}
		td{
			font-size: 12pt;
		}
	
	</style>
 
<script type="text/javascript">

	$(document).ready(function() {
		
	    $('#calendar').fullCalendar({
	
	    	schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
	    	
	        events: [
	            // events go here
	        ],
	        resources: [
	            // resources go here
	        ],
	        // other options go here...
	    	
	    	/* dayClick: function() {
		        alert('a day has been clicked!');
		    }, */
		    
		    /* customButtons: {
		        myCustomButton: {
		            text: 'custom!',
		            click: function() {
		                alert('clicked the custom button!');
		            }
		        }
		    }, */
	
		    header: {
		        left: 'prev,next,prevYear,nextYear today ',
		        center: 'title',
		        right: 'month,agendaWeek,agendaDay'
		    },
		    
		    views: {
		    	month: {
		        	
		            titleFormat: 'YYYY MMM'
		        }
		    },
		    
		    eventLimit: true,
		    views: {
		        agenda: {
		            eventLimit: 6
		        }
		    },
		    
		    timezone: 'local',
		    
		    allDaySlot: false,
		    
		    slotLabelFormat: 'HH:mm',
		    
		    scrollTime: '00:00:00',
		    
		    slotEventOverlap: true,
		    
		    nowIndicator: true,
		    
		    events: [
		             {
		                 title:  '어린이날',
		                 start:  '2016-05-05',
		                 color: '#4374D9',
		             }
		             // other events here...
		         ],
		         
		         eventColor: '#378006',
		         
			timeFormat: 'HH:mm',
			
			displayEventTime: true,
			
			selectable: true,
			
			selectOverlap: true,
			
			eventTextColor: '#FFFFD2',
			
			editable: true,
			
			select: function(start, end, allDay) {
				
				var dt_start = moment(start).format('YYYY.MM.DD.HH.mm');
				var dt_end = moment(end).format('YYYY.MM.DD.HH.mm');
				
				window.open('./scheduleCreated?start='+dt_start+'&end='+dt_end, 'window', 'width=1100, height=1080,scroll=yes');
			},
			
			handleWindowResize: true
	    });
	});

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
	
	$(function(){
		leftCal();
	});
	
	function leftCal(){

		var url = "calChange";
		
		$.post(url,function(args){
			
			$("#leftCal").html(args);
		});
		
		$("#leftCal").show();
	}

</script>

</head>

<body onload="sel()" style="width: 100%;">

<div style="width: 100%;">
	<div style="width: 270px; float: left" class="buseo1"><font style="font-style: 나눔고딕코딩;">일정</font></div>
</div>

<div style="float: left; height: 761px; border-right:1px solid #CCCCCC; width: 270px; padding-left:0px;">
	<div align="center" style="border-bottom:1px solid #CCCCCC; padding-left:0px; padding-top:10px; padding-bottom :15px; width: 270px;">
		<span id="leftCal" style="padding-top :50px; width: 270px; display: none;"></span>
	</div>
		
	<div style="border-bottom:1px solid #CCCCCC; height: 584px; float:left; text-align:left; padding-left:0px; padding-top:0px; width: 270px;">
		<dl>
			<dd style="text-align: left; padding-left:0px; ">	
				<img id="fold-1" src="/erp/resources/schedule/image/minus.png"/>&nbsp;<font color="black" style="font-style: 나눔고딕코딩;">일정</font></dd>
			<dd style="text-align: left; padding-left:0px; " class="fold-1">&nbsp;&nbsp;&nbsp;<img src="/erp/resources/schedule/image/re.gif"/>
			<a style="text-decoration: none;" onmouseover="this.style.textDecoration='underline';" 
			onmouseout="this.style.textDecoration='none';" href="calendar2"><font color="black" style="font-style: 나눔고딕코딩;">나의일정</font></a></dd>
			<dd style="text-align: left; padding-left:0px; " class="fold-1">&nbsp;&nbsp;&nbsp;<img src="/erp/resources/schedule/image/re.gif"/>
			<a style="text-decoration: none;" onmouseover="this.style.textDecoration='underline';" 
			onmouseout="this.style.textDecoration='none';" href="calendar2"><font color="black" style="font-style: 나눔고딕코딩;">그룹일정</font></a></dd>
			<dd style="text-align: left; padding-left:0px; " class="fold-1">&nbsp;&nbsp;&nbsp;<img src="/erp/resources/schedule/image/re.gif"/>
			<a style="text-decoration: none;" onmouseover="this.style.textDecoration='underline';" 
			onmouseout="this.style.textDecoration='none';" href="calendar2"><font color="black" style="font-style: 나눔고딕코딩;">전사일정</font></a></dd>
			<dd style="text-align: left; padding-left:0px; "><font color="black" style="font-style: 나눔고딕코딩;">할일작성</font></dd>
			<dd style="text-align: left; padding-left:0px; "><font color="black" style="font-style: 나눔고딕코딩;">회의실예약</font></dd>			
		</dl>
	</div>
</div>
	
<div align="center" style="border-bottom:1px solid #CCCCCC; overflow:auto; width:100%; max-width:1549px; float:left; height: 740px; padding:10px;">
	<div id='calendar'><br></div>
</div>

</body>
</html>