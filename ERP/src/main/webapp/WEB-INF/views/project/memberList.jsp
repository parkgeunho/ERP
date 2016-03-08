<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%        
	
	String cp = request.getContextPath();

%>



<table border="1px solid;" >
	<Tr height="30px;">
		<td width="110px;">사원번호</td>
		<td width="80px;">이름</td>
		<td width="100px;">아이디</td>
		<td width="110px;">사내번호</td>
		<td width="110px;">핸드폰번호</td>
		<td width="180px;">이메일</td>
		<td width="60px;">직급</td>
		<td width="450px;">부서</td>
		<td width="70px;">근태</td>
	</Tr>
	
	<c:forEach var="dto" items="${lists}">
		<tr height="30px;" >
			<td width="110px;">${dto.usernum }</td>
			<td width="8px;"><a href="<%=cp%>/insaView.action?num=${dto.num}">${dto.name }</a></td>
			<td width="100px;">${dto.id }</td>
			<td width="110px;">${dto.oPhone }</td>
			<td width="110px;">${dto.mPhone }</td>
			<td width="180px;">${dto.email }</td>
			<td width="60px;">${dto.grade }</td>
			<td width="450px;">${dto.depth1 }${dto.depth2 }${dto.depth3 }${dto.depth4 }${dto.depth5 }</td>
			<td width="70px;">${dto.dal }</td>
		</tr>
	</c:forEach>
					
	<c:forEach begin="1" end="${max-size }" step="1">
		<tr height="30px;">
			<td></td>
		</tr>
		
	
	</c:forEach>		
	
	
	<tr height="30px;">
		<Td>
			<c:if test="${dataCount!=0 }">
				${pageIndexList }
			</c:if>
		</Td>
	</tr>
					
</table>