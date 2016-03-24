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
<title>Insert title here</title>
<link rel="stylesheet" href="/ERP/src/resources/css/style.css" type="text/css"/>
<link rel="stylesheet" href="/ERP/src/resources/css/created.css" type="text/css"/>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<script type="text/javascript">

function openArticle(noteNum){
	
	window.open("article?noteNum="+noteNum,"","width=520px,height=450px;")
	
}
function closeList(){
	
	window.opener.location.reload();
	window.close();
	
}

</script>






</head>
<body>
<Div style="width: 600px; height: 600px; border: 0px solid;">
	<div style="width:560px; height: 40px; margin-left:20px; line-height: 40px; border-bottom: 1px solid; border-bottom-color: #C3C3C3">받은 쪽지함</Div>
	<div>
	<table height="500px; " width="560px;" border="0" style="margin-left: 20px; margin-top: 10px; 
		border-bottom: 0px solid; border-color:#E0E0E0; border-width: 1px; border-style: solid; border-bottom-width: 1; font-style: 나눔고딕코딩;" 
		cellpadding="0" cellspacing="0" >
		<tr height="25px;" style="background: #EAEAEA; font-weight: bold; border-bottom: 1px solid #E0E0E0;">
			<td width="100px;" align="center">보낸사람</td> <td width="330px;" align="center">내용</td> <td width="130px;" align="center">보낸 날짜</td>
		</tr>
	
		<c:forEach var="Notedto" items="${lists }">
		<tr height="25px;">
			<td align="center"style="border-bottom: 1px solid #E0E0E0;">${Notedto.writer }</td>
			<td align="left" style="border-bottom: 1px solid #E0E0E0; padding-left: 10px">
			
			<c:if test="${Notedto.readTime=='no'}">
			<a href="javascript:openArticle(${Notedto.noteNum })">${Notedto.content}
			</a>
			</c:if>
			<c:if test="${Notedto.readTime!='no' }">
			<label onclick="openArticle(${Notedto.noteNum })">${Notedto.content}</label>
			
			
			</c:if>
			</td>
			<td align="center" style="border-bottom: 1px solid #E0E0E0;">${Notedto.writeTime }</td>
		</tr>
		</c:forEach>
		<c:forEach begin="1" end="${max-listSize }" step="1">
		<tr height="25px;"><td></td>
		</tr>
		</c:forEach>
		
		<tr height="25px;" >
			
			<td colspan="3" align="center">
		<p>	
			<c:if test="${dataCount!=0 }">
				${pageIndexList}			
			</c:if>
			
			<c:if test="${dataCount==0 }">
						쪽지가 없습니다.
			</c:if>
		</p>	
			</td>
		</tr>
		
		
		
		<tr style="height: 30px;">
			<td style="width: 560px;" align="right" colspan="3">
				<input type="button" value="닫기" class="btn2" style="background: #EAEAEA"
					onclick="closeList()">
			</td>
		</tr>
	</table>
	</Div>

</Div>
</body>
</html>