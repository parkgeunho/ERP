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
		
		group=this.id.substring(4);
		
		group= "Bus-" + group;
		
		
		var buseoMaxNum = ${buseoMaxNum};
		var memberMaxNum = ${memberMaxNum};
		
		
		 for(var i=1;i<buseoMaxNum+1;i++){
			var v = "bus-"+i;
			
			if($("#"+v).length>0){
				if(v==this.id){
					document.getElementById(this.id).style.backgroundColor = "#E8D9FF";
				}else{
					document.getElementById(v).style.backgroundColor = "#FFFFFF";
				}
				
			}
		} 
		 for(var i=1;i<memberMaxNum+1;i++){
				var v = "Mem-"+i;
				
				if($("#"+v).length>0){
					
						document.getElementById(v).style.backgroundColor = "#FFFFFF";
					
					
				}
			} 
	
	});

	
	
	
	$('[id^="Mem-"]').click(function(){
		

		var buseoMaxNum = ${buseoMaxNum};
		var memberMaxNum = ${memberMaxNum};
		group=this.id.substring(4);
		alert(group);
		group= "Mem-" + group;
		alert(group);

		 for(var i=1;i<memberMaxNum+1;i++){
			var v = "Mem-"+i;
			
			if($("#"+v).length>0){
				if(v==this.id){
					document.getElementById(this.id).style.backgroundColor = "#E8D9FF";
				}else{
					document.getElementById(v).style.backgroundColor = "#FFFFFF";
				}
				
			}
		} 
		 for(var i=1;i<buseoMaxNum+1;i++){
				var v = "bus-"+i;
				
				if($("#"+v).length>0){
					
						document.getElementById(v).style.backgroundColor = "#FFFFFF";
					
					
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
			
			
			
			<c:forEach var="dto" items="${buseolists }">
			   <c:forEach begin="1" end="${dto.depthGap }" step="1">
			   		</div>
			   		<c:set var="buseoN" value="${buseoN-1 }"/>

			   </c:forEach>
			<div class="fold-${dto.parent}" id=-lists">
			
		
			   
			         <c:if test="${dto.depth != 0}">
			            <c:forEach begin="1" end="${dto.depth }" step="1">
			               <span style="width: 33px;">&nbsp;</span>
			            </c:forEach>
			         </c:if>
			         <c:if test="${dto.replyNum == 0 && dto.depth != 0}">
			            
			         </c:if>
			         <c:if test="${dto.replyNum != 0}">
			         	<img id="fold-${dto.buseoNum}" src="/erp/resources/image/minus.png"/>
			         </c:if>
			         
			         
			         <c:if test="${dto.replyNum == 0 && dto.parent!=0}">
			         	<img src="/erp/resources/insa/ㄴ.png">
			         </c:if>
			       	
			       
			        <c:choose>
			        	<c:when test="${dto.checked!='a' }">
			        	<img src="/erp/resources/insa/folder.png">
			        	 <label id="bus-${dto.buseoNum}">
			        	 
			        	 ${dto.buseoName }</label>
			        	</c:when>
			        </c:choose>
			        
			        
			        <c:forEach var="member" items="${memberList }">
				<c:choose>
				
					<c:when test="${dto.buseoNum==member.ckdepth }">
					<div class="fold-${dto.buseoNum}" style="margin-left: 10px;">
						<c:if test="${dto.depth != 0}">
				            <c:forEach begin="1" end="${dto.depth }" step="1">
				               <span style="width: 30px;">&nbsp;&nbsp;</span>
				            </c:forEach>
			         	</c:if>
			         <img src="/erp/resources/insa/ㄴ.png">
			         <label id="Mem-${member.num }">${member.name }</label>
			         <input type="hidden" class="Mem-${member.num }" value="">
			         </div>
					
					</c:when>
				</c:choose>
			
			
			</c:forEach>
			        
			        
			        
			        
					<input type="hidden" class="numedit-${dto.buseoNum}" value="${dto.buseoNum }" >
			</c:forEach>
			   <c:forEach begin="0" step="1" end="${buseoN }">
			    	</div>
			   </c:forEach>
			
			
			
			
			
			
			
			
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