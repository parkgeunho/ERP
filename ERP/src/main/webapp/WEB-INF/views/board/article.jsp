<%@ page contentType="text/html; charset=UTF-8"%>
<%		
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>
$(document).ready(function(){
    $("#hide").click(function(){
        $("p").hide();
    });
    $("#show").click(function(){
        $("p").show();
    });
});

$(document).ready(function(){
    $("button").click(function(){
        alert($("div").scrollTop() + " px");
    });
});


</script>



</head>
<body>




<table border="1" cellpadding="0" cellspacing="0" align="center" >
	<tr style="height: 40px; background: #D4D4D4">
		<td colspan="3" style="width: 1400px;" align="center">글 작성 게시판 명칭 뜨게 할것		
		</td>	
	</tr>
	
	<tr style="height: 5px;">
		<td colspan="3" style="width: 1400px;" align="right">
			
		</td>
	</tr>


	<tr style="height: 30px; background: #E8FFE2" >
		<td style="width: 200px; height: 22px;" align="center">제&nbsp;&nbsp;목</td>
		<td style="width: 1200px;"></td>	
	</tr>
	
	<tr>
		<td style="width: 200px; height: 22px;" align="center">등록정보</td>
		<td style="width: 1200px;">&nbsp;&nbsp;&nbsp;&nbsp;이름,직급,소속,(날짜)</td>
	</tr>
	
	<tr style="height: 3px;">	
	</tr>
</table>

<table  border="1" align="center">
	<tr style="height: 450px;">
		<td style="width: 1400px;">${dto.content}</td>
	</tr>
</table>

<!-- 댓글 -->
<table border="1" align="center" cellpadding="0" cellspacing="0" >
	<tr style="height: 65px; background: #E1E1E1">
		<td style="width: 70px;" align="center">
			<img alt="" src="/erp/resources/image/image.jpg" style="width: 60px; height: 55px;">
		
		</td>
			
		<td style="width: 70px;" align="center">
			<img alt="" src="/erp/resources/image/image015.png" style="width: 60px; height: 55px;">
		</td>
		<td style="width: 1200px;">
			<textarea rows="" cols="" style="width: 1200px; height: 55px;"></textarea>
		</td>
		<td style="width: 60px;" align="center">
			<img alt="" src="/erp/resources/image/regist002.PNG" style="width: 55px; height: 50px;" onclick=""/>
		
			<!-- <input type="button" value="등록" class="btn2" onclick=""> -->
		</td>
	</tr>
</table>


<!-- 댓글보기 -->
<table border="1" align="center" cellpadding="0" cellspacing="0" >
	<tr style="height: 30px; background: ">
		<td style="width: 70px;" align="center" rowspan="2">
			<img alt="" src="/erp/resources/image/image.jpg" style="width: 60px; height: 55px;">
		
		</td>
			
		<td style="width: 70px;" align="center" rowspan="2">
			<img alt="" src="/erp/resources/image/image013.PNG" style="width: 60px; height: 55px;">
		</td>
		
		
		<td style="width: 1260px; height: 30px;">작성자/시간</td>
				
	</tr>
	
	<tr style="height: 45px; background: ">
		
		<td style="width: 1260px; height: 55px;">내용</td>
				
	</tr>
</table>





<table border="1" align="center">
	<tr style="height: 10px;">
		<td></td>
	</tr>
	<tr style="height: 0.5px; background: #B2EBF4">
		<td style="width: 1400px;"></td>
	</tr>
	<tr style="height: 30px;">
		<td style="width: 1400px;" align="right">
			<select>
				<option>보내기</option>
				<option>목적에</option>
				<option>맞는</option>
				<option>게시판</option>
			</select>
			<input type="button" value="리스트" class="btn2">
		
		
		</td>
	
	
	
	</tr>


</table>







</body>
</html>