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
</head>
<body>
<table style="border: 1px solid;">
<tr>
	<td style="width: 250px;">
	<div>
		<div style="border: 1px solid; height: 30px;">
			<div style="float: right; border: 1px solid;"><img src="/erp/resources/image/minus.png">부서삭제</div>
			<div style="float: right; border: 1px solid;"><img src="/erp/resources/image/plus.png">부서추가</div>
			
		</div>
	
		<div style="height: 500px; overflow:scroll; ">
			
		<c:forEach var="depth1" items="${depth1}">
			
			<c:forEach var="buseo" items="${buseoLists}">
				<c:if test="${buseo.depth2=='0' &&buseo.depth1==depth1.depth1}">
					<div>
					<img id="dep-${depth1.depth1 }" src="/erp/resources/image/minus.png">
					<a onclick="$"></a>
					<input type="text" id="in-${depth1.depth1}" value="${buseo.depth1 }" >
					
					
					</div>
				</c:if>
			</c:forEach>
			
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
									<div style="margin-left: 20px;">
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
														<div style="margin-left: 40px;">
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
																		<div style="margin-left: 60px;">
																		<img id="dep-${buseo.depth4 }" src="/erp/resources/image/minus.png">${buseo.depth4 }
																		</div>
																		<div class="dep-${buseo.depth4 }">
																			<c:forEach var="depth5" items="${depth5}">
																				<c:forEach var="buseo" items="${buseoLists}">
																					<c:if test="${buseo.depth4==depth4.depth4 && buseo.depth5==depth5.depth5 }">
																					<div style="margin-left: 80px;">${buseo.depth5 }</div>
																					</c:if>
																				</c:forEach>
																			</c:forEach>
																		</div>
																	</c:when>
																	<c:when test="${buseo.depth3==depth3.depth3&& buseo.depth4==depth4.depth4 && test!='etc' &&buseo.depth5=='0' }">
																		<div style="margin-left:60px;">${buseo.depth4 }</div>
																	</c:when>
																</c:choose>															
															</c:forEach>
														</c:forEach>
													</div>	
													</c:when>
													
													<c:when test="${buseo.depth2==depth2.depth2 && buseo.depth3==depth3.depth3 && test!='etc' && buseo.depth4=='0' }">
														<div style="margin-left: 40px;">${buseo.depth3}</div>
													</c:when>
												</c:choose>
											
											</c:forEach>
										</c:forEach>
									</div>
								</c:when>
								<c:when test="${depth2.depth2==buseo.depth2 && test!='etc' &&buseo.depth3=='0' }">
									<div style="margin-left: 20px;">${buseo.depth2 }</div>
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
	
	<td style="width: 250px;">
		<div>
			<div style="height: 30px;">부서정보</div>
			<div style="height: 500px;">
				<div style="padding-top: 30px;">부서명</div>
			
			
			</div>
		</div>
		
	
	
	
	</td>
</tr>
<tr>
<td>
확인버튼
</td>
</tr>
</table>
</body>
</html>