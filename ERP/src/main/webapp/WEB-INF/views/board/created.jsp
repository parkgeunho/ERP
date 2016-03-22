<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%-- <%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %> --%>
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
<link rel="stylesheet" type="text/css" href="/erp/resources/ManagementView.css">

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
	
	/* str= f.name.value;
	str = str.trim();
	if(!str){
		alert("\n이름을 입력하세요.");
		f.name.focus();
		return;
			
	}
	f.name.value = str; */
		
 	str = CKEDITOR.instances.editor1.getData();
	
	str = str.trim();
	
	if(!str){
		alert("\n내용을 입력하세요." );
		CKEDITOR.instances.editor1.focus();
		return;
	}			
	f.content.value = str;
	f.action = "<%=cp%>/board/created_ok.action";
	f.submit();
	window.opener.location.reload();
	window.close();
	 

}

function redirect(){
	
	window.opener.location.reload();
	window.close();
	
	
}


</script>

</head>
<body style="font-style: 나눔고딕코딩;">


<form action="" name="myForm" method="post" enctype="multipart/form-data">
<table border="0" cellpadding="0" cellspacing="0" align="center" >
	<tr style="height: 80px;" bgcolor=#EEEEEE>
		<td colspan="3" style="width: 1572px; font-style: 나눔고딕코딩;font-weight: bolder; letter-spacing: 5px; font-size: 20px; 
			right: 100px; border-width: 1px; border-style: solid; border-bottom-width: 1; border-color:#E0E0E0;" align="center">
				${listDTO.boardName }
		</td>	
	</tr>
	
	<tr style="height: 1px;">
		<td colspan="3" style="width: 1400px;" align="right">
			
		</td>
	</tr>
	<tr style="height: 40px;" align="right">
		<td style="width: 1572px;">
			<input type="button" value="올리기" class="btn2" style="background: #E0E0E0"
				onclick="sendIt();"/>
			<input type="button" value="취소" class="btn2"  style="background: #E0E0E0"
				onclick="redirect();"/>       <!-- style="background: #00D8FF; color: #FFFFFF;" -->
		</td>
		<td width="5"></td>	
	</tr>
</table>	
<table border="0" cellpadding="0" cellspacing="0">
	<tr style="height: 30px; background: #E4F7BA" >
		<td style="width: 200px; height: 20px; font-size: 15px; font-style: 나눔고딕코딩;font-weight: bolder;
			border-width: 1px; border-style: solid; border-bottom-width: 1; border-color:#E0E0E0;" align="center" >제목</td>
		<td style="width: 1372px; border-width: 1px; border-style: solid; border-bottom-width: 1; font-style: 나눔고딕코딩; border-color:#E0E0E0;">&nbsp;&nbsp;
			<input type="text" name="subject" style="width:1000px; height: 17px;"/>	
		</td>	
	</tr>
	<tr style="height: 1px;">
		<td colspan="2"></td>
	</tr>

	<!-- <tr style="height: 30px; background: #00D8FF">
		<td style="width: 200px; height: 20px; color: white; font-size: 20px;" align="center">작&nbsp;성&nbsp;자</td>
		<td style="width: 1372px;">
			<input type="text" name="name" style="width:1000px; height: 20px;"/>	
		</td>	
	</tr> -->
	
	<tr style="">
		<td>
		
		
		</td>
	</tr>
	
	
	
	
	
	<tr style="height: 2x;">
	
	</tr>

</table>




<table border="0" align="center">
	<tr>
		<td style="width: 1572px;">
		
	
<textarea class="ckeditor" name="content" id="editor1" rows="10" cols="80" >



</textarea>
	    <script type="text/javascript">
  CKEDITOR.replace('editor1',
    {
      //width : '620px',  // 입력창의 넓이, 넓이는 config.js 에서 % 로 제어
      height : '400px',  // 입력창의 높이
      startupFocus : false/* ,
      uiColor : '#00D8FF'  */
     
    }
  );
</script>




		</td>
	</tr>    
</table>





<table style="font-size: 15px; width: " border="0"  cellspacing="0" align="left">	
	
	
	
	
	
	
	<tr style="height: 20px; ">
		<td style="width: 150px; background: #E7E7E7; font-size: 15px; font-style: 나눔고딕코딩;font-weight: bolder;"  align="center" >첨&nbsp;부&nbsp;파&nbsp;일</td>
		<td style="width: 100px;" align="left">&nbsp;&nbsp;&nbsp;
			<input type="file" name="file" id="file">
		<!-- <img alt="" src="/erp/resources/image/file001.png" style="width: 15px; height: 15px;" 
			onclick="">파일찾기	
		
		<img alt="" src="/erp/resources/image/delete001.png" style="width: 15px; height: 15px;" 
			onclick="">삭제  -->
		</td>	
		<td style="width: 1000px;"></td>
	</tr>
	
	 <tr style="height: 3px;" >
		<td colspan="3"></td>
	</tr> 
	
	<tr style="height: 1px; background: #E7E7E7;" >
		<td colspan="3"></td>
	</tr>


	<!-- <tr style="height: 20px;">					
		<td style="width: 250px;" align="left">&nbsp;&nbsp;&nbsp;&nbsp;파일명</td>		
		<td style="width: 100px;" align="right">크기</td>
		<td style="width: 100px;" align="center">첨부방식</td>		
		<td style="width: 100px;" align="center">유효기간</td>
		<td style="width: 80px;" align="center"></td>
	</tr>
	
	 <tr style="height: 15px; " >			
		<td style="width: 250px;" align="left"></td> 		
		<td style="width: 100px;" align="right"></td>
		<td style="width: 100px;" align="center"></td>		
		<td style="width: 100px;" align="center"></td>
		<td style="width: 80px;" align="center">
			<img alt="" src="/erp/resources/image/delete001.png" style="width: 15px; height: 15px;"> 
				</td>
	</tr>

	 -->
	
</table>

<!-- <table border="0" align="center">

	<tr style="height: 1px; background: #E7E7E7">
		<td style="width: 1300px;"></td>
	</tr>
	
		
</table>  -->
	<input type="hidden" name="listNum" value="${listNum }">
	<input type="hidden" name="name" value="${dto.name }">
</form>


</body>
</html>