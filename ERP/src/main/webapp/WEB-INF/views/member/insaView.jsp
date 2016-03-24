<%@ page contentType="text/html; charset=UTF-8"%>

<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인사기록카드</title>
<link rel="stylesheet" type="text/css" href="/erp/resources/insaview.css">
<link rel="stylesheet" type="text/css" href="/erp/resources/ManagementView.css">

<script type="text/javascript">
	
	function deleted(){
	
	var url = "<%=cp%>/deleted_ok.action?num=${dto.num}&upload=${dto.upload}";
	
	var del = confirm("정말 삭제 하시겠습니까?");
	
	if(del==true){
		location.href = url;
	}else{
		
		return;
	}
	
	
	
}


</script>



</head>
<body >

<form action="" method="post">
<center>
<table border="0" align="center" width="1000" style="margin-top: 50px;">
	
<tr><td height="1" width="1000" style="background-color: #cccccc;"></td></tr>

	<tr>
		<td align="center" style="font-size: 30pt; font-family: 고딕; font-weight: bold;">인사기록카드</td>
	</tr>
	
<tr><td height="1" width="1000" style="background-color: #cccccc;"></td></tr>


</table>

<table border="0" align="center" width="1000px" style="margin-top: 20px;" cellpadding="1" cellspacing="1">
	<tr>
		<td width="630">
		<button type="button" style="width: 100px; height: 30px; font-size: 10pt; font-family: 고딕; " class="okbtn" onclick="javascript:location.href='<%=cp%>/updated.action?num=${dto.num}';">수정하기</button>
		<button type="button" style="width: 100px; height: 30px; font-size: 10pt; font-family: 고딕; " class="okbtn" onclick="javascript:deleted();">삭제하기</button>
		<button type="button" style="width: 100px; height: 30px; font-size: 10pt; font-family: 고딕; " class="okbtn" onclick="javascript:location.href='<%=cp%>/insa.action';">돌아가기</button>
		</td>
		<td class="line1" align="center">보 안 등 급</td>
		<td style="width: 250px; background-color: #F6F6F6; border: 2px;" align="center">${dto.secure}</td>
	</tr>

</table>
	

<table border="0" align="center" cellpadding="1" cellspacing="1" style="margin-top: 20px; width: 1000px; border-radius: 10px;">
	<tr height="60">
		<td colspan="2" rowspan="4" class="pic">
			<table border="0" height="240" width="150" cellpadding="0" cellspacing="0" style="border: thin;">
				<tr>
					<td align="center"><img alt="이미지" src="${imagePath}/${dto.upload}" height="235" width="200"></td>
				</tr>
			</table>
		</td>
		<td class="line1" align="center">부 서</td>
		<td class="line2" align="center">${dto.depth1} ${dto.depth2} ${dto.depth3} ${dto.depth4} ${dto.depth5} </td>
		<td class="line1" align="center">직 급</td>
		<td class="line2" align="center">${dto.grade}</td>
	</tr>
	<tr height="60">
		<td class="line1" align="center">이 름</td>
		<td class="line2" align="center">${dto.name}</td>
		<td class="line1" align="center">직 책</td>
		<td class="line2" align="center">${dto.duty}</td>
	</tr>
	<tr height="60">
		<td class="line1" align="center">사 내 번 호</td>
		<td class="line2" align="center">${dto.oPhone}</td>
		<td class="line1" align="center">휴 대 폰</td>
		<td class="line2" align="center">${dto.mPhone}</td>
	</tr>
	<tr height="60">
		<td class="line1" align="center">주 민 번 호</td>
		<td class="line2" align="center">${dto.jumin}</td>
		<td class="line1" align="center">근 태</td>
		<td class="line2" align="center">${dto.dal}</td>
	</tr>
	<tr height="60">
		<td  rowspan="6" width="80" class="line3" align="center">기타</td>
		<td rowspan="2" width="80" bgcolor="#eeeeee" align="center">1.</td>
		<td class="line1" align="center">주 소</td>
		<td class="line2" align="center" colspan="4">${dto.addr}</td>
	</tr>
	<tr height="60">
		<td class="line1" align="center">아 이 디</td>
		<td class="line2" align="center">${dto.id}</td>
		<td class="line1" align="center">비 밀 번 호</td>
		<td class="line2" align="center">${dto.pwd}</td>
	</tr>
	<tr height="60">
		<td rowspan="2" bgcolor="#eeeeee" align="center">2.</td>
		<td class="line1" align="center">E-mail</td>
		<td class="line2" align="center">${dto.email}</td>
		<td class="line1" align="center">혈액형</td>
		<td class="line2" align="center">${dto.blood}</td>
	</tr>
	<tr height="60">
		<td class="line1" align="center">종 교</td>
		<td class="line2" align="center">${dto.reli}</td>
		<td class="line1" align="center">취 미</td>
		<td class="line2" align="center">${dto.hobby}</td>
	</tr>
	<tr height="60">
		<td rowspan="2" bgcolor="#eeeeee" align="center">특이사항</td>
		<td class="line1" align="center" rowspan="2">메 모</td>
		<td class="line2" align="left" valign="top" rowspan="2" colspan="4" style="padding: 20px;">${dto.memo}</td>
	</tr>
	<tr height="60">
	</tr>





</table>




</center>


</form>


</body>
</html>