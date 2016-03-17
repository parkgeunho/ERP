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

<script type="text/javascript">

	function sendIt(){
		
		var f = document.searchForm;
		
		f.action = "<%=cp%>/board/list.action";
		f.submit();
		
	}


</script>

</head>
<body style="font-size: ; font-style: 나눔고딕코딩;">

<table border="0" align="center" cellpadding="0" cellspacing="0" style="width: 1572px;">
	<tr style="height: 80px; background-color: #D5D5D5">
		<td  align="center" class="">공&nbsp;지&nbsp;사&nbsp;항</td>
		
	</tr>
</table>		
		
<table border="0" align="center" cellpadding="0" cellspacing="0">		
	
	<tr style="height: 30px">
	
			
			
		<td style="width: 1500px" align="left" colspan="6">
		<form action="" name="searchForm" method="post">
				<select name="searchKey" class="selectFiled" style="width: 80px; height: 26px;">
					<option value="subject">제목</option>
					<option value="name">작성자</option>
					<option value="content">내용</option>
				</select>	
						<input type="text" name="searchValue" class="textField" style="width: 150px; height: 20px;">
						<img alt="" src="/erp/resources/image/find.png" style="width: 20px; height: " onclick="sendIt();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<!-- <input type="button" value="상세"  onclick="" >	 -->
			</form>	
			
		</td>
		<td style="width: 72px;" align="center">
		<img alt="" src="/erp/resources/boardimage/pencils002.png" style="width: 20px; height: " onclick="javasctipt:location.href='<%=cp%>/board/created.action';">
			<a href=""></a>
		</td>	
		
	</tr>
	
	<tr style="height: 30px; background-color: #E7E7E7">
		<td style="width: 100px" align="center" class="boardNum">No</td>
		<td style="width: 922px;" align="center" class="subject">제목
		</td>
		
		<td style="width: 150px;" align="center" class="name">작성자
		</td>
		
		<td style="width: 150px;" align="center" class="created">작성일
		</td>
		
		<td style="width: 150px;" align="center" class="file">파일		
		</td>
		
		<td style="width: 100px;" align="center" class="hitCount" colspan="2">조회수
		</td>		
	</tr>	
	<tr style="height: 1px; background: #B2EBF4">
		<td style="width: 1572px;" colspan="7"></td>
	</tr>
</table>


<table border="0" cellpadding="0" cellspacing="0" align="center">
	<c:forEach var="dto" items="${lists }">
	<tr style="height: 1px; background: #B2EBF4">		
	</tr>
	<tr style="height: 25px;">
		<td style="width: 100px;" class="boardNum" align="center">${dto.boardNum}</td>
		<td style="width: 922px;" class="subject">
			<a href="${articleUrl}&boardNum=${dto.boardNum}">
				${dto.subject }</a></td>
		<td style="width: 150px;" class="name" align="center">${dto.name}</td>
		<td style="width: 150px;" class="created" align="center">${dto.created}</td>
		<td style="width: 150px;" align="center"></td>
		<td style="width: 100px;" class="hitCount" align="center">${dto.hitCount }</td>		
	</tr>	
	<tr style="height: 1px; background: #B2EBF4">
		<td style="width: 1572px;" colspan="7"></td>
	</tr> 
	</c:forEach>				
</table>

<table border="0" cellpadding="0" cellspacing="0" align="center">
	<tr style="height: 1px; ">
		<td style="width: 1572px; background: #B2EBF4"></td>
	</tr>
	
	<tr style="height: 10px;">
		<td></td>
	</tr>
	
	<tr style="height: 55px;">
		<td style="width: 1572px;" align="center">
	<p>
		<c:if test="${dataCount!=0 }">
			${pageIndexList }
		</c:if>
		
		<c:if test="${dataCount==0 }">
					등록된게시물이 없습니다.
		</c:if>	
	</p>
	
		</td>
	</tr>

</table>







</body>
</html>