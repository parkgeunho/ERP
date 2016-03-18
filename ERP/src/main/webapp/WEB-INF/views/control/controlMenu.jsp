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
<link rel="stylesheet" type="text/css" href="/erp/resources/ManagementView.css">
<script type="text/javascript">
	function te() {
		alert("뜸?");
	}

</script>


</head>
<body>

<div style="width: 270px;">
	<div class="buseo" >
	관리항목
	</div>
	<div>
	<label onclick="javascript:location.href='<%=cp%>/insa'">부서관리</label>
	</div>
	<div>
	<label onClick="window.open('http://localhost:8080/erp/approvalFormCreated','결재 양식 생성','width=900, height=1200, toolbar=no, menubar=no, scrollbars=yes, resizable=yes');return false;">양식추가</label>
	</div>
	<div>
	<label onclick="javascript:location.href='<%=cp%>/con'">게시판관리</label>
	</div>
	<div>
	
	</div>

</div>

</body>
</html>