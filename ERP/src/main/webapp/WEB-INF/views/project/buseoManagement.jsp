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
$(document).ready(function() {

	
	
	
	
	
	
	$("#updated").click(function(){
		
		var myForm = $("#myForm").serialize();
			
		  $.ajax({
             url:'buseoUpdated',
             type:'POST',
             data: myForm,
             error:function(args){
                    alert('에러래');
             },
             success: function(args){
             	 $("#buseoList").html(args);                           
             }
 		});
		 
	});
	
	
	





	//리스트를 아작스로 불러오기위한것
	
	    $.ajax({
                    url:'buseoList',
                    type:'POST',
                      
                    error:function(args){
                           alert('최대 하위 부서 입니다.');
                    },
                    success: function(args){
                    	 $("#buseoList").html(args);                           
                    }
	    });

	

	
		
	//리스트를 아작스로 불러오기위한것



});
</script>

<script type="text/javascript">


function sendit(){

	window.opener.location.reload();
	window.close();

}

function deleted(){

	var url = "<%=cp%>/buseodeleted";
	
	var del;
	
	del=confirm("정말 삭제하시겠습니까?");
	
	if(del==true){
		$.post(url,{num:num},function(args){
		$("#buseoList").html(args);
		}).error(function(){alert("부서에 사람이 존재합니다.")});
	}else{
		return;
	}
}

function created(){

	var url = "<%=cp%>/buseocreated";
	$.post(url,{num:num},function(args){
	$("#buseoList").html(args);
	
	}).error(function(){alert("이미 최하 부서입니다.")});
}

</script>

</head>
<body onload="num=0">




<table >
<tr>
	<td style="width: 300px;">
	<div>
		<div style="height: 30px;">
			<div class="buseoManagement" onclick="deleted();"><img src="/erp/resources/image/minus-white.png" >&nbsp;부서삭제</div>
			<div class="buseoManagement" onclick="created();"><img src="/erp/resources/image/plus-white.png" >&nbsp;부서추가</div>
		</div>
	<div id="buseoList"></div>
	</div>
	</td>
	

<tr>
<td  width="250px;">

<div class="buseoManagement" onclick="sendit()">&nbsp;완료</div>
<div id="updated" class="buseoManagement" >수정</div>
		

</td>
</tr>
<tr>
<td>
	
		
	
	

</td>



</tr>

</table>

</body>
</html>