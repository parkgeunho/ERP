<%@ page contentType="text/html; charset=UTF-8"%>
<%        
	
	String cp = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/erp/resources/menu.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
    $("#b").click(function(){
    	
    	
    	
        $("#a").slideToggle("slow");
       
        var a = ($(this).text()=='▽')?'△':'▽';
        $(this).text(a);
        
        
        
    });
 
});


</script>

</head>
<body>

<div style="height: 90px; background-color: #cccccc;">
여기다
</div>
<div class="menubar">
	<ul>
		<li style="width: 80px;">&nbsp;</li>
		<li style="line-height: 50px;margin: 0px;padding: 0px">|</li>
		<li><a href="#" id="current">홈</a>
			<ul>
			    <li><a href="test">테스트</a></li>
			    <li><a href="#">테스트1</a></li>
			    <li><a href="#">테스트2</a></li>
			    <li><a href="#">Extensions</a></li>
		    </ul>
 		</li>
 		
		<li style="line-height: 50px">|</li>
		
		<li><a href="approval">결재</a></li>
		
		<li style="line-height: 50px">|</li>
		
		<li><a href="#">업무 지원</a></li>
		
		<li style="line-height: 50px">|</li>
		
		<li><a href="boardMain">게시판</a></li>
		
		<li style="line-height: 50px">|</li>
		
		<li><a href="schedule">일정</a></li>
		
		<li style="line-height: 50px">|</li>
		
		<li><a href="#">메일</a></li>
		
		<li style="line-height: 50px">|</li>
		
		<li><a href="javascript:location.href='<%=cp%>/insa';">관리자</a></li>
	</ul>
</div>

<div id="c">
	<div id="a" style="height: 100px; background-color: white;">
	
	
	
	<div style="float: left;">
	
	</div>
	
	</div>
	
	<div style="font-size: 8pt; border-bottom: 2px solid orange; height: 10px; background-color: white;">
	<div  id="b" style="width: 50px; background-color: orange; float: right; margin-right: 10px;border-top-left-radius : 5px;
	border-top-right-radius : 5px;" align="center">▽</div>
	
	</div>
</div>
</body>

</html>