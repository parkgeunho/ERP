<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%        
	
	String cp = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="/erp/resources/ManagementView.css">

<title>Insert title here</title>
</head>
<body>

<div style="width: 270px;">
	<div class="buseo" >
	게시판 목록
	</div>
	<div>
	<c:forEach var="dto" items="${boardlist }">
		
		
		<div>${dto.boardName }</div>
	</c:forEach>
	</div>
	
	
	
	
	
	
</div>




</body>
</html>