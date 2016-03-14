<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String cp = request.getContextPath(); %>

<form>

	<select name="depth1" class="dap_text_box" onchange="change1();"  style="height: 35px; font-family: 고딕; width: 20%;float: left; margin-left: 4px;" >
    		
    		<c:forEach items="${lists}" var="dto" >
    		<option value="${dto.buseoNum }"  selected="selected">${dto.buseoName }</option>
    		</c:forEach>
	</select>

	<c:if test="${buseoChange1!=null}">
		<select name="depth2" class="dap_text_box" onchange="change1();"  style="height: 35px; font-family: 고딕; width: 20%;float: left;">
		<c:forEach items="${buseoChange1}" var="buseoChange1">
    		<option value="${buseoChange1.buseoNum }" selected="selected">${buseoChange1.buseoName }</option>
    	</c:forEach>
		</select>
	</c:if>
	
	<c:if test="${buseoChange2!=null}">
		<select name="depth3" class="dap_text_box" onchange="change1();"  style="height: 35px; font-family: 고딕; width: 20%;float: left;">
		<c:forEach items="${buseoChange2}" var="buseoChange2">
    		<option value="${buseoChange2.buseoNum }"  selected="selected">${buseoChange2.buseoName }</option>
    	</c:forEach>
		</select>
	</c:if>

		<%-- <select name="depth4" class="dap_text_box" onchange="change3();"  style="height: 35px; font-family: 고딕; width: 19%;float: left;">
			<c:forEach items="${buseoChange2}" var="buseoChange3">
    		<option value="${buseoChange3.buseoNum }"  selected="selected">${buseoChange3.buseoName }</option>
    		</c:forEach>
		</select> --%>

		<%-- <select name="depth5" class="dap_text_box" onchange="change();"  style="height: 35px; font-family: 고딕; width: 19%;float: left;">
    		<option value="${depth5.buseoNum }" selected="selected">${depth5.buseoName }</option>

		</select> --%>
		
</form>