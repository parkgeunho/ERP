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
<body style="margin: 0px; width: 100%;">
<div style="width: 100%; height: 822px;;">
	
	<div style="float: left; width: 100%; height:822px;"><tiles:insertAttribute name="leftMain"/></div>
	
</div>

</body>
</html>