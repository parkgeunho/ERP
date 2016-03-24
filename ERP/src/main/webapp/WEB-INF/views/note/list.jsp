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







</head>
<body>
<Div style="width: 600px; height: 600px; border: 0px solid;">
	<div style="width:560px; height: 40px; margin-left:20px; line-height: 40px; border-bottom: 1px solid">받은 쪽지함</Div>
	<div>
	<table height="500px; " width="560px;" border="0" style="margin-left: 20px; margin-top: 10px; 
		border-bottom: 0px solid; border-color:#E0E0E0; border-width: 1px; border-style: solid; border-bottom-width: 1; font-style: 나눔고딕코딩;" 
		cellpadding="0" cellspacing="0" >
		<tr height="25px;" style="background: #EAEAEA; font-weight: bold;">
			<td width="100px;" align="center">보낸사람</td> <td width="330px;" align="center">내용</td> <td width="130px;" align="center">보낸 날짜</td>
		</tr>
		<tr style="height: 1px;">
			<td style="width: 560px; background: #E0E0E0" colspan="3"></td>
		</tr>
		
		<tr height="25px;">
			<td align="center">이</td><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;게</td><td align="center">20개</td>
		</tr>
		<tr style="height: 1px;">
			<td style="width: 560px; background: #E0E0E0" colspan="3"></td>
		</tr>
	
		<tr height="25px;">
			<td align="center">이</td><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;게</td><td align="center">20개</td>
		</tr>
		
		<tr style="height: 1px;">
			<td style="width: 560px; background: #E0E0E0" colspan="3"></td>
		</tr>
		
		<tr height="25px;">
			<td align="center">이</td><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;게</td><td align="center">20개</td>
		</tr>
		
		<tr style="height: 1px;">
			<td style="width: 560px; background: #E0E0E0" colspan="3"></td>
		</tr>
		
		<tr height="25px;">
			<td align="center">이</td><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;게</td><td align="center">20개</td>
		</tr>
		
		<tr style="height: 1px;">
			<td style="width: 560px; background: #E0E0E0" colspan="3"></td>
		</tr>
		
		<tr height="25px;">
			<td align="center">이</td><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;게</td><td align="center">20개</td>
		</tr>
		
		<tr style="height: 1px;">
			<td style="width: 560px; background: #E0E0E0" colspan="3"></td>
		</tr>
		
		<tr height="25px;">
			<td align="center">이</td><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;게</td><td align="center">20개</td>
		</tr>
		
		<tr style="height: 1px;">
			<td style="width: 560px; background: #E0E0E0" colspan="3"></td>
		</tr>
		
		<tr height="25px;">
			<td align="center">이</td><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;게</td><td align="center">20개</td>
		</tr>
		
		<tr style="height: 1px;">
			<td style="width: 560px; background: #E0E0E0" colspan="3"></td>
		</tr>
		
		<tr height="25px;">
			<td align="center">이</td><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;게</td><td align="center">20개</td>
		</tr>
		
		<tr style="height: 1px;">
			<td style="width: 560px; background: #E0E0E0" colspan="3"></td>
		</tr>
		
		<tr height="25px;">
			<td align="center">이</td><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;게</td><td align="center">20개</td>
		</tr>
		
		<tr style="height: 1px;">
			<td style="width: 560px; background: #E0E0E0" colspan="3"></td>
		</tr>
		
		<tr height="25px;">
			<td align="center">이</td><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;게</td><td align="center">20개</td>
		</tr>
		
		<tr style="height: 1px;">
			<td style="width: 560px; background: #E0E0E0" colspan="3"></td>
		</tr>
		
		<tr height="25px;">
			<td align="center">이</td><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;게</td><td align="center">20개</td>
		</tr>
		
		<tr style="height: 1px;">
			<td style="width: 560px; background: #E0E0E0" colspan="3"></td>
		</tr>
		
		<tr height="25px;">
			<td align="center">이</td><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;게</td><td align="center">20개</td>
		</tr>
		
		<tr style="height: 1px;">
			<td style="width: 560px; background: #E0E0E0" colspan="3"></td>
		</tr>
		
		<tr height="25px;">
			<td align="center">이</td><td align="left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;게</td><td align="center">20개</td>
		</tr>
		
		<tr style="height: 1px;">
			<td style="width: 560px; background: #E0E0E0" colspan="3"></td>
		</tr>
	
		
		<tr height="25px;" >
			
			<td colspan="3" align="center">
		<p>	
			<c:if test="${dataCount!=0 }">
				${pageIndexList}			
			</c:if>
			
			<c:if test="${dataCount==0 }">
						쪽지가 없습니다.
			</c:if>
		</p>	
			</td>
		</tr>
		
		
		
		<tr style="height: 30px;">
			<td style="width: 560px;" align="right" colspan="3">
				<input type="button" value="닫기" class="btn2" style="background: #EAEAEA"
					onclick="">
			</td>
		</tr>
	</table>
	</Div>

</Div>
</body>
</html>