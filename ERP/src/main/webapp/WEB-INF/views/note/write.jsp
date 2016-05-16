<%@ page contentType="text/html; charset=UTF-8"%>
<%        
	
	String cp = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/erp/resources/note.css">
</head>
<script type="text/javascript">
var winObject = null;
function sendIt(){
	
	
	var f = document.myForm;
	
	if(!f.reader.value){
		alert("받는사람을 선택하세요.");
		f.reader.focus();
		return;
	}
	

	if(!f.content.value){
		alert("내용을 적어주세요.");
		f.content.focus();
		return;
	}
	
	f.action = "<%=cp%>/note/Write_ok";
	f.submit();
	
	
	
	
	/* closed(); */
	
}

function searchPop(){
	
	
	winObject = window.open("note/find","","width=400px,height=580px");
	
	
	
}

function closed(){
	window.opener.location.reload();
	window.close(); 
	
}


function setChildValue(name,num){
	
	document.getElementById("dummy").value = name;
	document.getElementById("reader").value = num;
	
}

</script>
<body>
<form name="myForm">
<div style="padding-left: 10px; width: 500px; height: 430px;">
	<div style="height: 40px; line-height: 40px; width: 490px;">쪽지 쓰기</div>
	<div style="border-bottom: 1px solid;border-top: 1px solid; height: 40px; line-height: 40px; width: 490px;">
		<div style="float: left;">받는사람</div>

		<div style="float: left;margin-top: 9px; margin-left: 15px; "><input type="text" size="49" name="dummy" id="dummy" value="${dummy }"></div>
		<div class="chk" align="center" style="float: left; margin-left: 10px;margin-top: 9px; " onclick="searchPop()">주소록</div>
	</div>
	<div style="height: 300px;  padding-top: 20px;" >
	<div><textarea name="content" rows="13" cols="58" style="overflow-y:auto; "></textarea></div>
	<div style="margin-top: 40px;" >
	<div class="chk" align="center" style="float: left; margin-left: 175px;" onclick="sendIt()">보내기</div>
	<div class="chk" align="center" style="float: left; margin-left: 10px;">취소</div>
	</div>
	
	</div>

	<input type="hidden" name="writer" value="${LoginDTO.num }">
	<input type="hidden" name="reader" id="reader" value="${reader }">

	</div>
	
	<div>

</div>
</form>
	

</body>
</html>