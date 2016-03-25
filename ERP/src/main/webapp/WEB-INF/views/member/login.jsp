<%@ page contentType="text/html; charset=UTF-8"%>

<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href='http://fonts.googleapis.com/css?family=Mouse+Memoirs' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  

  
<title>로그인</title>

<script type="text/javascript">


function login(){
	
	var f = document.myForm;
	
	if(!f.userId.value){
		alert("아이디를 입력하세요!");
		f.userId.focus();
		return;
	}
	

	if(!f.userPwd.value){
		alert("패스워드를 입력하세요!");
		f.userPwd.focus();
		return;
	}
	
	f.action = "<%=cp%>/login_ok.action";
	f.submit();
	
	
}




</script>

</head>


<body style="background-image: url('/erp/resources/image/backok.jpg');">

<form action="" method="post" name="myForm">
<center>
<div align="center" style="width: 1000px;">

 	<table border="0" width="1000" height="200" align="center" style="margin-top: 150px;">
		<tr>
			<td align="center" style="vertical-align: bottom;"><img alt="" src="/erp/resources/image/Login.png" height="150"> </td>
		</tr>
	</table>
	

	<table align="center" cellpadding="0" cellspacing="0" border="0" style="width:500px;">
	
	
<tr height="30" style="margin-bottom: 5px;">
	<td colspan="2" align="center" ></td>
</tr>



<tr height="40" >
	
	<td width="200" style="padding-left: 5px;">
	  			<input type="text" class="form-control" id="usr" name="userId" placeholder="Id" style="height: 50px; font-size: 20px; font-family: 고딕; width: 400px;">
	</td>
	<td rowspan="3" width="40" height="40"><button type="button" style="width: 110px; height: 110px; font-size: 20pt; font-family: 고딕; margin-left: 5px;" class="btn btn-success" onclick="login();">Sign in</button></td>
</tr>

<tr height="3">
	<td colspan="2" bgcolor="#ffffff"></td>
	<td></td>
</tr>


<tr height="40">
	
	<td width="200" style="padding-left: 5px;">
	<input type="password" class="form-control" id="pwd" name="userPwd" placeholder="Password" style="height: 50px; font-size: 20px; font-family: 고딕; width: 400px;">
	</td>
</tr>

<tr height="15"><td colspan="2" bgcolor="#ffffff"></td></tr>


<tr height="30">
	<td colspan="2" align="left">
	&nbsp;<font style="font-family: 고딕; font-size: 13pt; font-weight: bold; color: orange;">※아이디 또는 비밀번호 분실시 관리자에게 간식을 가져다주세요.</font>
	</td>
</tr>	
<tr height="5"><td colspan="2" bgcolor="#ffffff"></td></tr>
<tr>
<td colspan="2" align="center">	
	<img alt="" src="/erp/resources/image/LoginG.jpg">
</td>
</tr>



</table>

</div>
</center>
</form>

</body>
</html>