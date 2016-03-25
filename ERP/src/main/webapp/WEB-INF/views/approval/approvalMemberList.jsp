<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String cp = request.getContextPath();
%>

<div style="vertical-align: top;">
	<%-- <c:set var="yo" value="1"/> --%>
	
	<c:forEach var="dto" items="${lists}"  >
		<table cellpadding="0" cellspacing="0" border="0" style="dotted black;">
			<%-- <c:set var=yo value="${yo }+1"/> --%>
			<tr>
				<td width="1" bgcolor=""></td>			
				<td width="25" align="center">
					<input type="checkbox" id="" name="member[]" class="member" value="${dto.id }"/>
				</td>	
				<td width="1" bgcolor=""></td>
				<td width="80" align="center">
					<font style="font-size: 9pt;">
					<a href="javascript:openWin('${dto.num }')">${dto.name }</a>
					</font>
				</td>
				<td width="1" bgcolor=""></td>
				<td width="80" align="center">
					<font style="font-size: 9pt;">${dto.grade }</font>
				</td>			
			</tr>
			<tr><td colspan="6" height="1" bgcolor=""></td></tr>
		</table>
	</c:forEach>									
</div>
