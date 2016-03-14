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
<link rel="stylesheet" href="/ERP/src/resources/css/style.css" type="text/css"/>
<link rel="stylesheet" href="/ERP/src/resources/css/created.css" type="text/css"/>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>


</head>
<body>




<table border="0" cellpadding="0" cellspacing="1" align="center" >
	<tr style="height: 40px; background: #D4D4D4">
		<td colspan="3" style="width: 1400px; letter-spacing: 5px; font-size: 20px;" align="center">&nbsp;&nbsp;&nbsp;&nbsp;공지사항		
		</td>	
	</tr>
	
	<tr style="height: 2px;">
		<td colspan="3" style="width: 1400px;" align="right">
			
		</td>
	</tr>


	<tr style="height: 30px; background: #6EE3F7" >
		<td style="width: 200px; height: 22px; letter-spacing: 5px;" align="center">제목</td>
		<td style="width: 1200px;">&nbsp;&nbsp;&nbsp;&nbsp;${dto.subject}</td>	
	</tr>
	
	<tr style="height: 30px; background: #6EE3F7" >
		<td style="width: 200px; height: 22px;" align="center">작성자</td>
		<td style="width: 1200px;">&nbsp;&nbsp;&nbsp;&nbsp;${dto.name}</td>
	</tr>
	<tr style="height: 0.5px; background: #B2EBF4">
		<td style="width: 1400px;" colspan="3"></td>
	</tr>
	
	<tr>
		<td style="height: 22px; width: 200px;" align="center">첨부파일</td>
		<td style="width: 1200px;">&nbsp;&nbsp;&nbsp;&nbsp;<a href="download.action">파일 다운</a>
			<img alt="" src="/erp/resources/boardimage/down002.png">&nbsp;&nbsp;  </td>
	</tr>
	
	<tr style="height: 1px; background: #B2EBF4">
		<td style="width: 1400px;" colspan="3"></td>
	</tr>
	
</table>

<table  border="0" align="center">
	<tr style="height: 450px;">
		<td style="width: 1400px;">&nbsp;&nbsp;&nbsp;&nbsp;${dto.content}</td>
	</tr>
	<tr style="height: 0.5px; background: #B2EBF4">
		<td style="width: 1400px;"></td>
	</tr>
</table>

<!-- 댓글 -->
<table border="0" align="center" cellpadding="0" cellspacing="0" >
	<tr style="height: 65px; background: #E1E1E1">
		<td style="width: 70px;" align="center">
			<img alt="" src="/erp/resources/image/image.jpg" style="width: 60px; height: 55px;">
		
		</td>			
		
		<td style="width: 1200px;">
			<textarea rows="" cols="" style="width: 1260px; height: 55px;"></textarea>
		</td>
		<td style="width: 60px;" align="center">
			<img alt="" src="/erp/resources/image/regist002.PNG" style="width: 55px; height: 50px;" onclick=""/>
		
			<!-- <input type="button" value="등록" class="btn2" onclick=""> -->
		</td>
	</tr>
</table>

<table>
	<tr>
		<td>
	
	</tr>



</table>



<!-- 댓글보기 -->
<table border="0" align="center" cellpadding="0" cellspacing="0"  >
	<tr style="height: 20px; background: ">
		<td style="width: 70px;" align="center" rowspan="2">
			<img alt="" src="/erp/resources/image/image.jpg" style="width: 60px; height: 45px;">
		
		</td>
			
		
		
		<td style="width: 1320px; height: 15px; font-size: 13px;">작성자/시간</td>
				
	</tr>
	
	<tr style="height: 35px; background: ">
		
		<td style="width: 1320px; height: 40px;">내용</td>
	</tr>
	
	
</table>





<table border="0" align="center">
	<tr style="height: 0.5px;">
		<td style="width: 1400px; background: #B2EBF4" colspan="2">
		</td>
	</tr>
	<tr style="height: 3px;">
		<td></td>
	</tr>
	
	<tr style="height: 30px;">
		<td style="width: 1400px;" align="right">
			<select>
				<option>보내기</option>
				<option>목적에</option>
				<option>맞는</option>
				<option>게시판</option>
			</select>
			<input type="button" value="리스트" class="btn2" style="background: #FFFFFF" 
				onclick="javasctipt:location.href='<%=cp%>/board/list.action';">
				
			<input type="button" value="수정" class="btn2" style="background: #FFFFFF"
				onclick="javascript:location.href='<%=cp%>/board/update.action?boardNum=${dto.boardNum}&pageNum=${pageNum}';">	
			
			<input type="button" value="삭제" class="btn2" style="background: #FFFFFF" 
				onclick="javascript:location.href='<%=cp%>/board/delete.action?boardNum=${dto.boardNum}&pageNum=${pageNum}';">
		
		</td>
	
	
	
	</tr>


</table>







</body>
</html>