<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String cp = request.getContextPath(); %>

<form>

	<select name="depth1" class="dap_text_box" onchange="change1();"  style="height: 35px; font-family: 고딕; width: 20%;float: left; margin-left: 4px;" >

		<c:forEach items="${lists}" var="dto">
			<c:choose>

				<c:when test="${dto.buseoNum==depth1 }">
					<option value="${dto.buseoNum }" selected="selected">${dto.buseoName }</option>
				</c:when>

				<c:otherwise>
					<option value="${dto.buseoNum }">${dto.buseoName }</option>
				</c:otherwise>
			</c:choose>

		</c:forEach>
	</select>

	<c:if test="${buseoChange1!=null}">
		<select name="depth2" class="dap_text_box" onchange="change1();"  style="height: 35px; font-family: 고딕; width: 20%;float: left;">
		<c:forEach items="${buseoChange1}" var="buseoChange1">
			<c:choose>

				<c:when test="${buseoChange1.buseoNum==depth2}">
					<option value="${buseoChange1.buseoNum }" selected="selected">${buseoChange1.buseoName}</option>
				</c:when>

				<c:otherwise>
					<option value="${buseoChange1.buseoNum }">${buseoChange1.buseoName }</option>
				</c:otherwise>
			</c:choose>

		</c:forEach>
		</select>
	</c:if>
	
	<c:if test="${buseoChange2!=null}">
		<select name="depth3" class="dap_text_box" onchange="change1();"  style="height: 35px; font-family: 고딕; width: 20%;float: left;">
		<c:forEach items="${buseoChange2}" var="buseoChange2">
			<c:choose>

				<c:when test="${buseoChange2.buseoNum==depth3 }">
					<option value="${buseoChange2.buseoNum }" selected="selected">${buseoChange2.buseoName }</option>
				</c:when>

				<c:otherwise>
					<option value="${buseoChange2.buseoNum }">${buseoChange2.buseoName }</option>
				</c:otherwise>
			</c:choose>

		</c:forEach>
		</select>
	</c:if>

	<c:if test="${buseoChange3!=null}">
		<select name="depth4" class="dap_text_box" onchange="change1();"  style="height: 35px; font-family: 고딕; width: 19%;float: left;">
		<c:forEach items="${buseoChange3}" var="buseoChange3">
			<c:choose>

				<c:when test="${buseoChange3.buseoNum==depth4 }">
					<option value="${buseoChange3.buseoNum }" selected="selected">${buseoChange3.buseoName }</option>
				</c:when>

				<c:otherwise>
					<option value="${buseoChange3.buseoNum }">${buseoChange3.buseoName }</option>
				</c:otherwise>
			</c:choose>

		</c:forEach>
		</select>
	</c:if>

	<c:if test="${buseoChange4!=null}">
		<select name="depth5" class="dap_text_box" onchange="change1();"  style="height: 35px; font-family: 고딕; width: 19%;float: left;">
		<c:forEach items="${buseoChange4}" var="buseoChange4">
			<c:choose>

				<c:when test="${buseoChange4.buseoNum==depth5 }">
					<option value="${buseoChange4.buseoNum }" selected="selected">${buseoChange4.buseoName }</option>
				</c:when>

				<c:otherwise>
					<option value="${buseoChange4.buseoNum }">${buseoChange4.buseoName }</option>
				</c:otherwise>
			</c:choose>

		</c:forEach>
		</select>
	</c:if>
		
</form>