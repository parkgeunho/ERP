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
		
	    $('#calendar').fullCalendar({

	    	schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
	    	
	        events: [
	            // events go here
	        ],
	        resources: [
	            // resources go here
	        ],
	        // other options go here...
	    	
	    	dayClick: function() {
		        alert('a day has been clicked!');
		    },
		    
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
				
				prompt('일정을 입력하세요.!!!');
				
				/* var dt_start = moment(start).format('YYYY/MM/DD hh:mm');
				var dt_end = moment(end).format('YYYY/MM/DD hh:mm'); */
			}
	    });
	});

</script>

</head>
<body >

<br/><br/>

<div id='calendar'></div>

<br/><br/>

</body>
</html>