<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%        
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/erp/resources/tiles.css">
</head>
<body style="margin: 0px;">
<div style="width: 1920px; height: 982px;;">
	
	<div style="float: left; width: 270px; height:822px;">
	<tiles:insertAttribute name="leftMain"/></div>
	
	<div style="float: left; width: 1570px; height:822px;">
	<tiles:insertAttribute name="rightMain"/></div>
	
</div>

</body>
</html>