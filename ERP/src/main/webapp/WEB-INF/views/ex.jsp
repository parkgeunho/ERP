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
<script type="text/javascript">

function test(){
	var num = document.getElementById("test1").value;
	alert(num);
}

</script>

<body>
<form action="">
<select id="test1" onchange="test()">
	<option value="a">선택</option>
	<option value="b">2</option>
</select>

<c:if test="<script>nym</script>==a">
되냐
</c:if>
<c:if test="<script>num</script>==b">
안되냐
</c:if>
</form>




</body>
</html>