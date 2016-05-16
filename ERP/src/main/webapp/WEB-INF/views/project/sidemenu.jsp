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

<script type="text/javascript">

	function logout(){
		
		var url = '<%=cp%>/logout.action';
		
		var del = confirm("로그아웃 하시겠습니까?")
		
		if(del==true){
			location.href = url;
		}else{
			
			return;
		}
		
		
		
	}
	function openNote(){
		
		window.open("NoteWrite","","width=520px,height=450px;")
		
	}
	
	function searchPop(){
		
		window.open("searchPop.action","","width=400px,height=580px");
		
		
		
	}
	
	function smallUpdated(){
		
		window.open("smallUpdated.action","","width=400px,height=580px");
		
	}
	function openapproval(){
		
		window.open('http://localhost:8080/erp/approvalPop','결재양식함','width=420, height=550, toolbar=no, menubar=no, scrollbars=yes, resizable=yes');
		
	}
	
	


</script>


</head>
<body>
<div>

	<div class="quick" >QUICK</div>


	<div class="Smenu" onclick="openNote()"><img style="margin-top: 10px;" src="/erp/resources/image/mail.png"><br/>
	쪽지 쓰기
	</div>
	

	<div class="Smenu" onClick="window.open('http://192.168.1.146:8080/erp/approvalPop','결재양식함','width=420, height=550, toolbar=no, menubar=no, scrollbars=yes, resizable=yes');return false;" >

	
	<img style="margin-top: 10px;" src="/erp/resources/image/write.png"><br/>
	결재 작성
	</div>
	
	

	<div class="Smenu" onclick="javascript:searchPop();"><img style="margin-top: 10px;" src="/erp/resources/image/search.png"><br/>
	직원 검색
	</div>
	
	                                                                                           

	<div class="Smenu"><img style="margin-top: 10px;" src="/erp/resources/image/help.png"><br/>
	도움말
	</div>

	<div class="Smenu" onclick="javascript:smallUpdated();"><img style="margin-top: 10px;" src="/erp/resources/image/option.png"><br/>
	정보수정
	</div>
	
	
	<div class="Smenu" onclick="javascript:logout();"><img style="margin-top: 10px; width: 32px; height: 32px;" src="/erp/resources/image/out.png"><br/>
	로그아웃
	</div>
	
	
</div>
</body>
</html>
