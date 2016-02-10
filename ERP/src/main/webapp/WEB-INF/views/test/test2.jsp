<%@ page contentType="text/html; charset=UTF-8"%>
<%        
	
	String cp = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/test/resources/menu.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
    $("#b").click(function(){
        $("#a").slideToggle("slow");
    });
    
	
    $("#test2").click(function(){
        $("#test").slideToggle("slow");
    });
    
    
/*     
    $("#a").mouseout(function(){
    	$("#a").slideToggle("slow");
    }); */
});


</script>

</head>
<body>
<div style="height: 3000px;">
<div class="top" style="height: 50px">
	<tt>
	
	<input type="text">	
	</tt>
</div>
<div class="menubar">
<ul>
 <li style="width: 50px;">&nbsp;</li>
 <li style="line-height: 50px;margin: 0px;padding: 0px">|</li>
 <li><a href="#" id="current">메일</a>
	<ul>
     <li><a href="#">Sliders</a></li>
     <li><a href="#">Galleries</a></li>
     <li><a href="#">Apps</a></li>
     <li><a href="#">Extensions</a></li>
    </ul>
 </li>
 <li style="line-height: 50px">|</li>
 <li><a href="#">결제</a></li>
 <li style="line-height: 50px">|</li>
 <li><a href="#">업무지원</a></li>
 <li style="line-height: 50px">|</li>
 <li><a href="#">게시판</a></li>
</ul>
</div>
<div id="c">
	<div id="a" style="height: 100px;">
	접기기능실험하기
	</div>
	
	<div id="b" style="font-size: 5pt; border-bottom: 1px solid">클릭해주세요</div>
</div>
<div>
<div id="back" style="background-color: blue; height: 400px;">
	&nbsp;
	<div id="test2" style="margin-top: 150px;margin-left: 50px; background-color: white;width: 200px;">
	안녕하세요!
		<div id="test" style="background-color: white;height: 200px; display: none;">
		열고닫기 테스트합니다.
		</div>
	</div>
</div>
</div>
</div>

</body>

</html>