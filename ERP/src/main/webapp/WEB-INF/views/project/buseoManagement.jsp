<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%        
	
	String cp = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="/erp/resources/insa/jquery.session.js"></script>
<script src="/erp/resources/insa/jquery.mCustomScrollbar.concat.min.js"></script>
<link rel="stylesheet" type="text/css" href="/erp/resources/ManagementView.css">
<link rel="stylesheet" type="text/css" href="/erp/resources/jquery.mCustomScrollbar.css">
<script>
$(document).ready(function() {
	//스크롤바 변경
	  $(".content").mCustomScrollbar();

	
	//하위 접고 열기 +  이미지 변경
	  $('[id^="dep-"]').click(function(){
			
		     var src = ($(this).attr('src')==='/erp/resources/image/minus.png') ?'/erp/resources/image/plus.png':'/erp/resources/image/minus.png';
		     $(this).attr('src',src);
		 
			
				var obj = $('.'+ this.id);
				
				if(obj.css('display')=='none')
					obj.show();
				else
					obj.hide();
				
				
			});
	  	  
	//클릭한 div에 대한 색상 변경
	var dds = $('[id^="edit-"]');

 	$('[id^="edit-"]').click(function(){
 		
 		for(var i=1;i<dds.length+1;i++){
 			
 			
 			var v = "edit-"+i;
 			if(v==this.id){
 				
 				document.getElementById(this.id).style.backgroundColor = "#E8D9FF";
 				
 			}else{
 				
 				document.getElementById(v).style.backgroundColor = "#FFFFFF";
 			}
 			
 		} 		
 		
 		/* document.getElementById(this.id).style.backgroundColor = "#E8D9FF"; */
 		//클릭한 것을 세션에 넣어줌
		var obj = $('.num'+this.id).val();
		$.session.set("num",obj);
				
	});
	 
	
	//클릭을 했을 시 인풋 박스로 변경 시킨다.
	$('[id^="edit-"]').dblclick(function(){
		
		var obj = $('.'+ this.id).val();
		
		
		 
		var av = document.getElementById(this.id).innerText;
		 document.getElementById(this.id).innerHTML= "<input type='text' value="+av+" name="+obj+ ">"; 
	
	});

});
</script>
<script type="text/javascript">
function deleted(){
	
	

	

	var f = document.myForm;
	var del;
					del=confirm("정말 삭제하시겠습니까?");
	
	if(del==true){
		f.action = "<%=cp%>/buseodelete";
	    f.submit();
		
		
	}else{
		return;
	}
	
	
	 
	
	
}

</script>

</head>
<body>



<form name="myForm">
<table >
<tr>
	<td style="width: 300px;">
	<div>
		<div style="height: 30px;">
			<div class="buseoManagement" onclick="deleted();"><img src="/erp/resources/image/minus-white.png" >&nbsp;부서삭제</div>
			<div class="buseoManagement" onclick="insert();"><img src="/erp/resources/image/plus-white.png" >&nbsp;부서추가</div>
			
		</div>
	
		<div style="height: 500px;" class="mCustomScrollbar" data-mcs-theme="minimal-dark" >
			
		<c:forEach var="depth1" items="${depth1}">
			
			<c:forEach var="buseo" items="${buseoLists}">
				<c:if test="${buseo.depth2=='0' &&buseo.depth1==depth1.depth1}">
				
					<div>
					<img id="dep-${buseo.buseoNum }" src="/erp/resources/image/minus.png">
					<label id="edit-${buseo.buseoNum}" >${buseo.depth1 }</label>
					<input type="hidden" class="edit-${buseo.buseoNum}" value="depth1"> <!-- 어디가 변경되는지 알리기 위해서 변경 값을 올려줌 -->
					<input type="hidden" class="numedit-${buseo.buseoNum}" value="${buseo.buseoNum }" >
					</div>
				</c:if>
			</c:forEach>
			
			<!-- 하위 목차 띄우기 시작 닫기를 위해 div로 감쌈 -->
			<div class="dep-${buseo.buseoNum }">
				<!-- 두번째 부서 명 출력 -->
				
				<c:forEach var="depth2" items="${depth2}">
					
					<c:set var="test" value="${depth2.depth2}"/> <!-- 두번째 부서중에 하위 부서가 있는 지 없는지를 구분 하기 위한 조건문 -->
						<c:forEach var="dep2" items="${depth2etc}">
							<c:if test="${test==dep2.depth2}">
								<c:set var="test" value="etc"/>
							</c:if>						
						</c:forEach>
						<c:forEach var="buseo" items="${buseoLists}">
							<c:choose>
								<c:when test="${depth2.depth2==buseo.depth2 && test=='etc' &&buseo.depth3=='0' }">
									<div style="margin-left: 20px;">
									<img id="dep-${buseo.buseoNum }" src="/erp/resources/image/minus.png">
									
									<label id="edit-${buseo.buseoNum}">${buseo.depth2 }</label>
									<input type="hidden" class="edit-${buseo.buseoNum}" value="depth2"> <!-- 어디가 변경되는지 알리기 위해서 변경 값을 올려줌 -->
									<input type="hidden" class="numedit-${buseo.buseoNum}" value="${buseo.buseoNum }">
									</div>
									<div class="dep-${buseo.buseoNum }" style="display: block;">
										<c:forEach var="depth3" items="${depth3 }">
											<c:set var="test" value="${depth3.depth3 }"/>
											<c:forEach var="dep3" items="${depth3etc }">
												<c:if test="${test==dep3.depth3 }">
													<c:set var="test" value="etc"/>
												</c:if>
											</c:forEach>
											<c:forEach var="buseo" items="${buseoLists}">
												<c:choose>
													<c:when test="${buseo.depth2==depth2.depth2 && buseo.depth3==depth3.depth3 && test=='etc' && buseo.depth4=='0' }">
														<div style="margin-left: 40px;">
														<img id="dep-${buseo.buseoNum }" src="/erp/resources/image/minus.png">
														<label id="edit-${buseo.buseoNum}">${buseo.depth3 }</label>
														<input type="hidden" class="edit-${buseo.buseoNum}" value="depth3"> <!-- 어디가 변경되는지 알리기 위해서 변경 값을 올려줌 -->
														<input type="hidden" class="numedit-${buseo.buseoNum}" value="${buseo.buseoNum }">
														</div>
														<div class="dep-${buseo.buseoNum }">
														<c:forEach var="depth4" items="${depth4}">
															<c:set var="test" value="${depth4.depth4 }"/>
															<c:forEach var="dep4" items="${depth4etc }">
															<c:if test="${test==dep4.depth4 }">
																<c:set var="test" value="etc"/>
															</c:if>
															</c:forEach>
															<c:forEach var="buseo" items="${buseoLists}">
																<c:choose>
																	<c:when test="${buseo.depth3==depth3.depth3&& buseo.depth4==depth4.depth4 && test=='etc' &&buseo.depth5=='0' }">
																		<div style="margin-left: 60px;">
																		<img id="dep-${buseo.buseoNum }" src="/erp/resources/image/minus.png">
																		<label id="edit-${buseo.buseoNum}">${buseo.depth4 }</label>
																		<input type="hidden" class="edit-${buseo.buseoNum}" value="depth4"> <!-- 어디가 변경되는지 알리기 위해서 변경 값을 올려줌 -->
																		<input type="hidden" class="numedit-${buseo.buseoNum}" value="${buseo.buseoNum }">
																		</div>
																		<div class="dep-${buseo.buseoNum }">
																			<c:forEach var="depth5" items="${depth5}">
																				<c:forEach var="buseo" items="${buseoLists}">
																					<c:choose>
																						<c:when test="${buseo.depth4==depth4.depth4 && buseo.depth5==depth5.depth5 }">
																							<div style="margin-left: 80px;">
																							<label id="edit-${buseo.buseoNum}">${buseo.depth5 }</label>
																							<input type="hidden" class="edit-${buseo.buseoNum}" value="depth5"> <!-- 어디가 변경되는지 알리기 위해서 변경 값을 올려줌 -->
																							<input type="hidden" class="numedit-${buseo.buseoNum}" value="${buseo.buseoNum }">
																							</div>
																						</c:when>
																					</c:choose>
																				</c:forEach>
																			</c:forEach>
																		</div>
																	</c:when>
																	<c:when test="${buseo.depth3==depth3.depth3&& buseo.depth4==depth4.depth4 && test!='etc' &&buseo.depth5=='0' }">
																		
																		<div style="margin-left:60px;">
																		
																		<label id="edit-${buseo.buseoNum}">${buseo.depth4 }</label>
																			<input type="hidden" class="edit-${buseo.buseoNum}" value="depth4"> <!-- 어디가 변경되는지 알리기 위해서 변경 값을 올려줌 -->
																			<input type="hidden" class="numedit-${buseo.buseoNum}" value="${buseo.buseoNum }">
																		
																		</div>
																	</c:when>
																</c:choose>															
															</c:forEach>
														</c:forEach>
													</div>	
													</c:when>
													
													<c:when test="${buseo.depth2==depth2.depth2 && buseo.depth3==depth3.depth3 && test!='etc' && buseo.depth4=='0' }">
														<div style="margin-left: 40px;">
														<label id="edit-${buseo.buseoNum}">${buseo.depth3 }</label>
														<input type="hidden" class="edit-${buseo.buseoNum}" value="depth3"> <!-- 어디가 변경되는지 알리기 위해서 변경 값을 올려줌 -->
														<input type="hidden" class="numedit-${buseo.buseoNum}" value="${buseo.buseoNum}">

														</div>
													</c:when>
												</c:choose>
											
											</c:forEach>
										</c:forEach>
									</div>
								</c:when>
								<c:when test="${depth2.depth2==buseo.depth2 && test!='etc' &&buseo.depth3=='0' }">
									<div style="margin-left: 20px;">

									<label id="edit-${buseo.buseoNum2}">${buseo.depth2 }</label>
									<input type="hidden" class="edit-${buseo.buseoNum}" value="depth2"> <!-- 어디가 변경되는지 알리기 위해서 변경 값을 올려줌 -->
									<input type="hidden" class="numedit-${buseo.buseoNum}" value="${buseo.buseoNum }">
									</div>
								</c:when>
							</c:choose>
						</c:forEach>
					
					
				</c:forEach>
				<!-- 두번째 부서 명 에다가 하위부서가 있으면 +를 붙여주기 -->
			</div>
			<!-- 하위 목차 띄우기 시작 닫기를 위해 div로 감쌈 -->
			
		</c:forEach>	
		</div>
		
	
	
	</div>
	</td>
	

<tr>
<td  width="250px;">
<div class="buseoManagement" style="margin-right: 75px;">확인</div>
</td>
</tr>
<tr>
<td>
	
		
	
	

</td>



</tr>

</table>
</form>
</body>
</html>