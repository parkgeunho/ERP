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

<link rel='stylesheet' href='/erp/resources/schedule/calendar/fullcalendar.css'/>
<link href='/erp/resources/schedule/calendar/scheduler.css' rel='stylesheet' />
<link href='/erp/resources/schedule/calendar/jquery-ui.css' rel='stylesheet' />
<script src='/erp/resources/schedule/calendar/jquery.min.js'></script>
<script src='/erp/resources/schedule/calendar/jquery-ui.js'></script>
<script src='/erp/resources/schedule/calendar/moment.min.js'></script>
<script src='/erp/resources/schedule/calendar/fullcalendar.js'></script>
<script src='/erp/resources/schedule/calendar/scheduler.js'></script>

<script type="text/javascript">

	$(document).ready(function() {
		
		var events_array = [];
		
		if( '${jsonObject}' != 0 ){
		
			var arr = '${jsonObject}';
	    	
	    	var obj = JSON.parse(arr);		// 문자열을 다시 배열로 변환
	    	
			for(var i=0; i<obj.scheduleList.length; i++){
	
	    		var schedule_object = {
	
	    			id : obj.scheduleList[i].scheduleNum,
	    			title : obj.scheduleList[i].title,
	    			start : obj.scheduleList[i].startDate  + ' ' + obj.scheduleList[i].startTime,
	    			end : obj.scheduleList[i].endDate  + ' ' + obj.scheduleList[i].endTime
	    			
	    			
	    		};
	
	    		events_array.push(schedule_object);
	    	}
		}
    	
    	/* for(var i in obj.scheduleList){

    		var schedule_object = {

    			id : obj.scheduleList[i].id,
    			title : obj.scheduleList[i].title,
    			start : obj.scheduleList[i].startDate,
    			end : obj.scheduleList[i].endDate
    		};

    		events_array.push(schedule_object);
    	} */
		
	    $('#calendar').fullCalendar({
	
	    	schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
	    	
	        events: events_array,
		         
			eventColor: 'rgba(55,128,6,0.7)',
	
		    header: {
		        left: 'prev,next,prevYear,nextYear today ',
		        center: 'title',
		        right: 'month,agendaWeek,agendaDay'
		    },
		    
		    defaultView: 'agendaDay',
		    
		    defaultDate: '${defaultDate}',
		    
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
		         
			timeFormat: 'HH:mm',
			
			/* timeFormat: 'YYYY-MM-DD-HH-mm', */
			
			displayEventTime: true,
			
			selectable: true,
			
			unselectAuto: true,
			
			selectOverlap: true,
			
			eventTextColor: '#FFFFD2',
			
			editable: true,
			
			select: function(start, end, allDay) {
				
				var dt_start = moment(start).format('YYYY-MM-DD-HH-mm');
				var dt_end = moment(end).format('YYYY-MM-DD-HH-mm');
				
				window.open('./scheduleCreated?start='+dt_start+'&end='+dt_end, 'window', 'width=1100, height=900,scroll=yes');
			},
			
			eventClick: function(event) {
				
				/* var dt_start = moment(event.start).format('YYYY-MM-DD-HH-mm');
				var dt_end = moment(event.end).format('YYYY-MM-DD-HH-mm'); */
				
				window.open('./scheduleUpdated?scheduleNum='+event.id, 'window', 'width=1100, height=900,scroll=yes');
		    },
		    
		    eventDrop: function(event, start) {

		        if (!confirm("정말 날짜(시간)를 변경하시겠습니까?")) {
		            revertFunc();
		        }
				
				$.ajax({
					url:'scheduleDrop',
					data:{scheduleNum:event.id, start:event.start.format('YYYY-MM-DD:HH:mm'),
						end:event.end.format('YYYY-MM-DD:HH:mm')},
					type:'POST',
                    success: function(args){
						
                    }
	   			});
		    },
		    
		    selectHelper: true,
		    
		    droppable: true,
			
			handleWindowResize: true,
			
			eventStartEditable: true,
			
			eventDurationEditable: true
	    });
	});

</script>

</head>

	<div id='calendar'><br></div>

</html>