<%@ page contentType="text/html; charset=UTF-8"%>
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

function deleted(){

	var f = document.noteForm;
	
	var del;
	
	del=confirm("정말 삭제하시겠습니까?");
	
	if(del==true){
		f.action = "<%=cp%>/note/delete";
		f.submit();
		window.opener.location.reload();
		window.close();
	}else{
		return;
	}
	
	
	
	
}
function sendIt(){
	var f= document.noteForm
	f.action = "<%=cp%>/NoteWrite";
	f.submit();
	
}
function closed(){
	
	window.opener.location.reload();
	window.close();
	
}

</script>

<link rel="stylesheet" type="text/css" href="/erp/resources/note.css">
<body>
<Form name="noteForm">
<div style="padding-left: 10px; width: 500px; height: 430px;">
<div style="height: 80px; width: 490px;">
	<div style="height: 40px; line-height: 40px; width: 490px;">
	<div style="float: left;height: 40px;line-height: 40px;width: 100px;">보낸사람</div>
	<div style="float: left;height: 40px;line-height: 40px;width: 390px;">${NoteDTO.writer }</div>
</div>
	<div style="border-bottom: 1px solid;border-top: 1px solid; height: 40px; line-height: 40px; width: 490px;">
		<div style="float: left; width: 100px;">받은시간</div>
		<div style="float: left; width: 390px;">${NoteDTO.writeTime }</div>
	</div>
</div>
	<div style="height: 300px;  padding-top: 20px;" >
	<div><textarea name="content" rows="13" cols="58" style="overflow-y:auto;" onFocus="this.blur()" >${NoteDTO.content }</textarea></div>
	<div style="margin-top: 40px;" >
	<div class="chk" align="center" style="float: left; margin-left: 125px;" onclick="sendIt()">답장</div>
	<div class="chk" align="center" style="float: left; margin-left: 10px; " onclick="deleted()">삭제</div>
	<div class="chk" align="center" style="float: left; margin-left: 10px; " onclick="closed()">학인</div>
	<input type="hidden" name="noteNum" value="${NoteDTO.noteNum }">
	</div>
	
	</div>
	
	
	</div>
	
	<div>

</div>

</Form>




</body>
</html>