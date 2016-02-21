<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp = request.getContextPath();
	int restDiv = (Integer)request.getAttribute("restDiv");

	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/erp/resources/ManagementView.css">

<script type="text/javascript">
function buseoManagement(){
	
	window.open("buseoManagement","","width=300px,height=580px");
	
}


</script>


<script>
$(document).ready(function(){
	$(".content").mCustomScrollbar();

	$('[id^="fold-"]').click(function(){
	  
	  var src = ($(this).attr('src')=='/erp/resources/image/minus.png') ?'/erp/resources/image/plus.png':'/erp/resources/image/minus.png';
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
<body>
<div  style="width:1840px; height: 807px;">
	
	
	<!-- 왼쪽 부서 관련  -->
	<div style="width: 500px;float: left;">
		<div class="buseo" >
		부서
		</div>
		<div style="height: 740px;" class="mCustomScrollbar" data-mcs-theme="minimal-dark">

			<c:forEach var="dto" items="${lists }">
   				<c:forEach begin="1" end="${dto.depthGap }" step="1">
   				</div>
   				<% restDiv = restDiv - 1;%>
   				</c:forEach>
				<div class="fold-${dto.parent}" id="lists">
  
		         <c:if test="${dto.depth != 0}">
		            <c:forEach begin="1" end="${dto.depth }" step="1">
		               &nbsp;
            </c:forEach>
	         </c:if>
	         <c:if test="${dto.replyNum == 0 && dto.depth != 0}">
	            &nbsp; &nbsp;
	         </c:if>
	         <c:if test="${dto.replyNum != 0}">
	         <img id="fold-${dto.buseoNum}" src="/erp/resources/image/minus.png"/>
	         </c:if>
	        
	        <label id="edit-${dto.buseoNum}">${dto.buseoName }</label>
			<input type="hidden" class="numedit-${dto.buseoNum}" value="${dto.buseoNum }" >
			</c:forEach>
			   <% for(int i=0; i<restDiv; i++){ %>
			   </div>
			   <%} %>
			</div>
		</div>
	</div>
	
	<div style="width: 1340px; height: 740px;float: left;">
		
		<div class="buseo">
		사원정보
		</div>
		
		
		<div style=" height: 740px; width: 1340px;">
			<div style="margin-top:50px; margin-left: 570px; height: 40px; float: left;">
			<input type="text" name="" style="height: 16px; float: left;">
			
			<span style="margin-left: 5px; float: left;">
				<a href="#"><img align="middle" src="/erp/resources/image/find.png"></a>
			</span>
			
			<div style="float: left;height: 25px" class="button" onclick="javascript:buseoManagement();">부서관리</div>		
			<div class="button" style="float: left;height: 25px;margin-left: 10px;" onclick="javascript:location.href='<%=cp%>/join.action';">사원등록</div>			
			</div>
			
			<div style="padding-top :130px;">
				
			</div>
			
		</div>
	</div>
</div>



</body>
</html>