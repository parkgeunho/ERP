<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="/erp/resources/ManagementView.css">
<link rel="stylesheet" type="text/css" href="/erp/resources/join.css">
<script type="text/javascript" src="/erp/resources/member/util.js"></script>

<title>정 보 수 정</title>

<script type="text/javascript">

	function sendIt(){
		
		f = document.myForm;
		
		if (f.email.value) {
			if (!isValidEmail(f.email.value)) {
				alert("\n정상적인 E-Mail을 입력하세요. ");
				f.email.focus();
				return;
			}
		}
		
		
		str = f.pwd.value;
		str = str.trim();
		if (!str) {
			alert("\비밀번호를 필수로 입력하세요. ");
			f.pwd.focus();
			return;
		}
		
		
		
		
		f.action = "<%=cp%>/smallUpdated_ok.action";
		f.submit();
		
		alert("수정완료!");
		
		window.opener.location.reload();
		window.close();
	}
	
	function wclose(){
		
		
		window.close();
		
		
	}


</script>




</head>
<body>

<div style="margin-top: 50px;">
	<table align="center">
		<tr><td height="1" width="100%" style="background-color: #cccccc;"></td></tr>
		<tr>
			<td align="center"><font style="font-family: 고딕; font-size: 16pt; font-weight: bold;">정보 수정</font></td>
		</tr>
		<tr><td height="1" width="100%" style="background-color: #cccccc;"></td></tr>
	</table>
</div>

<form action="" method="post" name="myForm" >
<div style="margin-top: 20px;">
	<table align="center" border="0">
		<tr>
			<td colspan="2"><span style="font-size: 10pt; font-family: 고딕; font-weight: bold; color: orange;">※아이디 수정은 관리자에게 문의하세요</span></td>
		</tr>
		<tr>
			<td class="search">아이디</td>
			<td class="dap_text_box" id="usr" style="height: 30px; font-size: 15pt; font-family: 고딕;">${dto.id}</td>
		</tr>
		<tr>
			<td class="search">비밀번호</td>
			<td><input type="password" value="${dto.pwd }" class="dap_text_box" id="usr" name="pwd" style="height: 30px; font-size: 15pt; font-family: 고딕; width: 95%;"></td>
		</tr>
		<tr>
			<td class="search">이메일</td>
			<td><input type="text" value="${dto.email }" class="dap_text_box" id="usr" name="email" style="height: 30px; font-size: 15pt; font-family: 고딕; width: 95%;"></td>
		</tr>
		<tr>
			<td class="search">휴대폰</td>
			<td><input type="text" value="${dto.mPhone }" class="dap_text_box" id="usr" name="mPhone" style="height: 30px; font-size: 15pt; font-family: 고딕; width: 95%;"></td>
		</tr>
		<tr>
			<td class="search">주소</td>
			<td><input type="text" value="${dto.addr }" class="dap_text_box" id="usr" name="addr" style="height: 30px; font-size: 15pt; font-family: 고딕; width: 95%;"></td>
		</tr>
		<tr>
			<td class="search">취미</td>
			<td><input type="text" value="${dto.hobby }" class="dap_text_box" id="usr" name="hobby" style="height: 30px; font-size: 15pt; font-family: 고딕; width: 95%;"></td>
		</tr>
		<tr>
			<td class="search">종교</td>
			<td><input type="text" value="${dto.reli }" class="dap_text_box" id="usr" name="reli" style="height: 30px; font-size: 15pt; font-family: 고딕; width: 95%;"></td>
		</tr>
	</table>
</div>
<div style="margin-top: 10px;">
	<table align="center">
		<tr>
			<td>
			<button type="button" style="width: 100px; height: 30px; font-size: 10pt; font-family: 고딕; " class="okbtn" onclick="sendIt();">수정하기</button>
			<button type="button" style="width: 70px; height: 30px; font-size: 10pt; font-family: 고딕;" class="okbtn" onclick="wclose();">취소</button>
			</td>
		</tr>
	</table>
</div>

<input type="hidden" name="id" value="${dto.id}">


</form>
</body>
</html>