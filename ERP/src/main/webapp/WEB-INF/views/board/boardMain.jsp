<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%        
	
	String cp = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="/erp/resources/ManagementView.css">
<title>Insert title here</title>
<script type="text/javascript">
var num = 1;
$(document).ready(function(){
	
	 
	
	    $.ajax({
	        url:'ajaxBoardList',
	        type:'POST',
	          
	        error:function(args){
	               alert('권한이없습니다.');
	       	},
	        success: function(args){
	        	 $("#boardList").html(args);                           
	        }
		});

	    
	    $('[id^="ch-"]').click(function(){
			
			num= $('.num'+this.id).val();
			
			var LoginNum = ${LoginDTO.num};
			 $.ajax({
			        url:'ajaxBoardList',
			        type:'POST',
			        data : {listNum:num},
			          
			        error:function(args){
			               alert('권한이없습니다.');
			        },
			        success: function(args){
			        	 $("#boardList").html(args);                           
			        }
		});
	
	
	    });
	
	
	

});


function sendIt(){
	
	
	
	

	var url = "<%=cp%>/ajaxBoardList";
	var searchValue = $("#searchValue").val();
	var searchKey = $("#searchKey").val();
	

	$.post(url,{listNum:num,searchValue:searchValue,searchKey:searchKey},function(args){
	$("#boardList").html(args);
	
	});
	
	
}



</script>







</head>
<body>
<div style="width: 1840px; height: 822px;">

		<div style="width: 270px; float: left;">
		<div class="buseo" >
		게시판 목록
		</div>
		<div style="height:744px; padding-left: 10px; padding-top: 10px; border-right: 1px solid #D5D5D5;">
			<div>
			<c:forEach var="parent" items="${parent }">
					<c:forEach var="depth0" items="${boardlist }">
						<c:choose>
						
						<c:when test="${depth0.parent==0 && depth0.groupNum==parent.groupNum}">
						<div>
						<label id="ch-${depth0.listNum}" style="">${depth0.boardName }</label>
						<input type="hidden" class="numch-${depth0.listNum }" value="${depth0.listNum }">
						<input type="hidden" name="listNum" value="${depth0.listNum }" id="${depth0.listNum }">
						</div>
							<div class="fold-${depth0.listNum}">
							
							
							<c:forEach var="depth1" items="${boardlist }">
											
								<c:choose>
								
								<c:when test="${depth1.parent==depth0.listNum}">
							
									<div style="margin-left: 10px;">
									<label id="ch-${depth1.listNum }">
									<img src="/erp/resources/insa/ㄴ.png"><img src="/erp/resources/insa/folder2.png">
									${depth1.boardName }</label>
									<input type="hidden" class="numch-${depth1.listNum }" value="${depth1.listNum }">
									<input type="hidden" name="listNum" value="${depth1.listNum }" id="${depth1.listNum }">
									</div>
								
								</c:when>
								
								</c:choose>
							</c:forEach>
							</div>
									
						</c:when>
						
						</c:choose>
					</c:forEach>
				</c:forEach>
				</div>
		</div>
		
		
		
		
		
		
	</div>
	<div id="boardList" style="float: left; width: 1568px;">
	
	
	
	</div>
	

</div>

</body>
</html>