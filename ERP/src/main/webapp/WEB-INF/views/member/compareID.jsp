<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String cp = request.getContextPath(); %>

<c:if test="${result=='ok'}">
<span id="check" style="font-size: 15pt; font-style: 고딕; font-weight: bold; color: green;">사용가능 아이디</span>
</c:if>
<c:if test="${result=='no'}">
<span id="check" style="font-size: 15pt; font-style: 고딕; font-weight: bold; color: red;">사용불가 아이디</span>
</c:if>

