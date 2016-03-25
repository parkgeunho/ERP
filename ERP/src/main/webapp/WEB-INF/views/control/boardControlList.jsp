<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%        
	
	String cp = request.getContextPath();

%>
<script type="text/javascript">

   $(document).ready(function(){
	  
	   
	   
	   
	   
	   
	   
	num=0;


	
	 
	   $(".content").mCustomScrollbar();
      
      $('[id^="fold-"]').click(function(){
    	  
    	  
    	  
   
    	  
         
         var src = ($(this).attr('src')=='/erp/resources/image/minus.png') ?'/erp/resources/image/plus.png':'/erp/resources/image/minus.png';
           $(this).attr('src',src);
         
         var obj = $('.'+ this.id);
         
         if(obj.css('display')=='none')
            obj.show();
         else
            obj.hide();
      });

   
   
   $('[id^="buseo-"]').click(function(){
       
	   
	   
	
	   
	   
	   
		var folderNum = this.id.substr(5);
    	
    	
	       var foldersrc = ($("#folder-"+folderNum).attr('src')=='/erp/resources/insa/folder.png')?'/erp/resources/insa/folder2.png':'/erp/resources/insa/folder.png';
	       $("#folder-"+folderNum).attr('src',foldersrc);
	   
	   
	   
	   
	   
	   
	   
       var src = ($(this).attr('src')=='/erp/resources/image/minus.png') ?'/erp/resources/image/plus.png':'/erp/resources/image/minus.png';
         $(this).attr('src',src);
       
       var obj = $('.'+ this.id);
       
       if(obj.css('display')=='none')
          obj.show();
       else
          obj.hide();
    });

   

	
	
 	$('[id^="ch-"]').click(function(){
 	
 		
 	var dds = ${maxNum};
 		
 		for(var i=1;i<dds+1;i++){
 			
 			
 			var v = "ch-"+i;
 			
 			
 		if($("#"+v).length>0){
 			
	 			if(v==this.id){
	 				
	 				document.getElementById(this.id).style.backgroundColor = "#E8D9FF";
	 				
	 			}else{
	 				
	 				document.getElementById(v).style.backgroundColor = "#F6F6F6";
	 			}
 			
 			}
 		}
 		
 		/* document.getElementById(this.id).style.backgroundColor = "#E8D9FF"; */
 		//클릭한 것을 세션에 넣어줌
 		
		num= $('.num'+this.id).val();
 		
 		trim();
 		
	});
 	

 		

 	
 	
 
 	
   });	
 	
   
</script>

<div>
			<c:forEach var="parent" items="${parent }">
				<c:forEach var="depth0" items="${lists }">
					<c:choose>
					
					<c:when test="${depth0.parent==0 && depth0.groupNum==parent.groupNum && depth0.replyNum>0}">
					<div>
					<img id="fold-${depth0.listNum}" src="/erp/resources/image/minus.png"/>
					<label id="ch-${depth0.listNum}">${depth0.boardName }</label>
					<input type="hidden" class="numch-${depth0.listNum }" value="${depth0.listNum }">
					</div>
						<div class="fold-${depth0.listNum}">
						
						
						<c:forEach var="depth1" items="${lists }">
										
							<c:choose>
							
							
							<c:when test="${depth1.parent==depth0.listNum && depth1.replyNum>0 }">
								<div style="margin-left: 20px;">
								<img id="fold-${depth1.listNum}" src="/erp/resources/image/minus.png"/>
								
								<label id="ch-${depth1.listNum }">${depth1.boardName }</label>
								<input type="hidden" class="numch-${depth1.listNum }" value="${depth1.listNum }">
								</div>
								<div class="fold-${depth1.listNum}">
								
								
									<c:forEach var="depth2" items="${lists}">
																		
									<c:choose>
									
									
										<c:when test="${depth2.parent==depth1.listNum && depth2.replyNum>0}">
											<div style="margin-left: 40px;">
											<img id="fold-${depth2.listNum}" src="/erp/resources/image/minus.png"/>
											
											<label id="ch-${depth2.listNum }">${depth2.boardName }</label>
											<input type="hidden" class="numch-${depth2.listNum }" value="${depth2.listNum }">
											</div>
											<div class="fold-${depth2.listNum}">
											
											
												<c:forEach var="depth3" items="${lists }" >
												
													<c:choose>
													
													
													<c:when test="${depth3.parent==depth2.listNum && depth3.replyNum>0 }">
														<div style="margin-left: 60px;">
														<img id="fold-${depth3.listNum}" src="/erp/resources/image/minus.png"/>
														<label id="ch-${depth3.listNum }">${depth3.boardName }</label>
														<input type="hidden" class="numch-${depth3.listNum }" value="${depth3.listNum }">
														
														</div>
														<div class="fold-${depth3.listNum}">
												
														<c:forEach var="depth4" items="${lists }">
														
															<c:choose>
															
																<c:when test="${depth3.listNum==depth4.parent }">
																	<div style="margin-left: 80px;">
																	<label id="ch-${depth4.listNum }">${depth4.boardName }</label>
																	<input type="hidden" class="numch-${depth4.listNum }" value="${depth4.listNum }">
																	</div>
																</c:when>
															</c:choose>
														
														</c:forEach>
														</div>
													</c:when>
													
													
													
													
													
													
													
													<c:when test="${depth3.parent==depth2.listNum && depth3.replyNum==0 }">
														<div style="margin-left: 60px;">
														<label id="ch-${depth3.listNum }">${depth3.boardName }</label>
														<input type="hidden" class="numch-${depth3.listNum }" value="${depth3.listNum }">
														</div>
													</c:when>
												
													</c:choose>
												</c:forEach>
											</div>
										</c:when>
										
										
										<c:when test="${depth2.parent==depth1.listNum && depth2.replyNum==0 }">
											<div style="margin-left: 40px;">
											<label id="ch-${depth2.listNum }">${depth2.boardName }</label>
											<input type="hidden" class="numch-${depth2.listNum }" value="${depth2.listNum }">
											</div>
										</c:when>
									</c:choose>
								
									</c:forEach>
								</div>
							</c:when>
							
							
							
							<c:when test="${depth1.parent==depth0.listNum &&depth1.replyNum==0 }">
								<div style="margin-left: 20px;">
								<label id="ch-${depth1.listNum }">${depth1.boardName }</label>
								<input type="hidden" class="numch-${depth1.listNum }" value="${depth1.listNum }">
								</div>
							</c:when>
							
							</c:choose>
						</c:forEach>
						</div>
								
					</c:when>
					<c:when test="${depth0.parent==0 && depth0.groupNum==parent.groupNum && parent.replyNum==1}">
					<div>
					
				
					
					<label id="ch-${depth0.listNum }">${depth0.boardName }</label>
					<input type="hidden" class="numch-${depth0.listNum }" value="${depth0.listNum }">

					</div>
					</c:when>
					</c:choose>
				</c:forEach>
			</c:forEach>
		</div>