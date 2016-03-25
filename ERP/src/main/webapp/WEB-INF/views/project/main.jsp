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
<title>펀치상사 그룹웨어</title>
<link rel="stylesheet" type="text/css" href="/erp/resources/menu.css">
<SCRIPT src="http://www.clocklink.com/embed.js"></SCRIPT>
<script >
//banner_roll("div태그 id", 배너1개높이, 딜레이, 1칸이동속도, 0);
function banner_roll(div_id, banner_height, banner_delay, banner_speed, this_height){
	
	var div_tag = document.getElementById(div_id);
	var a_tag, i;
	
	this_height ++;
	if(this_height < banner_height) {
		div_tag.style.top = -this_height;
		setTimeout("banner_roll('" + div_id + "', " + banner_height + ", " + banner_delay + ", " + banner_speed + ", " + this_height + ");", banner_speed);
	} else {
		a_tag = div_tag.getElementsByTagName("div");
		div_tag.appendChild(a_tag[0]);
		div_tag.style.top = 0;
		setTimeout("banner_roll('" + div_id + "', " + banner_height + ", " + banner_delay + ", " + banner_speed + ", 0);", banner_delay);
	}

	
	
	return true;
}


</script>
	


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


function winOpen(approvalNum){
	window.open('http://192.168.16.167:8080/erp/approvalArticle?approvalNum='+approvalNum,'', 'width=1000, height=1000, toolbar=no, menubar=no, scrollbars=yes, resizable=yes');
}

function notices(boardNum) { 
	
	open ("board/article.action?listNum=1&boardNum="+boardNum,"Mail","toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, width=1200, height=800"); 
}

function openArticle(noteNum){
	
	window.open("note/article?noteNum="+noteNum,"","width=520px,height=450px;")
	
}

	$(function(){
		leftCal();
	});
	
	function leftCal(){

		var url = "leftCalChange";
		
		$.post(url,function(args){
			
			$("#leftCal").html(args);
		});
		
		$("#leftCal").show();
	}

</script>
</head>
<body style="width: 100%">

<div style="width:100%; height: 822px; background-image: url('/erp/resources/image/white.jpg');">


<!-- 왼쪽 첫번재 div -->
<div style="margin-top :100px; margin-left: 27px; float: left;">

	
	<div class="line"  >
			<div id="nonmail" class="ma">안 읽은 쪽지</div>
			<div id="ex" class="sub">
				<c:forEach var="note" items="${NoteList }">
				<div  style="height: 25px; line-height: 25px; width: 550px; border-bottom: 1px solid #EAEAEA;">● 
				<a href="javascript:openArticle(${note.noteNum })" class="hyperLine" onmouseover="this.style.textDecoration='underline'" onmouseout="this.style.textDecoration='none'">${note.content }</a>
				</div>
				
				</c:forEach>
			</div>	
		
	</div>


	<div style="margin-top: 40px;" class="line">
			<div id="check" class="ma">결재함</div>
			<div id="dod" class="sub">
				<c:forEach var="dto" items="${approvalList}">
					<div  style="height: 25px; line-height: 25px; width: 550px; border-bottom: 1px solid #EAEAEA;">● 
			
					<a href="javascript:winOpen('${dto.approvalNum}')" style="text-decoration: none; color: black;">
						${dto.subject }</a>
					</div> 
				</c:forEach>
			</div>	
	</div>	
	
</div>


<div style="margin-top :100px; margin-left: 27px; float: left;">
	
	<div class="line">
		<div id="name" class="ma">공지사항</div>
			<div class="sub" id="content" >
				<c:forEach var="notice" items="${notice }">
					<div  style="height: 25px; line-height: 25px; width: 550px; border-bottom: 1px solid #EAEAEA;">● 
					
					<a href="#" onclick="notices(${notice.boardNum })" class="hyperLine" onmouseover="this.style.textDecoration='underline'" onmouseout="this.style.textDecoration='none'">
							${notice.subject }</a>
					</div>
				</c:forEach>
			</div>
	</div>
	
	

	<div style="margin-top: 40px;" class="line">
			<div id="birth" class="ma">기념일</div>
			<div id="do1" class="sub" style="font-size: 10pt;">
			
			
			
			<div style="width: 265px;height: 200px; float: left; padding-top: 10px;" align="center">
			<span style="font-size: 15pt; ">이번달 생일자</span>
				<div style=":absolute; width:265px; height:200px; overflow:hidden;">
					<div style=":relative;" id="banner_1" align="center">
					<c:forEach var="dto" items="${nowBirth}">
					<div style="display:block; height:190px; margin-top: 10px; font-size: 12pt;">
					${dto.seatPoint }<br>
					${dto.name }님 생일을 축하드립니다.<br>
					<br>
					<img alt="" src="/erp/resources/image/birth.png">
					
					</div>
					
					
					</c:forEach>
					</div>
				</div>
			</div>
			
			<div style="width: 19px; height: 220px; border-right: 1px solid; float: left; margin-top: 10px;"></div>
			<div style="width: 20px; height: 175px; float: left;"></div>
			
			<div style="width: 265px; height: 250px; float: left; padding-top: 10px;" align="center">
				<span style="font-size: 15pt;">다음달 생일자</span>
				<div style=":absolute; width:265px; height:180px; overflow:hidden; margin-top: 10px; font-size: 12pt;">
				<div style=":relative;" id="banner_2">
				<c:forEach var="dto" items="${nextBirth }">
				<div style="display:block; height:30px;">${dto.seatPoint } ${dto.name }님</div>
				</c:forEach>
				</div>
				</div>
			
			
			
			
			</div>
			
			
			
			
			
			
			
			</div>	
		</div>
	
	
</div>

	<div  style="margin-top :100px; margin-left: 27px; float: left;">

		<div class="line">
		
			<div id="Calendar" class="ma">일정</div>
			<div class="sub" id="non" >
					<div style="float:left;width: 40%;">
					<span id="leftCal" style="padding-top :50px; width: 270px; display: none;"></span></div>
					<div style="float:left;">개인일정 전사일정 <br/>들어갈자리</div>
			</div>
		</div>
	
	
	
		<div style="margin-top: 40px;" class="line">
			<div id="time" class="ma">세계시간</div>
			<div id="ck" class="sub" align="center" style="background-color: #666666;">
			
			<embed src="http://www.clocklink.com/clocks/world001-gray.swf?TimeZone=JST" width="570" height="250" wmode="transparent" type="application/x-shockwave-flash">
			</div>	
		</div>
		
	</div>
	



</div>

	
	
<script>
banner_roll("banner_1", 175, 2000, 20, 0);
banner_roll("banner_2", 180, 2000, 5, 0);
</script>

	

</body>
</html>