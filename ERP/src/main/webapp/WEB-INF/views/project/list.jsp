<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%        

	String cp = request.getContextPath();
int restDiv = (Integer)request.getAttribute("restDiv");
%>
<script src="/erp/resources/insa/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="/erp/resources/insa/jquery.session.js"></script>
<link rel="stylesheet" type="text/css" href="/erp/resources/jquery.mCustomScrollbar.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>
   
   $(document).ready(function(){
	   



	   
	 
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
   });

	var dds = $('[id^="edit-"]');
	
 	$('[id^="edit-"]').click(function(){
 		
 		
 		
 		for(var i=1;i<dds.length+1;i++){
 			
 			
 			var v = "edit-"+i;
 			if(v==this.id){
 				
 				document.getElementById(this.id).style.backgroundColor = "#E8D9FF";
 				
 			}else{
 				
 				document.getElementById(v).style.backgroundColor = "#FFFFFF";
 			}
 			
 		}
 		
 		
 		/* document.getElementById(this.id).style.backgroundColor = "#E8D9FF"; */
 		//클릭한 것을 세션에 넣어줌
		num= $('.num'+this.id).val();		
	});
 	
 	

 	
 	
 	//클릭을 했을 시 인풋 박스로 변경 시킨다.
	$('[id^="edit-"]').dblclick(function(){
		
 		var v = $(":text").length;
		 
		var obj = $('.'+ this.id).val();
		  if(v==0){
			 var av = document.getElementById(this.id).innerText;
			 document.getElementById(this.id).innerHTML= "<input type='text' value="+av+" name="+obj+ ">"; 
		}else{
			
			alert("이미다른걸수정중이므로 수정을 완료해주세요");
			return;
		} 
	});  
   
   
</script>

<div style="height: 500px;" class="mCustomScrollbar" data-mcs-theme="minimal-dark">

<c:forEach var="dto" items="${lists }">
   <c:forEach begin="1" end="${dto.depthGap }" step="1">
   </div>
   <% restDiv = restDiv - 1;%>
   </c:forEach>
<div class="fold-${dto.parent}" id="lists">
  
         <c:if test="${dto.depth != 0}">
            <c:forEach begin="1" end="${dto.depth }" step="1">
               &nbsp;
            </c:forEach>
         </c:if>
         <c:if test="${dto.replyNum == 0 && dto.depth != 0}">
            &nbsp; &nbsp;
         </c:if>
         <c:if test="${dto.replyNum != 0}">
         <img id="fold-${dto.buseoNum}" src="/erp/resources/image/minus.png"/>
         </c:if>
        
        <label id="edit-${dto.buseoNum}">${dto.buseoName }</label>
		<input type="hidden" class="numedit-${dto.buseoNum}" value="${dto.buseoNum }" >
</c:forEach>
   <% for(int i=0; i<restDiv; i++){ %>
   </div>
   <%} %>
</div>
	</div>
	




