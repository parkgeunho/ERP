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
<link rel="stylesheet" type="text/css" href="/erp/resources/insaview.css">


<script>
$(document).ready(function(){
	
	$('[id^="dep-"]').click(function(){
		
     var src = ($(this).attr('src')==='/erp/resources/image/minus.png') ?'/erp/resources/image/plus.png':'/erp/resources/image/minus.png';
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
		<div style="height: 740px; overflow:scroll;">
			
		<c:forEach var="depth1" items="${depth1}">
				<c:set var="test" value="${depth1.depth1}"/>
				<c:forEach var="dep1" items="${depth1etc }">
					<c:if test="${test==dep1.depth1 }">
						<c:set var="test1" value="etc"/>
					</c:if>
				</c:forEach>
			<c:forEach var="buseo" items="${buseoLists}">
			
				<c:if test="${buseo.depth2=='0' &&buseo.depth1==depth1.depth1 && test1=='etc'}">
					<div>
					<img id="dep-${depth1.depth1 }" src="/erp/resources/image/minus.png">${buseo.depth1 }
					</div>
				</c:if>
			
			
			<!-- 하위 목차 띄우기 시작 닫기를 위해 div로 감쌈 -->
			<div class="dep-${depth1.depth1 }">
				<!-- 두번째 부서 명 출력 -->
				<c:set var="dept2" value="1"/>
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
									<div style="margin-left: 40px;">
									<img id="dep-${buseo.depth2 }" src="/erp/resources/image/minus.png">
									${buseo.depth2 }
									</div>
									<div class="dep-${buseo.depth2 }" style="display: block;">
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
														<div style="margin-left: 80px;">
														<img id="dep-${buseo.depth3 }" src="/erp/resources/image/minus.png">${buseo.depth3}</div>
													<div class="dep-${buseo.depth3 }">
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
																		<div style="margin-left: 120px;">
																		<img id="dep-${buseo.depth4 }" src="/erp/resources/image/minus.png">${buseo.depth4 }
																		</div>
																		<div class="dep-${buseo.depth4 }">
																			<c:forEach var="depth5" items="${depth5}">
																				<c:forEach var="buseo" items="${buseoLists}">
																					<c:if test="${buseo.depth4==depth4.depth4 && buseo.depth5==depth5.depth5 }">
																					<div style="margin-left: 160px;">${buseo.depth5 }</div>
																					</c:if>
																				</c:forEach>
																			</c:forEach>
																		</div>
																	</c:when>
																	<c:when test="${buseo.depth3==depth3.depth3&& buseo.depth4==depth4.depth4 && test!='etc' &&buseo.depth5=='0' }">
																		<div style="margin-left: 120px;">${buseo.depth4 }</div>
																	</c:when>
																</c:choose>															
															</c:forEach>
														</c:forEach>
													</div>	
													</c:when>
													
													<c:when test="${buseo.depth2==depth2.depth2 && buseo.depth3==depth3.depth3 && test!='etc' && buseo.depth4=='0' }">
														<div style="margin-left: 80px;">${buseo.depth3}</div>
													</c:when>
												</c:choose>
											
											</c:forEach>
										</c:forEach>
									</div>
								</c:when>
								<c:when test="${depth2.depth2==buseo.depth2 && test1!='etc' &&buseo.depth3=='0' }">
								<div style="margin-left: 40px;">${buseo.depth2 }</div>
								</c:when>
							</c:choose>
						</c:forEach>
					
					
				</c:forEach>
				<!-- 두번째 부서 명 에다가 하위부서가 있으면 +를 붙여주기 -->
				
			
				
			</div>
				<c:if test="${buseo.depth2=='0' &&buseo.depth1==depth1.depth1 && test!='etc'}">
				<div>${buseo.depth1 }</div>
				</c:if>
			</c:forEach>
			<!-- 하위 목차 띄우기 시작 닫기를 위해 div로 감쌈 -->
			
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
			
			<div style="float: left;height: 25px" class="button">부서관리</div>		
			<div class="button" style="float: left;height: 25px;margin-left: 10px;" >사원등록</div>			
			</div>
			
			<div style="padding-top :130px;">
				<table style="margin-left: 20px;"  cellpadding="0" cellspacing="0">
				
					<tr style="height: 35px;"class="op">
						<td style="width: 150px;">사원번호</td>
						<td style="width: 200px;">이름</td>
						<td style="width: 250px;">사내전화</td>
						<td style="width: 250px;">휴대전화</td>
						<td style="width: 100px;">직급</td>
						<td style="width: 250px;">부서</td>
						<td style="width: 105px;">근태</td>
					</tr>
					
					<tr style="height: 35px;" class="data">
						<td style="width: 150px;">사원번호</td>
						<td style="width: 200px;">이름</td>
						<td style="width: 250px;">사내전화</td>
						<td style="width: 250px;">휴대전화</td>
						<td style="width: 100px;">직급</td>
						<td style="width: 250px;">부서</td>
						<td style="width: 105px;">근태</td>
					</tr>
					
					
					<tr style="height: 35px;" class="data">
						<td style="width: 150px;">사원번호</td>
						<td style="width: 200px;">이름</td>
						<td style="width: 250px;">사내전화</td>
						<td style="width: 250px;">휴대전화</td>
						<td style="width: 100px;">직급</td>
						<td style="width: 250px;">부서</td>
						<td style="width: 105px;">근태</td>
					</tr>
					
					
					<tr style="height: 35px;" class="data">
						<td style="width: 150px;">사원번호</td>
						<td style="width: 200px;">이름</td>
						<td style="width: 250px;">사내전화</td>
						<td style="width: 250px;">휴대전화</td>
						<td style="width: 100px;">직급</td>
						<td style="width: 250px;">부서</td>
						<td style="width: 105px;">근태</td>
					</tr>
					
					
					
					<tr style="height: 35px;" class="data">
						<td style="width: 150px;">사원번호</td>
						<td style="width: 200px;">이름</td>
						<td style="width: 250px;">사내전화</td>
						<td style="width: 250px;">휴대전화</td>
						<td style="width: 100px;">직급</td>
						<td style="width: 250px;">부서</td>
						<td style="width: 105px;">근태</td>
					</tr>
					
					
					
					<tr style="height: 35px;" class="data">
						<td style="width: 150px;">사원번호</td>
						<td style="width: 200px;">이름</td>
						<td style="width: 250px;">사내전화</td>
						<td style="width: 250px;">휴대전화</td>
						<td style="width: 100px;">직급</td>
						<td style="width: 250px;">부서</td>
						<td style="width: 105px;">근태</td>
					</tr>
					
					
					
					<tr style="height: 35px;" class="data">
						<td style="width: 150px;">사원번호</td>
						<td style="width: 200px;">이름</td>
						<td style="width: 250px;">사내전화</td>
						<td style="width: 250px;">휴대전화</td>
						<td style="width: 100px;">직급</td>
						<td style="width: 250px;">부서</td>
						<td style="width: 105px;">근태</td>
					</tr>
					
					
					
					<tr style="height: 35px;" class="data">
						<td style="width: 150px;">사원번호</td>
						<td style="width: 200px;">이름</td>
						<td style="width: 250px;">사내전화</td>
						<td style="width: 250px;">휴대전화</td>
						<td style="width: 100px;">직급</td>
						<td style="width: 250px;">부서</td>
						<td style="width: 105px;">근태</td>
					</tr>
					
					
					
					<tr style="height: 35px;" class="data">
						<td style="width: 150px;">사원번호</td>
						<td style="width: 200px;">이름</td>
						<td style="width: 250px;">사내전화</td>
						<td style="width: 250px;">휴대전화</td>
						<td style="width: 100px;">직급</td>
						<td style="width: 250px;">부서</td>
						<td style="width: 105px;">근태</td>
					</tr>
					
					
					
					
					

					
				</table>
			</div>
			
		</div>
	</div>
</div>



</body>
</html>