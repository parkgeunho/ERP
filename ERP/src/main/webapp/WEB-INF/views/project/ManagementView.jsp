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
<script src="/erp/resources/insa/jquery.session.js"></script>
<script src="/erp/resources/insa/jquery.mCustomScrollbar.concat.min.js"></script>
<link rel="stylesheet" type="text/css" href="/erp/resources/jquery.mCustomScrollbar.css">
<link rel="stylesheet" type="text/css" href="/erp/resources/ManagementView.css">

<script>
$(document).ready(function(){
	/* $(".content").mCustomScrollbar(); */

	
	$('[id^="ch-"]').click(function(){
		
		alert(this.id);
		var num= $('.num'+this.id).val();
		alert(num);
		
	});
	
	
	
	
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






<script type="text/javascript">
function buseoManagement(){
	
	window.open("buseoManagement","","width=300px,height=580px");
	
}


</script>




</head>
<body>
<div  style="width:1840px; height: 807px;">
	
	
	<!-- 왼쪽 부서 관련  -->
	<div style="width: 500px;float: left;">
		<div class="buseo" >
		부서
		</div>
		<div>
			<c:forEach var="parent" items="${parent }">
				<c:forEach var="depth0" items="${lists }">
					<c:choose>
					
					<c:when test="${depth0.parent==0 && depth0.groupNum==parent.groupNum && depth0.replyNum>0}">
					<div>
					<img id="fold-${depth0.buseoNum}" src="/erp/resources/image/minus.png"/>
					<label id="ch-${depth0.buseoName}">${depth0.buseoName }</label>
					<input type="hidden" class="numch-${depth0.buseoName }" value="${depth0.buseoNum }">
					</div>
						<div class="fold-${depth0.buseoName}">
						
						
						<c:forEach var="depth1" items="${lists }">
										
							<c:choose>
							
							
							<c:when test="${depth1.parent==depth0.buseoNum && depth1.replyNum>0 }">
								<div style="margin-left: 20px;">
								<img id="fold-${depth1.buseoNum}" src="/erp/resources/image/minus.png"/>
								<label id="ch-${depth1.buseoName }">${depth1.buseoName }</label>
								<input type="hidden" class="numch-${depth1.buseoName }" value="${depth1.buseoNum }">
								</div>
								<div class="fold-${depth1.buseoNum}">
								
								
									<c:forEach var="depth2" items="${lists}">
																		
									<c:choose>
									
									
										<c:when test="${depth2.parent==depth1.buseoNum && depth2.replyNum>0}">
											<div style="margin-left: 40px;">
											<img id="fold-${depth2.buseoNum}" src="/erp/resources/image/minus.png"/>
											
											<label id="ch-${depth2.buseoName }">${depth2.buseoName }</label>
											<input type="hidden" class="numch-${depth2.buseoName }" value="${depth2.buseoNum }">
											</div>
											<div class="fold-${depth2.buseoNum}">
											
											
												<c:forEach var="depth3" items="${lists }" >
												
													<c:choose>
													
													
													<c:when test="${depth3.parent==depth2.buseoNum && depth3.replyNum>0 }">
														<div style="margin-left: 60px;">
														<img id="fold-${depth3.buseoNum}" src="/erp/resources/image/minus.png"/>
														<label id="ch-${depth3.buseoName }">${depth3.buseoName }</label>
														<input type="hidden" class="numch-${depth3.buseoName }" value="${depth3.buseoNum }">
														
														</div>
														<div class="fold-${depth3.buseoNum}">
												
														<c:forEach var="depth4" items="${lists }">
														
															<c:choose>
															
																<c:when test="${depth4.parent==depth3.buseoNum }">
																	<div style="margin-left: 80px;">
																	<label id="ch-${depth4.buseoName }">${depth4.buseoName }</label>
																	<input type="hidden" class="numch-${depth4.buseoName }" value="${depth4.buseoNum }">
																	</div>
																</c:when>
															</c:choose>
														
														</c:forEach>
														</div>
													</c:when>
													
													
													
													
													
													
													
													<c:when test="${depth3.parent==depth2.buseoNum && depth3.replyNum==0 }">
														<div style="margin-left: 60px;">
														<label id="ch-${depth3.buseoName }">${depth3.buseoName }</label>
														<input type="hidden" class="numch-${depth3.buseoName }" value="${depth3.buseoNum }">
														</div>
													</c:when>
												
													</c:choose>
												</c:forEach>
											</div>
										</c:when>
										
										
										<c:when test="${depth2.parent==depth1.buseoNum && depth2.replyNum==0 }">
											<div style="margin-left: 40px;">
											<label id="ch-${depth2.buseoName }">${depth2.buseoName }</label>
											<input type="hidden" class="numch-${depth2.buseoName }" value="${depth2.buseoNum }">
											</div>
										</c:when>
									</c:choose>
								
									</c:forEach>
								</div>
							</c:when>
							
							
							
							<c:when test="${depth1.parent==depth0.buseoNum &&depth1.replyNum==0 }">
								<div style="margin-left: 20px;">
								<label id="ch-${depth1.buseoName }">${depth1.buseoName }</label>
								<input type="hidden" class="numch-${depth1.buseoName }" value="${depth1.buseoNum }">
								</div>
							</c:when>
							
							</c:choose>
						</c:forEach>
						</div>
								
					</c:when>
					<c:when test="${depth0.parent==0 && depth0.groupNum==parent.groupNum && parent.replyNum==1}">
					<div>
					<label id="ch-${depth0.buseoName }">${depth0.buseoName }</label>
					<input type="hidden" class="numch-${depth0.buseoName }" value="${depth0.buseoNum }">

					</div>
					</c:when>
					</c:choose>
				</c:forEach>
			</c:forEach>
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