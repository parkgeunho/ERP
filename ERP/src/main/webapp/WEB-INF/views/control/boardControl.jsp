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

/* var time = 3000

;           //1초 * 60 * 60
setInterval("teim()", time); */



$(document).ready(function(){
	/* $(".content").mCustomScrollbar(); */
	
	
	
	
	
		    $.ajax({
                    url:'boardControlList',
                    type:'POST',
                    
                    error:function(args){
                        
                    },
                    success: function(args){
                    	 $("#boardList").html(args);                           
                    }
	    });
	
		    $.ajax({
		        url:'boardUpdate',
		        type:'POST',
		        
		        error:function(args){
		            
		        },
		        success: function(args){
		        	 $("#boardUpdate").html(args);                           
		        }
		});
	
	
	
	
	
	
	
	
	

	
	$('[id^="buseo-"]').click(function(){
		 alert("왜안되냐");
	});
	

	
	$('[id^="bus-"]').click(function(){
		
		
		group= "Bus-" + $('.num'+this.id).val();
		alert(group);
	
	});


	
	
	
	$('[id^="Mem-"]').click(function(){
		
		
		group= "Mem-" + $('.num'+this.id).val();
		alert(group);
	
	});
	
});



function buseoManagement(){
	
	window.open("buseoManagement","","width=300px,height=580px");
	
}

function sendIt() {
	
	var url = "<%=cp%>/memberList";
	var searchValue = $("#searchValue").val();
	$("#searchValue").val("");
	
	
	$.post(url,{searchValue:searchValue,num:num},function(args){
	$("#memberList").html(args);
	
	}).error(function(){alert("이미 최하 부서입니다.")});
}
	
function created(){

	var url = "<%=cp%>/boardListCreate";
	$.post(url,{num:num},function(args){
	$("#boardList").html(args);
	
	}).error(function(){alert("이미 최하 부서입니다.")});
}

function deleted(){

	var url = "<%=cp%>/boardListDelete";
	$.post(url,{num:num},function(args){
	$("#boardList").html(args);
	
	});
}

function trim(){
	
	var url = "<%=cp%>/boardUpdate";

	
	$.post(url,{listNum:num},function(args){
	$("#boardUpdate").html(args);
	
	});
	
	
	
}

function boardUpdate(){
	
	var myForm = $("#boardUpdateForm").serialize();
	alert(myForm);
<%-- 	var url = "<%=cp%>/boardUp";
	
	

	$.post(url,myForm,function(args){
		$("#boardUpdate").html(args);
	}); --%>
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
	<div style="width: 240px;float: left; margin-top: 10px;">
		
			<div style="height: 30px;" >
				<div class="boardManagement" onclick="deleted();"><img src="/erp/resources/image/minus-white.png" >&nbsp;삭제</div>
				<div class="boardManagement" onclick="created();"><img src="/erp/resources/image/plus-white.png" >&nbsp;추가</div>
			</div>		
			<div id="boardList" style="background-color: #D4F4FA;margin-left: 10px; padding-left:10px; padding-top: 10px;">
				
			</div>
	</div>
	<div style="height: 30px;" class="boardManagement" onclick="Add()">실험</div>
	<div style="width: 1320px; height: 740px;float: left;">
		
		<div style=" height: 740px; width: 1320px;">
			<div style="margin-top: 10px; margin-left: 10px; height: 730px; border: 1px solid; width: 400px; float: left;">
			<c:forEach var="parent" items="${buseoParent }">
				<c:forEach var="depth0" items="${buseolists }">
					<c:choose>
					
					<c:when test="${depth0.parent==0 && depth0.groupNum==parent.groupNum && depth0.replyNum>0}">
					<div>
					<img id="buseo-${depth0.buseoNum}" src="/erp/resources/image/minus.png"/>
					<label id="bus-${depth0.buseoNum}">${depth0.buseoName }</label>
					<input type="hidden" class="numbus-${depth0.buseoNum }" value="${depth0.buseoNum }">
					</div>
						<div class="buseo-${depth0.buseoNum}">
					
							<c:forEach var="member1" items="${memberList }">
								<c:if test="${member1.depth1==depth0.buseoNum && member1.depth2=='no' }">
									<div id="Mem-${member1.num }" style="margin-left: 30px;">
									사람 ${member1.name }
									</div>
									<input type="hidden" class="numMem-${member1.num }" value="${member1.num }">
								</c:if>
							
							</c:forEach>
						
						
						<c:forEach var="depth1" items="${buseolists }">
										
							<c:choose>
							
							
							<c:when test="${depth1.parent==depth0.buseoNum && depth1.replyNum>0 }">
								<div style="margin-left: 20px;">
								<img id="buseo-${depth1.buseoNum}" src="/erp/resources/image/minus.png"/>
								<label id="bus-${depth1.buseoNum }">${depth1.buseoName }</label>
								<input type="hidden" class="numbus-${depth1.buseoNum }" value="${depth1.buseoNum }">
								</div>
								<div class="buseo-${depth1.buseoNum}">
								
								
									<c:forEach var="depth2" items="${buseolists}">
																		
									<c:choose>
									
									
										<c:when test="${depth2.parent==depth1.buseoNum && depth2.replyNum>0}">
											<div style="margin-left: 40px;">
											<img id="buseo-${depth2.buseoNum}" src="/erp/resources/image/minus.png"/>
											
											<label id="bus-${depth2.buseoNum }"> ${depth2.buseoName }</label>
											<input type="hidden" class="numbus-${depth2.buseoNum }" value="${depth2.buseoNum }">
											</div>
											<div class="buseo-${depth2.buseoNum}">
											
											
												<c:forEach var="depth3" items="${buseolists }" >
												
													<c:choose>
													
													
													<c:when test="${depth3.parent==depth2.buseoNum && depth3.replyNum>0 }">
														<div style="margin-left: 60px;">
														<img id="buseo-${depth3.buseoNum}" src="/erp/resources/image/minus.png"/>
														<label id="bus-${depth3.buseoNum }"> ${depth3.buseoName }</label>
														<input type="hidden" class="numbus-${depth3.buseoNum }" value="${depth3.buseoNum }">
														
														</div>
														<div class="buseo-${depth3.buseoNum}">
												
														<c:forEach var="depth4" items="${buseolists }">
														
															<c:choose>
															
																<c:when test="${depth3.buseoNum==depth4.parent }">
																	<div style="margin-left: 80px;">
																	<label id="bus-${depth4.buseoNum }">┖ ${depth4.buseoName }</label>
																	<input type="hidden" class="numbus-${depth4.buseoNum }" value="${depth4.buseoNum }">
																	</div>
																</c:when>
															</c:choose>
														
														</c:forEach>
														</div>
													</c:when>
													
													
													
													
													
													
													
													<c:when test="${depth3.parent==depth2.buseoNum && depth3.replyNum==0 }">
														<div style="margin-left: 60px;">
														<label id="bus-${depth3.buseoNum }">┖ ${depth3.buseoName }</label>
														<input type="hidden" class="numbus-${depth3.buseoNum }" value="${depth3.buseoNum }">
														</div>
													</c:when>
												
													</c:choose>
												</c:forEach>
											</div>
										</c:when>
										
										
										<c:when test="${depth2.parent==depth1.buseoNum && depth2.replyNum==0 }">
											<div style="margin-left: 40px;">
											<label id="bus-${depth2.buseoNum }">┖ ${depth2.buseoName }</label>
											<input type="hidden" class="numbus-${depth2.buseoNum }" value="${depth2.buseoNum }">
											</div>
										</c:when>
									</c:choose>
								
									</c:forEach>
								</div>
							</c:when>
							
							
							
							<c:when test="${depth1.parent==depth0.buseoNum &&depth1.replyNum==0 }">
								<div style="margin-left: 20px;">
								<label id="bus-${depth1.buseoNum }">┖${depth1.buseoName }</label>
								<input type="hidden" class="numbus-${depth1.buseoNum }" value="${depth1.buseoNum }">
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
					</c:when>
					</c:choose>
				</c:forEach>
			</c:forEach>
		</div>
			
		
			<div style="width: 800px; height: 740px;background-color: red; float: left;" id="boardUpdate">
				
			</div>
			
		</div>
	</div>
</div>



</body>
</html>