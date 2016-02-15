<%@ page contentType="text/html; charset=UTF-8"%>

<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/erp/resources/join.css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

</head>
<body>

<form action="" method="post" enctype="multipart/form-data">
<center>
<table border="0" width="1000" height="50" align="center" style="margin-top: 50px; border-radius : 10px; background: linear-gradient(100deg,#49B5F4,#669900);">
	<tr>
		<td align="center" style=" font-size: 20pt; font-family: 고딕;font-weight: bold; color: white; " >인사카드 입력</td>
	</tr>
</table>

<table border="1" width="1000"align="center" style="margin: 20px;">
	<tr height="40">
		<td width="100" align="center" style="font-size: 11pt;font-weight: bold;">사 진 업로드 : </td>
		<td width="400" colspan="3"><input type="file" name="upload" style="height: 30px; font-size: 12pt; font-family: 고딕; width: 400px; font-weight: bold;"></td>
		<td width="500" align="right" colspan="2">
		<button type="button" style="width: 100px; height: 30px; font-size: 12pt; font-family: 고딕;" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/login.action';">등록하기</button>
		<button type="button" style="width: 100px; height: 30px; font-size: 12pt; font-family: 고딕;" class="btn btn-default" onclick="javascript:location.href='<%=cp%>/login.action';">Forget</button>
		</td>
		
	</tr>
</table>

<table border="1" width="1000"align="center" style="margin: 20px; background: linear-gradient(270deg,#66cc00,#ffffff); border-radius : 10px;">
	
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
		<td width="400" colspan="3" align="center"><input type="text" class="form-control" id="usr" name="jumin" value="babonim@punch.com" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 400px;"></td>
		<td width="100" class="color" align="center">E-Mail</td>
		<td width="400" colspan="3" align="center"><input type="text" class="form-control" id="usr" name="email" placeholder="ex) 사업부" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 400px;"></td>
	</tr>
	<tr height="40">
		<td width="100" class="color" align="center">아이디</td>
		<td width="150" ></td>
		<td width="100" class="color" align="center">비밀번호</td>
		<td width="150" ></td>
		<td width="100" class="color" align="center">직 급</td>
		<td width="150"></td>
		<td width="100" class="color" align="center">직 책</td>
		<td width="150"></td>
	</tr>
	<tr height="40">
		<td width="100" class="color" align="center">혈액형</td>
		<td width="150" ></td>
		<td width="100" class="color" align="center">종 교</td>
		<td width="150" ></td>
		<td width="100" class="color" align="center">취 미</td>
		<td width="150" ></td>
		<td width="100" class="color" align="center">근 태</td>
		<td width="150" ></td>
	</tr>
	<tr height="40">
		<td width="100" class="color" align="center">메 모</td>
		<td width="400" colspan="7"></td>
	</tr>
</table>











</center>
</form>


</body>
</html>