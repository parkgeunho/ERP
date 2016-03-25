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

</script>

<script type="text/javascript">
var num = 1;
var group = 0;





$(document).ready(function(){
	
	
	
	
	
	
		    $.ajax({
                    url:'boardControlList',
                    type:'POST',
                    
                    error:function(args){
                        
                    },
                    success: function(args){
                    	 $("#boardList").html(args);                           
                    }
	    });
	

		    

		    $('[id^="buseo-"]').click(function(){
		        
		 	   
		 			var folderNum = this.id.substr(5);
		    	
		    	
			       var foldersrc = ($("#folder-"+folderNum).attr('src')=='/erp/resources/insa/folder.png')?'/erp/resources/insa/folder2.png':'/erp/resources/insa/folder.png';
			       $("#folder-"+folderNum).attr('src',foldersrc);
		    });

	
	$('[id^="bus-"]').click(function(){
		
		
		group= "Bus-" + $('.num'+this.id).val();
		var buseoMaxNum = ${buseoMaxNum};
		var memberMaxNum = ${memberMaxNum};
		
		
		 for(var i=1;i<buseoMaxNum+1;i++){
			var v = "bus-"+i;
			
			if($("#"+v).length>0){
				if(v==this.id){
					document.getElementById(this.id).style.backgroundColor = "#E8D9FF";
				}else{
					document.getElementById(v).style.backgroundColor = "#F6F6F6";
				}
				
			}
		} 
		 for(var i=1;i<memberMaxNum+1;i++){
				var v = "Mem-"+i;
				
				if($("#"+v).length>0){
					
						document.getElementById(v).style.backgroundColor = "#F6F6F6";
					
					
				}
			} 
	
	});

	
	
	
	$('[id^="Mem-"]').click(function(){
		

		var buseoMaxNum = ${buseoMaxNum};
		var memberMaxNum = ${memberMaxNum};
		group= "Mem-" + $('.num'+this.id).val();

		 for(var i=1;i<memberMaxNum+1;i++){
			var v = "Mem-"+i;
			
			if($("#"+v).length>0){
				if(v==this.id){
					document.getElementById(this.id).style.backgroundColor = "#E8D9FF";
				}else{
					document.getElementById(v).style.backgroundColor = "#F6F6F6";
				}
				
			}
		} 
		 for(var i=1;i<buseoMaxNum+1;i++){
				var v = "bus-"+i;
				
				if($("#"+v).length>0){
					
						document.getElementById(v).style.backgroundColor = "#F6F6F6";
					
					
				}
			} 

	
	});
	
});



function buseoManagement(){
	
	window.open("buseoManagement","","width=300px,height=580px");
	
}


	
function created(){

	var url = "<%=cp%>/boardListCreate";
	$.post(url,{num:num},function(args){
	$("#boardList").html(args);
	
	}).error(function(){alert("이미 최하 부서입니다.")});
}

function deleted(){


	
	var del;
					del=confirm("모든 게시물이 삭제됩니다. 진행하시겠습니까?");
	
	if(del==true){
		var url = "<%=cp%>/boardListDelete";
		$.post(url,{num:num},function(args){
		$("#boardList").html(args);
		
		});
		
		
	}else{
		return;
	}
	

	
}

function trim(){
	
	var url = "<%=cp%>/boardUpdate";

	
	$.post(url,{listNum:num},function(args){
	$("#boardUpdate").html(args);
	
	});
	
	
	
}

function boardUpdate(){
	
	var myForm = $("#boardUpdateForm").serialize();

	var url = "<%=cp%>/boardChange";
	$.post(url,myForm,function(args){
		window.location="/erp/con";
	}); 
}

function Add(){
	
	var url = "<%=cp%>/boardAdd";
	$.post(url,{group:group,num:num},function(args){
		$("#boardUpdate").html(args);	
	}).error(function(){alert("이미 권한이 있습니다.")});
	
	
}




</script>




</head>
<body onload="num=0">
<div  style="width:1570px; height: 807px;">
	<div class="buseo" >게시판관리</div>
	
	<!-- 왼쪽 부서 관련  -->
	<div style="width: 250px;float: left; margin-top: 10px; height: 720px;background-color: #F6F6F6; margin-left: 50px;border: 1px solid #D5D5D5;">
		
			<div style="height: 30px;" >
				<div class="boardManagement" onclick="deleted();"><img src="/erp/resources/image/minus-white.png" >&nbsp;삭제</div>
				<div class="boardManagement" onclick="created();"><img src="/erp/resources/image/plus-white.png" >&nbsp;추가</div>
			</div>		
			<div id="boardList" style="background-color: #F6F6F6; padding-left:30px; padding-top: 10px;border: 1px solid #D5D5D5; height: 680px; overflow-y: scroll; width: px; ">
				
			</div>
	</div>
	
	<div style="width: 1250px; height: 720px;float: left;">
		
		<div style=" height: 720px; width: 1250px; margin-left: 50px;">
		
			<div style="margin-top: 10px; margin-left: 10px; height: 720px; border: 1px solid #D5D5D5; width: 300px; float: left;">
				
			<div style="overflow-y:scroll; height: 720px; width: 300px; background-color: #F6F6F6; ">
			<c:forEach var="parent" items="${buseoParent }">
				<c:forEach var="depth0" items="${buseolists }">
					<c:choose>
					
					<c:when test="${depth0.parent==0 && depth0.groupNum==parent.groupNum && depth0.replyNum>0}">
					<div>
					<img id="buseo-${depth0.buseoNum}" src="/erp/resources/image/minus.png"/>
					<img id="folder-${depth0.buseoNum}" src="/erp/resources/insa/folder.png"/>
					<label id="bus-${depth0.buseoNum}" style="font-weight: bold;" >${depth0.buseoName }</label>
					<input type="hidden" class="numbus-${depth0.buseoNum }" value="${depth0.buseoNum }">
					</div>
						<div class="buseo-${depth0.buseoNum}">
					
							<c:forEach var="member1" items="${memberList }">
								<c:if test="${member1.depth1==depth0.buseoNum && member1.depth2=='no' }">
									<div  style="margin-left: 10px; color: #6B9900" >
									<img src="/erp/resources/insa/ㄴ1.png" align="middle">
									<img src="/erp/resources/image/team_test.png" alt="멍미" align="middle"/> 
									<label id="Mem-${member1.num }" >${member1.name }</label>
									
									</div>
									<input type="hidden" class="numMem-${member1.num }" value="${member1.num }">
								</c:if>
							
							</c:forEach>
						
						
						<c:forEach var="depth1" items="${buseolists }">
										
							<c:choose>
							
							
							<c:when test="${depth1.parent==depth0.buseoNum && depth1.replyNum>0 }">
								<div style="margin-left: 20px;">
								<img id="buseo-${depth1.buseoNum}" src="/erp/resources/image/minus.png"/>
								<img id="folder-${depth1.buseoNum}" src="/erp/resources/insa/folder.png"/>
								<label id="bus-${depth1.buseoNum }">${depth1.buseoName }</label>
								<input type="hidden" class="numbus-${depth1.buseoNum }" value="${depth1.buseoNum }">
								</div>
								<div class="buseo-${depth1.buseoNum}">
								
									<c:forEach var="member2" items="${memberList }">
									<c:if test="${member2.depth2==depth1.buseoNum && member2.depth3=='no' }">
										<div style="margin-left: 30px; color: #6B9900" >
										<img src="/erp/resources/insa/ㄴ1.png" align="middle">
										<img src="/erp/resources/image/team_test.png" alt="멍미" align="middle"/>
										<label id="Mem-${member2.num }"> ${member2.name }</label>
										</div>
										<input type="hidden" class="numMem-${member2.num }" value="${member2.num }">
									</c:if>
								
									</c:forEach>
								
								
								
								
								
								
								
								
									<c:forEach var="depth2" items="${buseolists}">
																		
									<c:choose>
									
									
										<c:when test="${depth2.parent==depth1.buseoNum && depth2.replyNum>0}">
											<div style="margin-left: 40px;">
											<img id="buseo-${depth2.buseoNum}" src="/erp/resources/image/minus.png"/>
											<img id="folder-${depth2.buseoNum}" src="/erp/resources/insa/folder.png"/>
											<label id="bus-${depth2.buseoNum }" > ${depth2.buseoName }</label>
											<input type="hidden" class="numbus-${depth2.buseoNum }" value="${depth2.buseoNum }">
											</div>
											
											<div class="buseo-${depth2.buseoNum}">
											
											
											
											
											
												 <c:forEach var="member3" items="${memberList }">
												<c:if test="${member3.depth3==depth2.buseoNum && member3.depth4=='no' }">
													<div  style="margin-left: 35px; color: #6B9900" >
													<img src="/erp/resources/insa/ㄴ1.png" align="middle">
													<img src="/erp/resources/image/team_test.png" alt="멍미" align="middle"/>
													<label id="Mem-${member3.num }"> ${member3.name }</label>
													
													</div>
													<input type="hidden" class="numMem-${member3.num }" value="${member3.num }">
												</c:if>
											
												</c:forEach> 
											
											
											
											
											
											
											
												<c:forEach var="depth3" items="${buseolists }" >
												
													<c:choose>
													
													
													<c:when test="${depth3.parent==depth2.buseoNum && depth3.replyNum>0 }">
														<div style="margin-left: 60px;">
														<img id="buseo-${depth3.buseoNum}" src="/erp/resources/image/minus.png"/>
														<img id="folder-${depth3.buseoNum}" src="/erp/resources/insa/folder.png"/>
														<label id="bus-${depth3.buseoNum }"> ${depth3.buseoName }</label>
														<input type="hidden" class="numbus-${depth3.buseoNum }" value="${depth3.buseoNum }">
														
														</div>
														<div class="buseo-${depth3.buseoNum}">
															
															
																<c:forEach var="member4" items="${memberList }">
																<c:if test="${member4.depth4==depth3.buseoNum && member4.depth5=='no' }">
																	<div  style="margin-left: 60px;  color: #6B9900" >
																	<img src="/erp/resources/insa/ㄴ1.png" align="middle">
																	<img src="/erp/resources/image/team_test.png" alt="멍미" align="middle"/> 
																	<label id="Mem-${member4.num }">${member4.name }</label>
																	
																	</div>
																	<input type="hidden" class="numMem-${member4.num }" value="${member4.num }">
																</c:if>
															
																</c:forEach>
															
															
														<c:forEach var="depth4" items="${buseolists }">
														
															<c:choose>
															
																<c:when test="${depth3.buseoNum==depth4.parent }">
																	<div style="margin-left: 70px;">
																	<img src="/erp/resources/insa/ㄴ1.png" align="middle">
																	<img id="folder-${depth0.buseoNum}" src="/erp/resources/insa/folder2.png"/>
																	
																	<label id="bus-${depth4.buseoNum }"> ${depth4.buseoName }</label>
																	<input type="hidden" class="numbus-${depth4.buseoNum }" value="${depth4.buseoNum }">
																	</div>
																	<div class="buseo-${depth4.buseoNum }">
																	
																	
																				<c:forEach var="member5" items="${memberList }">
																				<c:if test="${member5.depth5==depth4.buseoNum }">
																					<div  style="margin-left: 90px; color: #6B9900" >
																					<img src="/erp/resources/insa/ㄴ1.png" align="middle">
																					<img src="/erp/resources/image/team_test.png" alt="멍미" align="middle"/>
																					<label id="Mem-${member5.num }">${member5.name }</label>
																					 
																					</div>
																					<input type="hidden" class="numMem-${member5.num }" value="${member5.num }">
																				</c:if>
																			
																				</c:forEach>
										 
																	
																	</div>
																</c:when>
															</c:choose>
														
														</c:forEach>
														</div>
													</c:when>
													
													
													
													
													
													
													
													<c:when test="${depth3.parent==depth2.buseoNum && depth3.replyNum==0 }">
														<div style="margin-left: 35px;">
														<img src="/erp/resources/insa/ㄴ1.png" align="middle">
														<img id="folder-${depth0.buseoNum}" src="/erp/resources/insa/folder2.png"/>
														<label id="bus-${depth3.buseoNum }" > ${depth3.buseoName }</label>
														<input type="hidden" class="numbus-${depth3.buseoNum }" value="${depth3.buseoNum }">
														</div>
														
														<div>
																<c:forEach var="member4" items="${memberList }">
																<c:if test="${member4.depth4==depth3.buseoNum && member4.depth4=='no' }">
																	<div  style="margin-left: 35px; color: #6B9900" >
																	<img src="/erp/resources/insa/ㄴ1.png" align="middle">
																	<img src="/erp/resources/image/team_test.png" alt="멍미" align="middle"/> 
																	<label id="Mem-${member4.num }" >${member4.name }</label>
																																	
																	</div>
																	<input type="hidden" class="numMem-${member4.num }" value="${member4.num }">
																</c:if>
															
																</c:forEach>
														
														
														</div>
														
													</c:when>
												
													</c:choose>
												</c:forEach>
											</div>
										</c:when>
										
										
										<c:when test="${depth2.parent==depth1.buseoNum && depth2.replyNum==0 }">
											<div style="margin-left: 30px;">
											<img src="/erp/resources/insa/ㄴ1.png" align="middle">
											<img src="/erp/resources/insa/folder2.png" align="middle">
											<label id="bus-${depth2.buseoNum }" >${depth2.buseoName }</label>
											<input type="hidden" class="numbus-${depth2.buseoNum }" value="${depth2.buseoNum }">
											</div>
											
											<div>
											
												<c:forEach var="member3" items="${memberList }">
													<c:if test="${member3.depth3==depth2.buseoNum && member3.depth4=='no' }">
														<div  style="margin-left: 30px; color: #6B9900" >
														<img src="/erp/resources/insa/ㄴ1.png" align="middle">
														<img src="/erp/resources/image/team_test.png" alt="멍미" align="middle"/>
														<label id="Mem-${member3.num }">${member3.name }</label>
														 
														</div>
														<input type="hidden" class="numMem-${member3.num }" value="${member3.num }">
													</c:if>
												
												</c:forEach>
											
											</div>
										</c:when>
									</c:choose>
								
									</c:forEach>
								</div>
							</c:when>
							
							
							
							<c:when test="${depth1.parent==depth0.buseoNum &&depth1.replyNum==0 }">
								<div style="margin-left: 10px;">
								<img src="/erp/resources/insa/ㄴ1.png" align="middle">
								<img src="/erp/resources/insa/folder2.png" align="middle">
								<label id="bus-${depth1.buseoNum }" >${depth1.buseoName }</label>
								<input type="hidden" class="numbus-${depth1.buseoNum }" value="${depth1.buseoNum }">
								</div>
								<div>
								<c:forEach var="member2" items="${memberList }">
									<c:if test="${member2.depth2==depth1.buseoNum && member2.depth3=='no' }">
										<div  style="margin-left: 30px;  color: #6B9900" >
										<img src="/erp/resources/image/team_test.png" alt="멍미" align="middle"/> 
										<label id="Mem-${member2.num }" >${member2.name }</label>
										
										</div>
										<input type="hidden" class="numMem-${member2.num }" value="${member2.num }">
									</c:if>
								
								</c:forEach>
								</div>
								
							</c:when>
							
							</c:choose>
						</c:forEach>
						</div>
								
					</c:when>
					<c:when test="${depth0.parent==0 && depth0.groupNum==parent.groupNum && parent.replyNum==1}">
					<div>
					<label id="bus-${depth0.buseoNum }">${depth0.buseoName }</label>
					<input type="hidden" class="numbus-${depth0.buseoNum }" value="${depth0.buseoNum }">

					</div>
					<div>
						<c:forEach var="member1" items="${memberList }">
							<c:if test="${member1.depth1==depth0.buseoNum && member1.depth2=='no' }">
								<div  style="margin-left: 30px; color: #6B9900" >
								<img src="/erp/resources/image/team_test.png" alt="멍미" align="middle"/> 
								<label id="Mem-${member1.num }" >${member1.name }</label>
								
								</div>
								<input type="hidden" class="numMem-${member1.num }" value="${member1.num }">
							</c:if>
						
						</c:forEach>
					</div>
					
					
					
					
					
					
					
					</c:when>
					</c:choose>
				</c:forEach>
			</c:forEach>
			</div>
		</div>
			<div style="height: 100px;width:30px;line-height:100px; float: left;  margin-top: 25%" class="buttonsq" onclick="Add()">
				<label style="font-size: 25px; font-weight: bolder;">+</label>
			</div>
		
			<div style="width: 800px; height: 720px;  float: left; background-color: #F6F6F6;  border: 1px solid #D5D5D5; margin-top: 10px;" id="boardUpdate">
			
				<div style="width: 740px;margin-left: 30px; padding-top: 10px;">
					<div >게시판설정<br>
					게시판에 대한 정보 및 수정을 할 수 있습니다.<br>
					공지게시판으로 사용하시려면 글쓰기 권한을 관리자 이상으로 지정하세요.<br>
					읽기/쓰기 권한은 바로 적용이 됩니다.
					</div>
					<div style="border-bottom: 1px solid;height: 30px;"></div>
					<div style="float: left; width: 200px; padding-top: 10px; ">
					
						<div style="height: 35px; border-bottom: 1px solid #D5D5D5;" >게시판명</div>
					
					</div>
					
					
					<div style="float: left; padding-top: 10px; width: 540px;">
						<div style="height: 35px; border-bottom: 1px solid #D5D5D5;">
						<input type="text" id="boardName" name="boardName" value="게시판 이름이 나오는 곳입니다." style="width: 300px;" readonly="readonly">
						</div>
					
					</div>
					
						<DIV style="float: left; background-color: #EEEEEE; width:350px; height: 470px; margin-top: 10px; border: 1px solid #D5D5D5">
							<div style="height: 50px; width: 350px; border-bottom: 1px solid #BDBDBD; border-top: 1px; solid; line-height: 50px;" align="center">
							
								<div style="width: 229px;float: left;"> 
								<label style="font: bolder; font-size: 20px;">리스트</label> 	
								</div>
								<div style="width: 120px; float: left; border-left: 1px solid #BDBDBD;" align="center">
									<label style="font: bolder; font-size: 20px;">권한 / 삭제</label>
								</div>
							</div>
							<div>
								권한을 가진 사원 및 부서 가 출력됩니다.
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
								
								<div style="height: 210px; width: 350px; border-top: 1px solid;">
									
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
			
			
			
				
			</div>
			
		</div>
	</div>
</div>



</body>
</html>