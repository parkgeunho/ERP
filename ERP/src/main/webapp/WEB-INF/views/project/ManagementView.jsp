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
		
		
		num= this.id.substr(3);
	
		
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
			<c:forEach var="dto" items="${lists }">
				<c:forEach begin="1" end="${dto.depthGap }" step="1">
				</div>
				   
				<c:set var="restDiv" value="${restDiv-1 }"/>
			</c:forEach>
			
			<div class="plus-${dto.parent}" id=-lists">
			 
        		<c:if test="${dto.depth != 0}">
		            <c:forEach begin="1" end="${dto.depth }" step="1">
		               <span style="width: 30px;">&nbsp;&nbsp;</span>
		            </c:forEach>
		         </c:if>
		  
			         <c:if test="${dto.replyNum != 0}">
			         	<img id="plus-${dto.buseoNum}" src="/erp/resources/image/minus.png"/>
			         	<img id="fold-${dto.buseoNum }" src="/erp/resources/insa/folder.png">
			         </c:if>
			       
			         
			         <c:if test="${dto.replyNum == 0 && dto.parent!=0}">
			         	<img src="/erp/resources/insa/ㄴ.png">
			         </c:if>
			           <c:if test="${dto.replyNum==0 }">
			         	<img src="/erp/resources/insa/folder2.png">
			         </c:if>
			       
			       
			       
			        	
			        	 <label id="ch-${dto.buseoNum}">${dto.buseoName }</label>
			        	
			        
					<input type="hidden" class="numedit-${dto.buseoNum}" value="${dto.buseoNum }" >
			</c:forEach>
			
			<c:forEach begin="0" end="${restDiv }" step="1">
			  </div>
			</c:forEach>
			
			
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