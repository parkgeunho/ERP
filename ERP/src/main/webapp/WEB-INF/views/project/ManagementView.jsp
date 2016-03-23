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

<script src="/erp/resources/insa/jquery.mCustomScrollbar.concat.min.js"></script>
<link rel="stylesheet" type="text/css" href="/erp/resources/jquery.mCustomScrollbar.css">
<link rel="stylesheet" type="text/css" href="/erp/resources/ManagementView.css">



<script type="text/javascript">
var num = 1;
$(document).ready(function(){
	
	
	
	
	
	
	
		    $.ajax({
                    url:'memberList',
                    type:'POST',
                    
                    error:function(args){
                        
                    },
                    success: function(args){
                    	 $("#memberList").html(args);                           
                    }
	    });

	
	
	

	
	$('[id^="ch-"]').click(function(){
		
		
		num= $('.num'+this.id).val();
	
		
			    $.ajax({
		            url:'memberList',
		            data:{num:num},
		            type:'POST',
		            
		            error:function(args){
		                alert("에러");
		            },
		            success: function(args){
		            	 $("#memberList").html(args);                           
		            }
		});
		
	});
	
	
	
	
    $('[id^="plus-"]').click(function(){
    	
    	var folderNum = this.id.substr(5);
    	
    	
       var foldersrc = ($("#fold-"+folderNum).attr('src')=='/erp/resources/insa/folder.png')?'/erp/resources/insa/folder2.png':'/erp/resources/insa/folder.png';
       $("#fold-"+folderNum).attr('src',foldersrc);
       
         var src = ($(this).attr('src')=='/erp/resources/image/minus.png') ?'/erp/resources/image/plus.png':'/erp/resources/image/minus.png';
         
          $(this).attr('src',src);
        
        var obj = $('.'+ this.id);
        
        if(obj.css('display')=='none')
           obj.show();
        else
           obj.hide(); 
        
     }); 

});



function sendIt() {
	
	var url = "<%=cp%>/memberList";
	var searchValue = $("#searchValue").val();
	$("#searchValue").val("");
	
	
	$.post(url,{searchValue:searchValue,num:num},function(args){
	$("#memberList").html(args);
	
	});
}
	



</script>




</head>
<body>
<div  style="width:1570px; height: 807px;">
	
	<div class="buseo" >부서관리</div>
	<!-- 왼쪽 부서 관련  -->
	<div style="width: 290px;float: left; margin-left: 30px;">
	
		<div style="margin-top: 10px; margin-left: 10px;  background-color: #F6F6F6; height: 730px; border: 1px solid #D5D5D5; width: 250px;">
			<c:forEach var="parent" items="${parent }">
				<c:forEach var="depth0" items="${lists }">
					<c:choose>
					
					<c:when test="${depth0.parent==0 && depth0.groupNum==parent.groupNum && depth0.replyNum>0}">
					<div>
					<img id="plus-${depth0.buseoNum}" src="/erp/resources/image/minus.png"/>
					<img id="fold-${depth0.buseoNum}" src="/erp/resources/insa/folder.png"/>
					<label id="ch-${depth0.buseoNum}">${depth0.buseoName }</label>
					<input type="hidden" class="numch-${depth0.buseoNum }" value="${depth0.buseoNum }">
					</div>
						<div class="plus-${depth0.buseoNum}">
						
						
						<c:forEach var="depth1" items="${lists }">
										
							<c:choose>
							
							
							<c:when test="${depth1.parent==depth0.buseoNum && depth1.replyNum>0 }">
								<div style="margin-left: 20px;">
								<img id="plus-${depth1.buseoNum}" src="/erp/resources/image/minus.png"/>
								<img id="fold-${depth1.buseoNum}" src="/erp/resources/insa/folder.png"/>
								<label id="ch-${depth1.buseoNum }">${depth1.buseoName }</label>
								<input type="hidden" class="numch-${depth1.buseoNum }" value="${depth1.buseoNum }">
								</div>
								<div class="plus-${depth1.buseoNum}">
								
								
									<c:forEach var="depth2" items="${lists}">
																		
									<c:choose>
									
									
										<c:when test="${depth2.parent==depth1.buseoNum && depth2.replyNum>0}">
											<div style="margin-left: 40px;">
											<img id="plus-${depth2.buseoNum}" src="/erp/resources/image/minus.png"/>
											<img id="fold-${depth2.buseoNum}" src="/erp/resources/insa/folder.png"/>
											<label id="ch-${depth2.buseoNum }"> ${depth2.buseoName }</label>
											<input type="hidden" class="numch-${depth2.buseoNum }" value="${depth2.buseoNum }">
											</div>
											<div class="plus-${depth2.buseoNum}">
											
											
												<c:forEach var="depth3" items="${lists }" >
												
													<c:choose>
													
													
													<c:when test="${depth3.parent==depth2.buseoNum && depth3.replyNum>0 }">
														<div style="margin-left: 50px;">
														<img id="plus-${depth3.buseoNum}" src="/erp/resources/image/minus.png"/>
														<img id="fold-${depth3.buseoNum}" src="/erp/resources/insa/folder.png"/>
														<label id="ch-${depth3.buseoNum }"> ${depth3.buseoName }</label>
														<input type="hidden" class="numch-${depth3.buseoNum }" value="${depth3.buseoNum }">
														
														</div>
														<div class="plus-${depth3.buseoNum}">
												
														<c:forEach var="depth4" items="${lists }">
														
															<c:choose>
															
																<c:when test="${depth3.buseoNum==depth4.parent }">
																	<div style="margin-left: 60px;">
																	<label id="ch-${depth4.buseoNum }">
																	<img src="/erp/resources/insa/ㄴ1.png">
																	<img id="fold-${depth4.buseoNum}" src="/erp/resources/insa/folder2.png"/>
																	 ${depth4.buseoName }</label>
																	<input type="hidden" class="numch-${depth4.buseoNum }" value="${depth4.buseoNum }">
																	</div>
																</c:when>
															</c:choose>
														
														</c:forEach>
														</div>
													</c:when>
													
													
													
													
													
													
													
													<c:when test="${depth3.parent==depth2.buseoNum && depth3.replyNum==0 }">
														<div style="margin-left: 50px;">
														<label id="ch-${depth3.buseoNum }">
														<img src="/erp/resources/insa/ㄴ1.png">
														<img id="fold-${depth3.buseoNum}" src="/erp/resources/insa/folder2.png"/>
														 ${depth3.buseoName }</label>
														<input type="hidden" class="numch-${depth3.buseoNum }" value="${depth3.buseoNum }">
														</div>
													</c:when>
												
													</c:choose>
												</c:forEach>
											</div>
										</c:when>
										
										
										<c:when test="${depth2.parent==depth1.buseoNum && depth2.replyNum==0 }">
											<div style="margin-left: 30px;">
											<label id="ch-${depth2.buseoNum }">
											<img src="/erp/resources/insa/ㄴ1.png">
											<img id="fold-${depth2.buseoNum}" src="/erp/resources/insa/folder2.png"/>
											 ${depth2.buseoName }</label>
											<input type="hidden" class="numch-${depth2.buseoNum }" value="${depth2.buseoNum }">
											</div>
										</c:when>
									</c:choose>
								
									</c:forEach>
								</div>
							</c:when>
							
							
							
							<c:when test="${depth1.parent==depth0.buseoNum &&depth1.replyNum==0 }">
								<div style="margin-left: 10px;">
								<label id="ch-${depth1.buseoNum }">
								<img src="/erp/resources/insa/ㄴ1.png">
								<img id="fold-${depth1.buseoNum}" src="/erp/resources/insa/folder2.png"/>
								${depth1.buseoName }</label>
								<input type="hidden" class="numch-${depth1.buseoNum }" value="${depth1.buseoNum }">
								</div>
							</c:when>
							
							</c:choose>
						</c:forEach>
						</div>
								
					</c:when>
					<c:when test="${depth0.parent==0 && depth0.groupNum==parent.groupNum && parent.replyNum==1}">
					<div style="margin-left: 15px;">
					<img id="fold-${depth0.buseoNum}" src="/erp/resources/insa/folder2.png"/>
					<label id="ch-${depth0.buseoNum }">${depth0.buseoName }</label>
					<input type="hidden" class="numch-${depth0.buseoNum }" value="${depth0.buseoNum }">

					</div>
					</c:when>
					</c:choose>
				</c:forEach>
			</c:forEach>
		</div>
	</div>

	<div style="width: 1250px; height: 740px;float: left;">
		

		
		
		<div style=" height: 740px; width: 1250px;">
			<div style="margin-top:50px; margin-left: 410px; height: 40px; float: left;">
				<form action="javascript:sendIt();" name="myForm" method="post">
					<input type="text" id="searchValue" name="searchValue" style="height: 16px; float: left;">
				</form>
				<span style="margin-left: 5px; float: left;">
					<img align="middle" src="/erp/resources/image/find.png" onclick="sendIt();">
				</span>
				
		
			</div>
			
			<div id="memberList" style="padding-top :130px;">
				
			</div>
			
		</div>
	</div>
</div>



</body>
</html>