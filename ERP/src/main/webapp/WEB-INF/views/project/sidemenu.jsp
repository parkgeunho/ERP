<%@ page contentType="text/html; charset=UTF-8"%>
<%        
	
	String cp = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/erp/resources/sidemenu.css">
</head>
<body>
<div>

	<div class="quick" >QUICK</div>


	<div class="Smenu"><img style="margin-top: 10px;" src="/erp/resources/image/mail.png"><br/>
	메일 쓰기
	</div>
	
	
	<a href="#" onClick="window.open('http://localhost:8080/erp/approvalPop','결재양식함','width=420, height=550, toolbar=no, menubar=no, scrollbars=yes, resizable=yes');return false;">
	<div class="Smenu" ><img style="margin-top: 10px;" src="/erp/resources/image/write.png"><br/>
	결재 작성
	</div>
	</a>
	
	
	<div class="Smenu"><img style="margin-top: 10px;" src="/erp/resources/image/search.png"><br/>
	직원 검색
	</div>
	

	<div class="Smenu"><img style="margin-top: 10px;" src="/erp/resources/image/help.png"><br/>
	도움말
	</div>

	<div class="Smenu"><img style="margin-top: 10px;" src="/erp/resources/image/option.png"><br/>
	환경설정
	</div>
</div>
</body>
</html>
