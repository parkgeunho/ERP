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

<link rel="stylesheet" type="text/css" href="/erp/resources/insaview.css">
</head>
<body>
<div  style="width:1840px; height: 807px;">
	
	<!-- 왼쪽 부서 관련  -->
	<div style="width: 500px;float: left;">
		<div class="buseo" >
		부서
		</div>
		<div style="height: 740px;">
			
			<c:forEach var="depth1" items="${depth1}">
				<c:forEach var="buseo" items="${buseoLists}">
					<c:if test="${buseo.depth2 eq '0' && depth1.depth1==buseo.depth1}">
						<div>
						<img align="middle" src="/erp/resources/image/plus.png">
						${buseo.depth1}<br>
						</div>
					</c:if>
				</c:forEach>
				
				<div>
				<c:forEach var="depth2" items="${depth2}">
						<c:forEach var="depth2etc" items="${depth2etc }" >
								<c:forEach var="buseo" items="${buseoLists}">
									<c:choose>
										<c:when test="${buseo.depth3 == '0' 
										&& buseo.depth2 != '0' && 
										depth2.depth2 != depth2etc.depth2
										&& buseo.depth2 != depth2.depth2
										&& buseo.depth2 != depth2etc.depth2}">
										<div>
										${buseo.depth2 }
										</div>
										</c:when>
										<c:when test="${buseo.depth3 == '0'
										 && buseo.depth2 != '0'  
										 && depth2.depth2==depth2etc.depth2
										 && buseo.depth2==depth2.depth2
										 }">
										<div>
										<img align="middle" src="/erp/resources/image/plus.png">
										${buseo.depth2 }
										</div>
											<div>
												<c:forEach var="depth3" items="${depth3}">
													<c:forEach var="depth3etc" items="${depth3etc }">
														<c:forEach var="buseo1" items="${buseoLists}">
															<c:choose>
																<c:when test="${buseo.depth4 == '0' 
																&& buseo.depth3 != '0'  
																&& depth3.depth3 != depth3etc.depth3
																&& buseo1.depth3 == depth3.depth3
																&& buseo1.depth2 == buseo.depth2
																}">
																<div>
																${buseo1.depth3 }
																</div>
																</c:when>
															
															
															
																<c:when test="${buseo.depth4 == '0'
																 && buseo.depth3 != '0'  
																 && depth3.depth3==depth3etc.depth3
																 && buseo1.depth3==depth3.depth3
																 && buseo1.depth2==buseo.depth2
																 }">
																<div>
																<img align="middle" src="/erp/resources/image/plus.png">
																${buseo1.depth3 }
																</div>
																</c:when>
																
																
															</c:choose>														
														</c:forEach>													
													</c:forEach>
												</c:forEach>
											</div>
										</c:when>
									</c:choose>
								</c:forEach>					
						</c:forEach>			
				</c:forEach>
				</div>	
			</c:forEach>
		
		</div>
	</div>
	
	<div style="width: 1340px; height: 740px;float: left;">
		
		<div class="buseo">
		사원정보
		</div>
		
		
		<div style=" height: 740px; width: 1340px;">
			<div style="margin-top:50px; margin-left: 570px; height: 30px; float: left;">
			<input type="text" name="" style="height: 16px; float: left;">
			
			<span style="margin-left: 5px; float: left;">
				<a href="#"><img align="middle" src="/erp/resources/image/find.png"></a>
			</span>
			
			<div style="float: left;" class="button">Sign up</div>			
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