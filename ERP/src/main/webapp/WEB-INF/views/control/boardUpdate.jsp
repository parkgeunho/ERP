<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%        
	
	String cp = request.getContextPath();

%>
<link rel="stylesheet" type="text/css" href="/erp/resources/ManagementView.css">

<script>

$('[id^="ckBus-"]').click(function(){
	
	
	ck= "Bus-" + $('.num'+this.id).val();
	alert(ck);
	var url = "<%=cp%>/boardSide";
	$.post(url,{num:num,ckNum:ck},function(args){
	$("#boardSide").html(args);
	
	}).error(function(){alert("이미 최하 부서입니다.")});

});
	
</script>


<form name="boardUpdateForm" id="boardUpdateForm">
<div style="width: 740px;margin-left: 30px; padding-top: 10px;">
					<div >게시판설정<br>
					게시판에 대한 정보 및 수정을 할 수 있습니다.<br>
					공지게시판으로 사용하시려면 글쓰기 권한을 관리자 이상으로 지정하세요.<br>
					</div>
					<div style="border-bottom: 1px solid;height: 30px;"></div>
					<div style="float: left; width: 200px; padding-top: 10px; ">
					
						<div style="height: 35px; border-bottom: 1px solid;" >게시판명</div>
					
					</div>
					
					
					<div style="float: left; padding-top: 10px; width: 540px;">
						<div style="height: 35px; border-bottom: 1px solid;"><input type="text" id="boardName" name="boardName" value="${boardData.boardName }">
						<input type="hidden" name="num" value="${boardData.listNum }">
						</div>
					
					</div>
					
						<DIV style="float: left; background-color: yellow; width:350px; height: 470px; margin-top: 10px;">
							<div style="height: 30px; width: 350px; border-bottom: 1px solid; border-top: 1px; solid;">
							권한
							</div>
							<div>
								<c:forEach var="dto" items="${buseoRlist }">
								<div>
									<div style="float: left;">
									<label id="ckBus-${dto.buseoNum }">${dto.buseoName }</label>
									<input type="hidden" name="listNum" value="${dto.buseoNum }" class="numckBus-${dto.buseoNum }">
									</div>
									<div style="widows: 20px;float: left;">
										<c:forEach var="ck" items="${buseoWlist }">
											<c:choose>
												<c:when test="${ck.buseoNum!=dto.buseoNum }">
												읽기
												</c:when>
												
												<c:when test="${ck.buseoNum==dto.buseoNum }">
												읽기/쓰기
												</c:when>
											</c:choose>
										</c:forEach>
									</div>
								</div>
								</c:forEach>
							</div>
						</div>
						
						<DIV style="float: left; background-color: aqua; width:350px;height: 470px; margin-top: 10px; margin-left: 40px;" id="boardSide">
							<div style="height: 30px; width: 350px; border-bottom: 1px solid; border-top: 1px; solid;">
							수정
							</div>
							<div>
							<input type="radio" onclick="trim()" value="앙">
							</div> 
						</div>
						
						
						
							<div style="float: left; height: 30px;margin-top: 30px;" class="boardManagement" onclick="boardUpdate();" >저장</div > <div style="float: left;">취소</div>
					
					
					
				</div>
				
</form>