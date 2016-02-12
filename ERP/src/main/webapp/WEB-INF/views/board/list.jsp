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
</head>
/
<script type="text/javascript">

	function sendIt(){
		
		var f = document.searchForm;
		
		f.action = "<%=cp%>/list.action";
		f.submit();
		
	}


</script>


<body style="font-size: 13px; font-style: 나눔고딕체;">

<table border="0" align="center" cellpadding="0" cellspacing="0">
	<tr style="height: 40px; background-color: #D5D5D5">
		<td style="width: 1400px;" align="right" colspan="6">
			<form action="" name="searchForm" method="post">
				<select name="searchKey" class="selectFiled" style="width: 80px; height: 26px;">
					<option value="subject">제목</option>
					<option value="name">작성자</option>
					<option value="content">내용</option>
				</select>&nbsp;&nbsp;				
						<input type="text" name="searchValue" class="textField" style="width: 150px; height: 20px;">&nbsp;
						<img alt="" src="/erp/resources/image/search001.png" style="width: 20px; height: " onclick="sendIt();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<!-- <input type="button" value="상세"  onclick="" >	 -->
			</form>	
		</td>	
	</tr>
		
	<tr style="height: 30px">
		<td style="width: 1400px" align="right" colspan="6">
			<img alt="" src="/erp/resources/image/book002.png" onclick="javasctipt:location.href='<%=cp%>/created.action';">
			<!-- <input type="button" value="작성" class="btn2" onclick=""> -->
		</td>
	</tr>
	
	<tr style="height: 30px; background-color: #E7E7E7">
		<td style="width: 100px" align="center" class="boardnum">No</td>
		<td style="width: 700px;" align="center" class="subject">제목
		</td>
		
		<td style="width: 150px;" align="center" class="name">작성자
		</td>
		
		<td style="width: 150px;" align="center" class="created">작성일
		</td>
		
		<td style="width: 150px;" align="center" class="file">첨부		
		</td>
		
		<td style="width: 150px;" align="center" class="hitCount">조회수
		</td>
	
	</tr>	
	
</table>

<table id="lists">
	<c:forEach var="dto" items="${lists }">
		<tr>
			<td class="boardum">${dto.boardNum}</td>
			<td class="subject">
			<a href="${articleUrl}&num=${dto.boardnum}">
				${dto.subject }</a></td>
			<td class="name">
			</td>
			<td class="created">${dto.created}</td>
			<td class="file">${dto.file }</td>
			<td class="hitCount">${dto.hitCount }</td>		
		</tr>	
	</c:forEach>
</table>

<table id="pooter">
	<p>
		<c:if test="${dataCount!=0 }">
			${pageIndexList }
		</c:if>
		
		<c:if test="${dataCount==0 }">
					등록된게시물이 없습니다.
		</c:if>	
	</p>


</table>







</body>
</html>