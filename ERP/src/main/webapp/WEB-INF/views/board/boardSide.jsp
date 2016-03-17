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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<title>Insert title here</title>
<script >

$(document).ready(function(){

	$('[id^="ch-"]').click(function(){
		
		
		var num= $('.num'+this.id).val();
	
	
		
		
		window.location.href='<%=cp%>/boardMain?listNum='+num;

		 
	});
});








</script>


</head>
<body>

<div style="width: 270px;">
	<div class="buseo" >
	게시판 목록
	</div>
	<div>
		<c:forEach var="parent" items="${parent }">
				<c:forEach var="depth0" items="${boardlist }">
					<c:choose>
					
					<c:when test="${depth0.parent==0 && depth0.groupNum==parent.groupNum}">
					<div>
					
					<label id="ch-${depth0.listNum}">${depth0.boardName }</label>
					<input type="hidden" class="numch-${depth0.listNum }" value="${depth0.listNum }">
					</div>
						<div class="fold-${depth0.listNum}">
						
						
						<c:forEach var="depth1" items="${boardlist }">
										
							<c:choose>
							
							<c:when test="${depth1.parent==depth0.listNum}">
								<div style="margin-left: 20px;">
								<label id="ch-${depth1.listNum }">┖${depth1.boardName }</label>
								<input type="hidden" class="numch-${depth1.listNum }" value="${depth1.listNum }">
								</div>
							</c:when>
							
							</c:choose>
						</c:forEach>
						</div>
								
					</c:when>
					
					</c:choose>
				</c:forEach>
			</c:forEach>
	</div>
	
	
	
	
	
	
</div>




</body>
</html>