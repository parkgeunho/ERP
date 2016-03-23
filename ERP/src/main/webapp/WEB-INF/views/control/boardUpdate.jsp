<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%        
	
	String cp = request.getContextPath();

%>
<link rel="stylesheet" type="text/css" href="/erp/resources/ManagementView.css">

<script>
$('[id^="delBus-"]').click(function(){
	
	ck= "Bus-" + $('.num'+this.id).val();
	var url ="<%=cp%>/boardDeleteControl";
	
	$.post(url,{num:num,ckNum:ck},function(args){
		trim();
	});
	
	
});


$('[id^="delMem-"]').click(function(){
	
	ck= "Mem-" + $('.num'+this.id).val();
	var url ="<%=cp%>/boardDeleteControl";
	
	$.post(url,{num:num,ckNum:ck},function(args){
		trim();
	});
	
	
});



$('[id^="ckBus-"]').click(function(){
	
	
	ck= "Bus-" + $('.num'+this.id).val();
	
	var url = "<%=cp%>/boardSide";
	$.post(url,{num:num,ckNum:ck},function(args){
	$("#boardSide").html(args);
	
	}).error(function(){alert("이미 최하 부서입니다.")});

});


$('[id^="ckMem-"]').click(function(){
	
	
	ck= "Mem-" + $('.num'+this.id).val();
	
	var url = "<%=cp%>/boardSide";
	$.post(url,{num:num,ckNum:ck},function(args){
	$("#boardSide").html(args);
	
	}).error(function(){alert("이미 최하 부서입니다.")});

});





	
</script>


<form name="boardUpdateForm" id="boardUpdateForm" onsubmit="return false">
<div style="width: 740px;margin-left: 30px; padding-top: 10px;">
					<div >게시판설정<br>
					게시판에 대한 정보 및 수정을 할 수 있습니다.<br>
					공지게시판으로 사용하시려면 글쓰기 권한을 관리자 이상으로 지정하세요.<br>
					읽기/쓰기 권한은 바로 적용이 됩니다.
					</div>
					<div style="border-bottom: 1px solid;height: 30px;"></div>
					<div style="float: left; width: 200px; padding-top: 10px; ">
					
						<div style="height: 35px; border-bottom: 1px solid #BDBDBD;" >게시판명</div>
					
					</div>
					
					
					<div style="float: left; padding-top: 10px; width: 540px;">
						<div style="height: 35px; border-bottom: 1px solid #BDBDBD;"><input type="text" id="boardName" name="boardName" value="${boardData.boardName }">
						<input type="hidden" name="num" value="${boardData.listNum }">
						</div>
					
					</div>
					
						<DIV style="float: left; background-color: #EEEEEE; width:350px; height: 470px; margin-top: 10px; overflow-y: auto; overflow-x:hidden; border: 1px solid #D5D5D5; ">
							<div style="height: 50px; width: 350px; border-bottom: 1px solid #BDBDBD; border-top: 1px; solid; line-height: 50px;" align="center">
							
								<div style="width: 229px;float: left;"> 
								<label style="font: bolder; font-size: 20px;">리스트</label> 	
								</div>
								<div style="width: 120px; float: left; border-left: 1px solid #BDBDBD;" align="center">
									<label style="font: bolder; font-size: 20px;">권한 / 삭제</label>
								</div>
							</div>
							<div>
								<c:forEach var="dto" items="${buseoRlist }">
									<c:set var="check" value="no"/>
										<c:forEach var="ck" items="${buseoWlist }">
											<c:if test="${dto.buseoNum==ck.buseoNum }">
												<c:set var="check" value="ok" />
											</c:if>
										</c:forEach>
								<div style="height: 30px;">
									<div style="float: left; width: 230px; background-color: #EEEEEE;">
									<label id="ckBus-${dto.buseoNum }">${dto.buseoName }</label>
									<input type="hidden" name="listNum" value="${dto.buseoNum }" class="numckBus-${dto.buseoNum }">
									</div>
									<div style="float: left; width: 100px;">
										
										<input type="hidden" class="numdelBus-${dto.buseoNum }" value="${dto.buseoNum }">
										<c:if test="${check=='ok' }">
											읽기/쓰기
										</c:if>
										<c:if test="${check=='no' }">
											읽기
										</c:if>
										<img src="/erp/resources/image/xmark.png" id="delBus-${dto.buseoNum }">
									</div>
								</div>
								</c:forEach>
								
								<c:forEach var="dto" items="${memberRlist }">
									<c:set var="checkMember" value="no"/>
										<c:forEach var="ck" items="${memberWlist }">
											<c:if test="${dto.num==ck.num }">
												<c:set var="checkMember"  value="ok"/>
											</c:if>
										</c:forEach>
								<div style="height: 30px;">
									<div id="ckMem-${dto.num }" style="float: left; width :230px;">
									<label >${dto.name }</label>
									<input type="hidden" name="listNum" value="${dto.num }" class="numckMem-${dto.num }">
									</div>
									<div style="widows: 20px;float: left; width:100px;">
										
										<input type="hidden" class="numdelMem-${dto.num }" value="${dto.num }">
										<c:if test="${checkMember=='ok' }">
											읽기/쓰기
										</c:if>
										<c:if test="${checkMember=='no' }">
											읽기
										</c:if>
										<img src="/erp/resources/image/xmark.png" id="delMem-${dto.num }">
									</div>
								</div>
								
								
								
								</c:forEach>
								
							</div>
						</div>
						
						<DIV style="float: left; background-color: #EEEEEE; width:350px;height: 470px; margin-top: 10px; margin-left: 35px; border: 1px solid #D5D5D5;" id="boardSide">
							<div>
								<div style="height: 50px; width: 350px; border-bottom: 1px solid #BDBDBD; border-top: 1px; line-height: 50px;" align="center">
									<label style="font: bolder; font-size: 20px;">정 보</label> 	
								</div>
								<div style="height: 210px; width: 350px;">
								<br/>
								<br/>
								<br/>
								수정 하실 것에 대한 정보가 출력됩니다.<br>
								<br/>
								부서 일 경우 최상위 부서,인원 수가 출력이 되며 <br>
								<br/>
								개인 일 경우 속한 부서정보와 사번이 나옵니다.
								<br/>
								</div>
								
								<div style="height: 210px; width: 350px; border-top: 1px solid #BDBDBD;" align="left">
									
									<div style="height: 50px; width: 350px; border-bottom: 1px solid #BDBDBD; border-top: 1px; line-height: 50px;" align="center">
										<label style="font: bolder; font-size: 20px;">권한 수정</label> 	
									</div>
									
									
									<div style="float: left; width: 110px; margin-top: 60px;">
										글쓰기 권한
									
									</div>
									
									<div style="float: left;width: 110px; margin-top: 40px;">
										쓰기가능<br>
										<c:if test="${ck!=null }">
										<input type="radio"  value="write" checked="checked" name="writeck">
										</c:if>
										
										<c:if test="${ck==null }">
										<input type="radio"  value="write" name="writeck">
										</c:if>
									</div>
								
									<div style="float: left;width: 110px; margin-top: 40px;">
									쓰기불가<br>
										<c:if test="${ck!=null }">
										<input type="radio"  value="non" name="writeck">
										</c:if>
										<c:if test="${ck==null }">
										<input type="radio"  value="non" checked="checked" name="writeck">
										</c:if>
									</div>
								
							
								
								</div>
							</div>
						</div>
						
						
						
						<div align="center">
							<div style="float: left; margin-left:300px; height: 30px;margin-top: 30px;" class="boardManagement" onclick="boardUpdate();" >저장</div > 
							<div style="float: left; height: 30px;margin-top: 30px;" class="boardManagement">취소</div>
						</div>
					
					
				</div>
				
</form>