<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%		
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<script src="/erp/resources/script/ckeditor/ckeditor.js"></script>
<script src="/erp/resources/script/ckeditor/config.js"></script>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->

<link rel="stylesheet" href="<%=cp%>/resources/script/jquery-ui-1.11.4.custom/jquery-ui.css" type="text/css">
<script type="text/javascript" src="<%=cp%>/resources/schedule/jquery-2.2.0.js"></script>	<!-- jquery-2.2.0.min.js 이 오고난 후, -->
<script type="text/javascript" src="<%=cp%>/resources/script/jquery-ui-1.11.4.custom/jquery-ui.js"></script>





<title>Insert title here</title>

<link rel="stylesheet" href="/ERP/src/resources/css/style.css" type="text/css"/>
<link rel="stylesheet" href="/ERP/src/resources/css/created.css" type="text/css"/>



<script type="text/javascript" src="/ERP/src/resources/board/js/util.js"></script>

<script type="text/javascript">

function sendIt(){
	
	f = document.myForm;
	
	str = f.subject.value;
	str = str.trim();
	if(!str){
		alert("\n제목을 입력하세요.");
		f.subject.focus();
		return;
		
	}
	f.subject.value = str;
	
	f.action = "<%=cp%>/board/update_ok.action";
	f.submit();
	
	
 	str = CKEDITOR.instances.editor1.getData();
	
	str = str.trim();
	
	if(!str){
		alert("\n내용을 입력하세요." );
		f.content.focus();
		return;
	}			
	f.content.value = str;

	

}

</script>

</head>
<body style="font-style: 나눔고딕코딩;">


<form action="" name="myForm" method="post">
<table border="0" cellpadding="0" cellspacing="0" align="center" >
	<tr style="height: 40px; background: #D4D4D4">
		<td colspan="3" style="width: 1400px; letter-spacing: 5px; font-size: 20px; 
			right: 100px;" align="center">공지사항	
		</td>	
	</tr>
	
	<tr style="height: 2px;">
		<td colspan="3" style="width: 1400px;" align="right">
			
		</td>
	</tr>


	<tr style="height: 30px; background: #80F5FF" >
		<td style="width: 200px; height: 22px; font-style: " align="center">제&nbsp;&nbsp;목</td>
		<td style="width: 1200px;">
			<input type="text" name="subject" value="${dto.subject}" style="width:1000px; height: 22px;"/>	
		</td>	
	</tr>
	
	<tr style="">
		<td>
		
		
		</td>
	</tr>
	
	
	
	
	
	<tr style="height: 2x;">
	
	</tr>

</table>




<table border="0" align="center">
	<tr>
		<td style="width: 1400px;">
	
<textarea class="ckeditor" name="content" id="editor1" rows="10" cols="80" style="height: 800px;">${dto.content }</textarea>
	    
		</td>
	</tr>    
</table>





<table style="font-size: 15px;" border="0"  cellspacing="0" align="center">	
	<tr style="width: 10px;">
		<td></td>
	</tr>
	
	<tr style="height: 20px; ">
		<td style="width: 250px; background: #E7E7E7"  align="center" rowspan="4" >첨&nbsp;부&nbsp;파&nbsp;일</td>
		<td style="width: 100px;" align="left">&nbsp;&nbsp;&nbsp;
		<img alt="" src="/erp/resources/image/file001.png" style="width: 15px; height: 15px;" 
			onclick="">파일찾기	
		
		<img alt="" src="/erp/resources/image/delete001.png" style="width: 15px; height: 15px;" 
			onclick="">삭제
		</td>	
	</tr>
	


	<tr style="height: 20px;">					
		<td style="width: 400px;" align="left">&nbsp;&nbsp;&nbsp;&nbsp;파일명</td>		
		<td style="width: 200px;" align="right">크기</td>
		<td style="width: 200px;" align="center">첨부방식</td>		
		<td style="width: 200px;" align="center">유효기간</td>
		<td style="width: 122px;"></td>
	</tr>
	
	 <tr style="height: 15px; " >			
		<td style="width: 300px;" align="left"></td>
		
		<td style="width: 100px;" align="right"></td>
		<td style="width: 100px;" align="center"></td>		
		<td style="width: 150px;" align="center"></td>
	</tr>
	
	<tr style="height: 15px; ">	
		<td style="width: 300px;" align="left"></td>
		
		<td style="width: 100px;" align="right"></td>
		<td style="width: 100px;" align="center"></td>		
		<td style="width: 150px;" align="center"></td>
	</tr> 
</table>

<table border="0" align="center">

	<tr style="height: 1px; background: #E7E7E7">
		<td style="width: 1400px;"></td>
	</tr>
	
	<tr style="height: 33px;" align="right">
		<td style="width: 1400px;">
			
			<input type="hidden" name="boardNum" value="${dto.boardNum }"/>
			<input type="hidden" name="pageNum" value="${pageNum}"/>
			<input type="hidden" name="name" value="${dto.name }">
		
			<input type="button" value="수정하기" class="btn2" style="background: #FFFFFF"
				onclick="sendIt();"/>
			<input type="button" value="수정취소" class="btn2"  style="background: #FFFFFF"
				onclick="javasctipt:location.href='<%=cp%>/board/list.action';"/>
			
			
			
		</td>
		<td width="5"></td>	
	</tr>
	
	<tr style="height: 1px; background: #E7E7E7">
		<td style="width: 1400px;"></td>
	</tr>


</table>

</form>


</body>
</html>