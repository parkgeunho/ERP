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

</script>

</head>

<body onload="sel()">
<div style="width: 100%;">
	<div style="width: 270px; float: left" class="buseo1"><font style="font-style: 나눔고딕코딩;">전자결재</font></div>
</div>
	
</br>
<span id="leftCal" style="display: none;"></span>
	
	<div>
		<dl>
			</br></br>		
			<dd><img id="fold-1" src="/erp/resources/schedule/image/minus.png"/>&nbsp;진행중</dd>
			
				<dd class="fold-1">&nbsp;&nbsp;&nbsp;<img src="/erp/resources/schedule/image/re.gif"/>
				&nbsp;<a style="text-decoration: none;" onmouseover="this.style.textDecoration='underline';" 
				onmouseout="this.style.textDecoration='none';" href="approval"><font color="black">상신한문서</font></a></dd>
				<dd class="fold-1">&nbsp;&nbsp;&nbsp;<img src="/erp/resources/schedule/image/re.gif"/>
				&nbsp;<a style="text-decoration: none;" onmouseover="this.style.textDecoration='underline';" 
				onmouseout="this.style.textDecoration='none';" href="approval6"><font color="black">결재할문서</font></a></dd>
				<dd class="fold-1">&nbsp;&nbsp;&nbsp;<img src="/erp/resources/schedule/image/re.gif"/>
				&nbsp;<a style="text-decoration: none;" onmouseover="this.style.textDecoration='underline';" 
				onmouseout="this.style.textDecoration='none';" href="approval2"><font color="black">결재한문서</font></a></dd>
							
			<dd><img id="fold-1" src="/erp/resources/schedule/image/minus.png"/>&nbsp;완료</dd>
			
				<dd class="fold-1">&nbsp;&nbsp;&nbsp;<img src="/erp/resources/schedule/image/re.gif"/>
				&nbsp;<a style="text-decoration: none;" onmouseover="this.style.textDecoration='underline';" 
				onmouseout="this.style.textDecoration='none';" href="approval3"><font color="black">상신한문서</font></a></dd>
				<dd class="fold-1">&nbsp;&nbsp;&nbsp;<img src="/erp/resources/schedule/image/re.gif"/>
				&nbsp;<a style="text-decoration: none;" onmouseover="this.style.textDecoration='underline';" 
				onmouseout="this.style.textDecoration='none';" href="approval4"><font color="black">결재문서</font></a></dd>
				<dd class="fold-1">&nbsp;&nbsp;&nbsp;<img src="/erp/resources/schedule/image/re.gif"/>
				&nbsp;<a style="text-decoration: none;" onmouseover="this.style.textDecoration='underline';" 
				onmouseout="this.style.textDecoration='none';" href="approval5"><font color="black">반려문서</font></a></dd>
				
		</dl>
	</div>	

</body>
</html>
