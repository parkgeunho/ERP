<%@ page contentType="text/html; charset=UTF-8"%>
<%        
	
	String cp = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/erp/resources/menu.css">
<script type="text/javascript">

$(document).ready(function(){
	

    
    $("#name").click(function(){
    	
        $("#content").slideToggle("slow");
    });
    $("#test33").click(function(){
    	
        $("#mail").slideToggle("slow");
    });
    
    
	 $("#Calendar").click(function(){
	    	
        $("#non").slideToggle("slow");
    });
	 
	$("#nonmail").click(function(){
	    	
        $("#ex").slideToggle("slow");
    });
	
	$("#time").click(function(){
    	
        $("#ck").slideToggle("slow");
    });
	
	$("#check").click(function(){
    	
        $("#dod").slideToggle("slow");
    });
	
	$("#birth").click(function(){
    	
        $("#do1").slideToggle("slow");
    });
               
    
 
});


</script>
</head>
<body>

<div style="width:1840px; height: 807px;">


<!-- 왼쪽 첫번재 div -->
<div style="margin-top :100px; margin-left: 27px; float: left;">
	<div class="line">
		<div id="test33" class="ma">메일/결제 알림판</div>
		<div class="sub" id="mail">메일아이콘과 결제 관련아이콘이 들어가는 자리 입니다.</div>
	</div>
	
	<div class="line" style="margin-top: 20px;" >
			<div id="nonmail" class="ma">안읽은메일</div>
			<div id="ex" class="sub">
				<div>1</div>
				<div>2</div>
				<div>3</div>
				<div>4</div>
				<div>5</div>
				<div>6</div>
			</div>	
		
	</div>


	<div style="margin-top: 20px;" class="line">
			<div id="check" class="ma">결재함</div>
			<div id="dod" class="sub">
				아무것도없음
			</div>	
	</div>	
	
</div>


<div style="margin-top :100px; margin-left: 27px; float: left;" >
	
	<div class="line">
		<div id="name" class="ma">공지사항</div>
			<div class="sub" id="content"  >
				<div>1</div>
				<div>2</div>
				<div>3</div>
				<div>4</div>
				<div>5</div>
				<div>6</div>
			</div>
	</div>
	
	<div style="margin-top: 20px;" class="line">
		<div class="back">
			사진들어감
		</div>
	</div>

	<div style="margin-top: 20px;" class="line">
			<div id="birth" class="ma">기념일</div>
			<div id="do1" class="sub">
				아무것도없음
			</div>	
		</div>
	
	
</div>

	<div  style="margin-top :100px; margin-left: 27px; float: left;">

		<div class="line">
		
			<div id="Calendar" class="ma">일정</div>
			<div class="sub" id="non" >
					<div style="float:left;width: 40%;">여기는 달력이 들어갈 자리입니다</div>
					<div style="float:left;">개인일정 전사일정 <br/>들어갈자리</div>
			</div>
		</div>
	
	
	
		<div style="margin-top: 20px;" class="line">
			<div id="time" class="ma">세계시간</div>
			<div id="ck" class="sub">세계시간이 들어가는건데 필요한가 모르겟음</div>	
		</div>
		
	</div>
	



</div>

	
	

	
	

</body>
</html>