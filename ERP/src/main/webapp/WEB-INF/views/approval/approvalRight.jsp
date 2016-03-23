<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script type ="text/javascript">

	var approvalNum = "";

	function winOpen(approvalNum){
		window.open('http://localhost:8080/erp/approvalArticle?approvalNum='+approvalNum,'', 'width=1000, height=1000, toolbar=no, menubar=no, scrollbars=yes, resizable=yes');
	}
</script>

<title>Insert title here</title>
</head>
<body>

<div style="width: 100%;">
	<div style="width: 1568px; float: right;" class="buseo2"><font style="font-style: 나눔고딕코딩;">${head }</font></div>
</div>
</br></br></br></br>
<div style="width: 100%;">
<table cellpadding="0" cellspacing="0" border="0" width="100%">

<!-- 줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄 -->
	<tr height="1">
	<td width="52%" bgcolor="#EAEAEA" align="center"></td>
	<td width="12%" bgcolor="#EAEAEA" align="center"></td>
	<td width="12%" bgcolor="#EAEAEA" align="center"></td>
	<td width="12%" bgcolor="#EAEAEA" align="center"></td>
	<td width="12%" bgcolor="#EAEAEA" align="center"></td>
	</tr>
<!-- 줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄 -->
	<tr height="32">
	<td width="52%" bgcolor="#FCFCFC" align="center"><font style="font-style: 나눔고딕코딩; size: 11pt; font-weight: bold">제 목</font></td>
	<td width="12%" bgcolor="#FCFCFC" align="center"><font style="font-style: 나눔고딕코딩; size: 11pt; font-weight: bold">양식명</font></td>
	<td width="12%" bgcolor="#FCFCFC" align="center"><font style="font-style: 나눔고딕코딩; size: 11pt; font-weight: bold">상 태</font></td>
	<td width="12%" bgcolor="#FCFCFC" align="center"><font style="font-style: 나눔고딕코딩; size: 11pt; font-weight: bold">기안자</font></td>
	<td width="12%" bgcolor="#FCFCFC" align="center"><font style="font-style: 나눔고딕코딩; size: 11pt; font-weight: bold">기안일시</font></td>
	</tr>
<!-- 줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄 -->
	<tr height="1">
	<td width="52%" bgcolor="#EAEAEA" align="center"></td>
	<td width="12%" bgcolor="#EAEAEA" align="center"></td>
	<td width="12%" bgcolor="#EAEAEA" align="center"></td>
	<td width="12%" bgcolor="#EAEAEA" align="center"></td>
	<td width="12%" bgcolor="#EAEAEA" align="center"></td>
	</tr>
<!-- 줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄 -->

<c:choose>



<c:when test="${approvalList==null}">

	<tr height="50">
	<td width="1px" bgcolor="" colspan="5" align="center"><font style="font-style: 나눔고딕코딩; size: 12pt;">진행중인 결재가 없습니다!</font></td>
	</tr>

<!-- 줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄 -->
	<tr height="1">
	<td width="52%" bgcolor="#EAEAEA" align="center"></td>
	<td width="12%" bgcolor="#EAEAEA" align="center"></td>
	<td width="12%" bgcolor="#EAEAEA" align="center"></td>
	<td width="12%" bgcolor="#EAEAEA" align="center"></td>
	<td width="12%" bgcolor="#EAEAEA" align="center"></td>
	</tr>
<!-- 줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄 -->

</c:when>


<c:when test="${approvalList!=null}">

<c:forEach var="dto" items="${approvalList}" >
		
	<tr height="28">
	<td width="52%" align="left">
	<font style="font-style: 나눔고딕코딩; size: 10pt;">&nbsp;&nbsp;&nbsp;
	<a href="javascript:winOpen('${dto.approvalNum}')" style="text-decoration: none; color: black;">${dto.subject }</a></font></td>
	<td width="12%" align="center"><font style="font-style: 나눔고딕코딩; size: 10pt;">${dto.type }</font></td>
	<td width="12%" align="center">
	<c:choose>
		<c:when test="${dto.info=='ing'}">
			<font style="font-style: 나눔고딕코딩; size: 10pt;">진행중</font>
		</c:when>
		<c:when test="${dto.info=='back'}">
			<font style="font-style: 나눔고딕코딩; size: 10pt; color: red; font-weight: bold;">반 려</font>
		</c:when>
		<c:when test="${dto.info=='success'}">
			<font style="font-style: 나눔고딕코딩; size: 10pt; color: blue; font-weight: bold;">완 료</font>
		</c:when>
	</c:choose>	
	</td>
	<td width="12%" align="center"><font style="font-style: 나눔고딕코딩; size: 10pt;">${dto.id }</font></td>
	<td width="12%" align="center"><font style="font-style: 나눔고딕코딩; size: 10pt;">${dto.created}</font></td>
	</tr>	
	
	<!-- 줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄 -->
	<tr height="1">
	<td width="52%" bgcolor="#EAEAEA" align="center"></td>
	<td width="12%" bgcolor="#EAEAEA" align="center"></td>
	<td width="12%" bgcolor="#EAEAEA" align="center"></td>
	<td width="12%" bgcolor="#EAEAEA" align="center"></td>
	<td width="12%" bgcolor="#EAEAEA" align="center"></td>
	</tr>
	<!-- 줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄줄 -->
			
</c:forEach> 

</c:when>

</c:choose>

</table>

</div>


</body>
</html>