<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="a" value="${num }"/>
<c:forEach items="${lists }" var="dto" >
<div id="applovalfLine">
<table align="right" cellspacing="0" cellpadding="0">
<tr><td width="110" height="1" bgcolor="#BDBDBD"></td><td width="1" height="1" bgcolor="#BDBDBD"></td></tr>
<tr><td width="110" height="28" bgcolor="#EAEAEA" align="center">
<font style="font-size: 10pt; font-weight: bold;">
<c:choose>
<c:when test="${num!=a}">
결재
</c:when>
<c:when test="${num==a}">
전결
<input type="hidden" value="${num }" name="approvalDepth"/>
</c:when>
</c:choose>
</font></td><td width="1" height="" bgcolor="#BDBDBD"></td></tr>
<tr><td width="110" height="1" bgcolor="#BDBDBD"></td><td width="1" height="1" bgcolor="#BDBDBD"></td></tr>
<tr><td width="110" height="28" align="center"><font style="font-size: 9pt;">${dto.name}</font></td><td width="1" height="" bgcolor="#BDBDBD"></td></tr>
<tr><td width="110" height="1" bgcolor="#BDBDBD"></td><td width="1" height="1" bgcolor="#BDBDBD"></td></tr>
<tr><td width="110" height="28" align="center"></td><td width="1" height="" bgcolor="#BDBDBD"></td></tr>	      
<tr><td width="110" height="1" bgcolor="#BDBDBD"></td><td width="1" height="1" bgcolor="#BDBDBD"></td></tr>
<tr><td width="110" height="28" align="center"></td><td width="1" height="" bgcolor="#BDBDBD"></td></tr>
<tr><td width="110" height="1" bgcolor="#BDBDBD"></td><td width="1" height="1" bgcolor="#BDBDBD"></td></tr>
<input type="hidden" value="${dto.id }" name="depth${a + 1}"/>
<c:set var="a" value="${a - 1}"/>
</table>
</div>
</c:forEach>