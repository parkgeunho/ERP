<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:set var="result" value="3"/>
<table border="1">

<tr>
<c:forEach var="i" begin="1" end="${result}">

<c:if test="${i==1}">
<td>결</td>
<td>기안자</td>
</c:if>

<c:if test="${i!=1}">
<td>결재자</td>
</c:if>

</c:forEach>
</tr>

<tr>
<c:forEach var="i" begin="1" end="${result}">

<c:if test="${i==1}">
<td>재</td>
<td>서명</td>
</c:if>

<c:if test="${i!=1}">
<td>서명</td>
</c:if>
</c:forEach>
</tr>

<tr>
<c:forEach var="i" begin="1" end="${result}">

<c:if test="${i==1}">
<td>라</td>
<td>서명</td>
</c:if>

<c:if test="${i!=1}">
<td>서명</td>
</c:if>

</c:forEach>
</tr>

<tr>
<c:forEach var="i" begin="1" end="${result}">

<c:if test="${i==1}">
<td>인</td>
<td>기안일</td>
</c:if>

<c:if test="${i!=1}">
<td>기안일</td>
</c:if>

</c:forEach>
</tr>


</table>

</body>
</html>