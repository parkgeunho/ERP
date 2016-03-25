<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>직 원 검 색</title>

<link rel="stylesheet" type="text/css" href="/erp/resources/ManagementView.css">


<script type="text/javascript">
var winob = null;
	function search(){
		
		var f = document.myForm;
		
		f.action = "<%=cp%>/note/find";
		
		f.submit();
		
	}
	

	function article(num){

	

		
		
		winob = window.open("search_ok?num="+num,"","width=500px,height=600px");

	
		
		
		
	}
	
	 function setChildValue(name,num){
		opener.setChildValue(name,num);
		window.close();
	}
	 

	


</script>




</head>
<body>


<form action="" name="myForm" method="post">
<div style="margin-top: 20px;">
	<table align="center">
		<tr><td height="1" width="100%" style="background-color: #cccccc;"></td></tr>
		<tr>
			<td align="center"><font style="font-family: 고딕; font-size: 16pt; font-weight: bold;">직원 검색</font></td>
		</tr>
		<tr><td height="1" width="100%" style="background-color: #cccccc;"></td></tr>
		
	</table>
	
</div>

	<div style="margin-top: 15px;">
		<table border="0" width="100%" align="center">
			<tr>
				<td align="center">
				<select name="searchKey">
					<option value="usernum">사번</option>
					<option value="name">이름</option>
					<option value="grade">직급</option>
				</select>
				
				<input type="text" id="searchValue"
					name="searchValue" style="height: 16px; margin-left: 5px;">
					<span style="margin-left: 5px;"> <a href="javascript:search();"><img align="middle"
						src="/erp/resources/image/find.png"></a>
				</span></td>
			</tr>
		</table>
	</div>


	<div style="margin-top: 20px; overflow-y: scroll; height: 450px;" >
	<table align="center" width="90%" cellpadding="0" cellspacing="0" border="0">
		<tr class="search">
			<td align="center" width="50%">사원번호</td>
			<td align="center">이름</td>
			<td align="center">직급</td>
		</tr>
		<tr height="10">
			<td></td>
			<td></td>
			<td></td>
		</tr>
		
		<c:forEach items="${searchlists}" var="searchDTO">
		<tr >
			<td align="center" width="50%">${searchDTO.usernum}</td>
			<td align="center"><a href="javascript:article(${searchDTO.num });">${searchDTO.name}</a></td>
			<td align="center">${searchDTO.grade}</td>
		</tr>
		</c:forEach>
	</table>	
</div>







</form>


</body>
</html>