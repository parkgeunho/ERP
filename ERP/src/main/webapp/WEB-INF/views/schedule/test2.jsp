<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head lang="ko">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="/erp/resources/schedule/jquery-2.2.0.js"></script>
<script src="/erp/resources/schedule/jquery-1.12.2.min.js"></script>
<script src="/erp/resources/script/jquery-ui-1.11.4.custom/jquery-ui.js"></script>



</head>

<body>

	<input type="text" id="calendar" name="calendar"/>

</body>
<script type="text/javascript">

	$("#calendar").datepicker({
		
		changeMonth: true,
		changeYear: true,
		showOn: 'button',
		buttonImageOnly: true
	});
	
	$('img.ui-datepicker-trigger').css({'cursor':'pointer','margin-left':'5px', 'margin-top':'3px'});
	
	$.datepicker.setDefaults({dateFormat:'yy-mm-dd'});

</script>
</html>