<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직 원 정 보</title>

<link rel="stylesheet" type="text/css" href="/erp/resources/ManagementView.css">
<script type="text/javascript">


function sendChildValue(){
	
	var name = document.getElementById("searchName").value;
	var num = document.getElementById("searchNum").value;
	
	opener.setChildValue(name,num); 
	window.close();
} 



</script>

</head>
<body style="background-image: url('/erp/resources/image/backok.jpg'); height: 600px; width: 490px;">


<div>
	<table align="center">
		<tr>
			<td><img alt="이미지" src="${imagePath}/${Mdto.upload}" height="180" width="150"></td>
		</tr>
	</table>
</div>

<div style="overflow-y: scroll;">
	<table align="center" border="0" width="90%" >
		
		<tr>
			<td width="25%" class="search">부서</td>
			<td width="75%" class="underLine"> ${depth}</td>
		</tr>
	
		<tr>
			<td class="search">이름</td>
			<td class="underLine"> ${Mdto.name}</td>
		</tr>
		<tr>
			<td class="search">나이</td>
			<td class="underLine"> ${ageOk}</td>
		</tr>
		<tr>
			<td class="search">성별</td>
			<td class="underLine"> ${sex}</td>
		</tr>
		<tr>
			<td class="search">생일</td>
			<td class="underLine"> ${birth }</td>
		</tr>
		<tr>
			<td class="search">아이디</td>
			<td class="underLine"> ${Mdto.id }</td>
		</tr>
		<tr>
			<td class="search">사내번호</td>
			<td class="underLine"> ${Mdto.oPhone }</td>
		</tr>
		<tr>
			<td class="search">이메일</td>
			<td class="underLine"> ${Mdto.email }</td>
		</tr>
		<tr>
			<td class="search">직급</td>
			<td class="underLine"> ${Mdto.grade}</td>
		</tr>
		<tr>
			<td class="search">직책</td>
			<td class="underLine"> ${Mdto.duty}</td>
		</tr>
		<tr>
			<td class="search">근태</td>
			<td class="underLine"> ${Mdto.dal}</td>
		</tr>
		
	</table>
	<input type="hidden" id="searchName" value="${Mdto.name }">
	<input type="hidden" id="searchNum" value="${Mdto.num }">
	
</div>
<div style="margin-left: 200px;" class="buttonsq" onclick="sendChildValue()">선택</div>


</body>
</html>