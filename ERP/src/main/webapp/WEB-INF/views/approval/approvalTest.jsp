<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="/erp/resources/script/editor/ckeditor/ckeditor.js"></script>


<title>Insert title here</title>
 
<script language="JavaScript" type="text/javascript">
 
	var count1 = 0;
	var count2 = 0;
	var count3 = 0;

	//선택된 옵션을 삭제한다.

	function removeOptionSelected(){
		
		var elSel = document.getElementById('selectX');
		var i;
		
		for (i = elSel.length - 1; i>=0; i--) {
			if (elSel.options[i].selected) {
				elSel.remove(i);
			}
		}
	}
 

	//마지막에 새로운 option을 추가한다.
	function appendOptionLast(num){
		  
		var elOptNew = document.createElement('option');
		elOptNew.text = 'Append' + num;
		elOptNew.value = 'append' + num;
		  
		var elSel = document.getElementById('selectX');
	    
		try {
			elSel.add(elOptNew, null); // standards compliant; doesn't work in IE
		}catch(ex) {
			elSel.add(elOptNew); // IE only
		}
	  
	}
 
 
	function menuMove(id,mode) {
	 
		var obj = document.getElementById(id);
		var idx = obj.selectedIndex;
	
		if (idx < 0) 
			idx = obj.selectedIndex = 0;
	
		var opt = obj.options[obj.selectedIndex];
	
		switch (mode) {
			case 'first':
			obj.insertBefore(opt, obj.options[0]);
			break;
			case 'last':
			obj.appendChild(opt);
			break;
			case 'up':
			if (idx > 0) 
				obj.insertBefore(opt, obj.options[idx-1]);
			break;
			case 'down':
			if (idx < obj.options.length-1) 
				obj.insertBefore(obj.options[idx+1], opt);
			break;
			case 'move':
				
			break;
		}
	}
	
	function move(num) {
		
		var elSel = document.getElementById('selectX');
		var i;
		
		for (i = elSel.length - 1; i>=0; i--) {
			if (elSel.options[i].selected) {
				elSel.remove(i);
			}
		}		
		
		var elOptNew = document.createElement('option');
		elOptNew.text = 'Append' + num;
		elOptNew.value = 'append' + num;
		  
		var elSel = document.getElementById('select2');
	    
		try {
			elSel.add(elOptNew, null); // standards compliant; doesn't work in IE
		}catch(ex) {
			elSel.add(elOptNew); // IE only
		}		
		
	}
</script>

</head>
<body>

<form>

 
<select id="selectX" size="30">
	<option value="original1" selected="selected">Orig1</option>
</select>
<br/>
 
<select id="select2" size="20">
	<option value="op1" selected="selected">op1...........</option>
</select>
 
</form>

<div>
	<a href="javascript:menuMove('selectX','first')" >처음</a> |
	<a href="javascript:menuMove('selectX','up')" >위로</a> |
	<a href="javascript:menuMove('selectX','down')" >아래로</a> |
	<a href="javascript:menuMove('selectX','last')" >마지막</a> |
	<input type="button" value="삭제" onclick="removeOptionSelected();" />
	<input type="button" value="추가" onclick="appendOptionLast(count2++);" />
	<input type="button" value="이동" onclick="move(count3++);" />
</div>


<div style="height: 500px; overflow:scroll; " >
			
		<c:forEach var="depth1" items="${depth1}">
			
			<c:forEach var="buseo" items="${buseoLists}">
				<c:if test="${buseo.depth2=='0' &&buseo.depth1==depth1.depth1}">
					<div>
					<img id="dep-${depth1.depth1 }" src="/erp/resources/image/minus.png">
					<label id="edit-${depth1.depth1}" >${buseo.depth1 }</label>
					<input type="hidden" class="edit-${depth1.depth1}" value="depth1">
					
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


</body>
</html>


<!-- <a href="javascript:'" onclick="window.open('http://localhost:8080/erp/approvalCreated','','width=800,height=900');">결재 상신</a>
<input type="button" onclick="window.open('http://localhost:8080/erp/approvalCreated')"> -->

