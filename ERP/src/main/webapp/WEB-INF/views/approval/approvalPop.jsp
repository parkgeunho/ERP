<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script language="javascript">
   function openWin(i) {
    window.open('./approvalCreated?num='+i, '','width=1000, height=1000, toolbar=no, menubar=no, scrollbars=no, resizable=yes');
    window.close();
   }
</script>

<title>결재 양식함</title>
</head>
<body>


<table cellpadding="0" cellspacing="0" style="width: 100%">
<tr height="1" bgcolor="#BDBDBD" style="width: 100%">
<td></td><td></td><td></td>
</tr>

<tr height="50" bgcolor="#EAEAEA" style="width: 100%">
<td><font style="font-weight: bold; font-size: 12pt">&nbsp;&nbsp;&nbsp;&nbsp;결재 양식함</font></td>
<td></td><td></td>
</tr>

<tr height="1" bgcolor="#BDBDBD" style="width: 100%">
<td></td><td></td><td></td>
</tr>

<tr height="40" bgcolor="" style="width: 100%">
<td>
<select>
<c:forEach var="dto" items="${Typelists }">
<option value="${dto.approvalFormType }">${dto.approvalFormType }</option>
</c:forEach>
</select>
</td>
<td></td>

<td align="right"><input type="button" onclick="window.close();" value="닫기"/></td>
</tr>

<tr height="1" bgcolor="#BDBDBD" style="width: 100%">
<td></td><td></td><td></td>
</tr>

<tr height="35" bgcolor="#EAEAEA" style="width: 100%">
<td align="center" colspan="3"><font style="font-size: 12pt; color: #8C8C8C;" >양식명</font></td>
<td></td><td></td>
</tr>

<tr height="1" bgcolor="#BDBDBD" style="width: 100%">
<td></td><td></td><td></td>
</tr>

<c:forEach var="dto" items="${lists }">

<tr height="28" style="width: 100%">
<td align="left" colspan="3"> 

<a href="javascript:openWin(${dto.approvalFormNum })" style="text-decoration: none; color: black;"> 
${dto.approvalFormName }</a>

</td>
<td></td><td></td>
</tr>

<tr height="1" bgcolor="#BDBDBD" style="width: 100%">
<td></td><td></td><td></td>
</tr>

</c:forEach>






</table>


  


</body>
</html>
