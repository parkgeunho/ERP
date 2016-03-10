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
		            	 $("#boardList").html(args);                           
		            }
		});
		
	});
	
	
	
	
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
			<div id="boardList" style="background-color: #D4F4FA;padding-left: 10px; padding-top: 10px;">
				
			</div>
	</div>

	<div style="width: 1320px; height: 740px;float: left;">
		
		<div style=" height: 740px; width: 1320px;">
			<div style="width: 800px; height: 740px; margin-left: 260px;background-color: red">
				<div style="width: 740px;margin-left: 30px; padding-top: 10px;">
					<div >게시판설정</div>
					<div >게시판에 대한 정보 및 수정을 할 수 있습니다.</div>
					<div >공지게시판으로 사용하시려면 글쓰기 권한을 관리자 이상으로 지정하세요.</div>
					<div style="border-bottom: 1px solid;height: 30px;"></div>
					<div style="float: left; width: 200px; padding-top: 10px; ">
					
						<div style="height: 35px; border-bottom: 1px solid;" >게시판명</div>
					
					</div>
					<div style="float: left; padding-top: 10px; width: 540px;">
						<div style="height: 35px; border-bottom: 1px solid;"><input type="text"></div>
					
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div>



</body>
</html>