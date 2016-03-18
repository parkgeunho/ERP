<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet" type="text/css" href="/erp/resources/ManagementView.css">


</head>
<body>




<table border="0" cellpadding="0" cellspacing="1" align="center" >
	<tr style="height: 80px; background: #D4D4D4">
		<td colspan="3" style="width: 1572px; font-size: 20px;" align="center" >
		${listDTO.boardName }	
		</td>	
	</tr>
	

	<tr style="height: 25px; background: #00D8FF" >
		<td style="width: 200px;  color: white; font-size: 20px;" align="center">제&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;목</td>
		<td style="width: 1372px; color: white; font-size: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;${dto.subject}</td>	
	</tr>
	
	<tr style="height: 25px; background: #00D8FF" >
		<td style="width: 200px; height: 22px; color: white; font-size: 20px;" align="center">작&nbsp;성&nbsp;자</td>
		<td style="width: 1372px; color: white; font-size: 20px;">&nbsp;&nbsp;&nbsp;&nbsp;${dto.name}</td>
	</tr>
	<tr style="height: 1px; background: #B2EBF4">
		<td style="width: 1572px;" colspan="3"></td>
	</tr>
</table>
	
<table align="center" border="0" cellpadding="0" cellspacing="0">
	
	<tr style="height: 15px">
		<td style="width: 200px;" align="center">첨부파일</td>
		<td style="width: 300px;"></td>
		<td style="width: 1072px;">&nbsp;<a href="download.action">
			<img alt="" src="/erp/resources/boardimage/down002.png"></a>&nbsp;&nbsp;  </td>
	</tr>
	
	
	
	<tr style="height: 1px; background: #B2EBF4">
		<td style="width: 1572px;" colspan="3"></td>
	</tr>
	
</table>

<table  border="0" align="center">
	<tr style="height: 400px;">
		<td style="width: 1572px;">&nbsp;&nbsp;&nbsp;&nbsp;${dto.content}</td>
	</tr>
	<tr style="height: 1px; background: #B2EBF4">
		<td style="width: 1572px;"></td>
	</tr>
</table>

<!-- 댓글 -->
<table border="0" align="center" cellpadding="0" cellspacing="0" >
	<tr style="height: 60px; background: #E1E1E1">
		<td style="width: 70px;" align="center">
			<img alt="" src="/erp/resources/image/image.jpg" style="width: 60px; height: 55px;">
		
		</td>			
		
		<td style="width: 1200px;">
			<textarea rows="" cols="" style="width: 1432px; height: 55px;"></textarea>
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
	<tr style="height: 15px; background: ">
		<td style="width: 70px;" align="center" rowspan="2">
			<img alt="" src="/erp/resources/image/image.jpg" style="width: 60px; height: 45px;">
		
		</td>
			
		
		
		<td style="width: 1502px; font-size: 13px;">작성자/시간</td>
				
	</tr>
	
	<tr style="height: 30px; background: ">
		
		<td style="width: 1502px; height: 40px;">내용</td>
	</tr>
	
	
</table>





<table border="0" align="center">
	<tr style="height: 1px;">
		<td style="width: 1572px; background: #B2EBF4" colspan="2">
		</td>
	</tr>
	<tr style="height: 3px;">
		<td></td>
	</tr>
	
	<tr style="height: 30px;">
		<td style="width: 1572px;" align="right">			
			<%-- <input type="button" value="리스트" class="btn2" style="background: #00D8FF; color: white;" 
				onclick="javasctipt:location.href='<%=cp%>/board/list.action';"> --%>
				
			<input type="button" value="수정" class="btn2" style="background: #00D8FF; color: white;"
				onclick="javascript:location.href='<%=cp%>/board/update.action?boardNum=${dto.boardNum}&pageNum=${pageNum}&listNum=${listNum }';">	
			
			<input type="button" value="삭제" class="btn2" style="background: #00D8FF; color: white;" 
				onclick="javascript:location.href='<%=cp%>/board/delete.action?boardNum=${dto.boardNum}&pageNum=${pageNum}&listNum=${listNum }';">
		
		</td>
	</tr>
</table>







</body>
</html>