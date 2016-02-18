<%@ page contentType="text/html; charset=UTF-8"%>

<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인사카드 작성</title>
<link rel="stylesheet" type="text/css" href="/erp/resources/join.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

<script type="text/javascript">

	function sendIt(){
			
			f = document.myForm;

		f.action = "<%=cp%>/created_ok.action";
		f.submit();
		
		
	}




</script>

</head>
<body>

<form action="" method="post" name="myForm" enctype="multipart/form-data">
<center>
<table border="0" align="center" width="1000" style="margin-top: 50px;" cellpadding="0" cellspacing="0">
	
<tr><td height="2" width="1000" style="background-color: #bbbbbb;"></td></tr>

	<tr>
		<td align="center" style="font-size: 30pt; font-family: 고딕; font-weight: bold;">인사카드 작성</td>
	</tr>
	
<tr><td height="2" width="1000" style="background-color: #bbbbbb;"></td></tr>


</table>

<table border="0" width="1000"align="center" style="margin: 20px;">
	<tr height="40">
		<td width="100" align="center" style="font-size: 11pt;font-weight: bold;">사 진 업로드 : </td>
		<td width="400" colspan="3"><input type="file" name="upload" style="height: 30px; font-size: 12pt; font-family: 고딕; width: 400px; font-weight: bold;"></td>
		<td width="500" align="right" colspan="2">
		<button type="button" style="width: 100px; height: 30px; font-size: 10pt; font-family: 고딕; font-weight: bold;" class="btn btn-default" onclick="sendIt();">등록하기</button>
		<button type="button" style="width: 50px; height: 30px; font-size: 10pt; font-family: 고딕;" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/insa.action';">취소</button>
		</td>
		
	</tr>
</table>

<table border="0" width="1000"align="center" style="margin: 20px ; border-radius : 10px; background-color: #eeeeee">
	
	<tr height="40">
		<td width="100" class="color" align="center">이 름</td>
		<td width="400" colspan="3" align="center"><input type="text" class="form-control" id="usr" name="name" placeholder="ex) 홍 길 동" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 400px;"></td>
		<td width="100" class="color" align="center">주민번호</td>
		<td width="400" colspan="3" align="center"><input type="text" class="form-control" id="usr" name="jumin" placeholder="ex) 123456-1234567" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 400px;"></td>
	</tr>
	<tr height="40">
		<td width="100" class="color" align="center">주 소</td>
		<td width="400" colspan="3" align="center"><input type="text" class="form-control" id="usr" name="addr" placeholder="ex) 서울시 강남구 역삼동 ... " style="height: 35px; font-size: 15pt; font-family: 고딕; width: 400px;"></td>
		<td width="100" class="color" align="center">생 일</td>
		<td width="400" colspan="3" align="center"><input type="text" class="form-control" id="usr" name="birth" placeholder="ex) 12월 25일" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 400px;"></td>
	</tr>
	<tr height="40">
		<td width="100" class="color" align="center">사내번호</td>
		<td width="400" colspan="3" align="center"><input type="text" class="form-control" id="usr" name="oPhone" placeholder="ex) 070-1234-5678" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 400px;"></td>
		<td width="100" class="color" align="center">휴대전화</td>
		<td width="400" colspan="3" align="center"><input type="text" class="form-control" id="usr" name="mPhone" placeholder="ex) 010-1234-5678" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 400px;"></td>
	</tr>
	<tr height="40">
		<td width="100" class="color" align="center">부 서</td>
		<td width="400" colspan="3" align="center"><input type="text" class="form-control" id="usr" name="depth5" placeholder="ex) 사업부" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 400px;"></td>
		<td width="100" class="color" align="center">E-Mail</td>
		<td width="400" colspan="3" align="center"><input type="text" class="form-control" id="usr" name="email" value="babonim@punch.com" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 400px;"></td>
	</tr>
	<tr height="40">
		<td width="100" class="color" align="center">아이디</td>
		<td width="150" ><input type="text" class="form-control" id="usr" name="id" placeholder="ex) kim123" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 150px;"></td>
		<td width="100" class="color" align="center">비밀번호</td>
		<td width="150" ><input type="text" class="form-control" id="usr" name="pwd" placeholder="ex) 1234" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 150px;"></td>
		<td width="100" class="color" align="center">직 급</td>
		<td width="150"><input type="text" class="form-control" id="usr" name="grade" placeholder="ex) 대리" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 150px;"></td>
		<td width="100" class="color" align="center">직 책</td>
		<td width="150"><input type="text" class="form-control" id="usr" name="duty" placeholder="ex) 팀장" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 150px;"></td>
	</tr>
	<tr height="40">
		<td width="100" class="color" align="center">혈액형</td>
		<td width="150" >
		<select name="blood" class="form-control" id="usr" style="height: 35px; font-family: 고딕; width: 150px;">
   			<option value="">선택</option>
    		<option value="A">A</option>
    		<option value="B">B</option>
    		<option value="O">O</option>
    		<option value="AB">AB</option>
		</select>
		</td>
		<td width="100" class="color" align="center">종 교</td>
		<td width="150" ><input type="text" class="form-control" id="usr" name="reli" placeholder="ex) 기독교" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 150px;"></td>
		<td width="100" class="color" align="center">취 미</td>
		<td width="150" ><input type="text" class="form-control" id="usr" name="hobby" placeholder="ex) 농구" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 150px;"></td>
		<td width="100" class="color" align="center">근 태</td>
		<td width="150" ><input type="text" class="form-control" id="usr" name="dal" placeholder="ex) 휴가" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 150px;"></td>
	</tr>
	<tr height="40">
		<td width="100" class="color" align="center">메 모</td>
		<td width="400" colspan="7" ><textarea class="form-control" id="usr" name="memo" placeholder="ex) 특이사항" style="height: 200px; font-size: 15pt; font-family: 고딕; width: 900px;"></textarea></td>
	</tr>
	
	
</table>











</center>
</form>


</body>
</html>