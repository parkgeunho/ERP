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

<script type="text/javascript">

	function sendIt(){
		
		var f = document.searchForm;
		
		f.action = "<%=cp%>/list.action";
		f.submit();
		
	}


</script>


<body style="font-size: 13px; font-style: 나눔고딕체;">

<table border="1" align="center" cellpadding="0" cellspacing="0">
	<tr style="height: 40px; background-color: #D5D5D5">
		<td style="width: 1400px;" align="right" colspan="5">
			<form action="" name="searchForm" method="post">
				<select name="searchKey" class="selectFiled" style="width: 80px; height: 26px;">
					<option value="subject">제목</option>
					<option value="name">작성자</option>
					<option value="content">내용</option>
				</select>&nbsp;&nbsp;				
						<input type="text" name="searchValue" class="textField" style="width: 150px; height: 20px;">&nbsp;&nbsp;
						<img alt="" src="/erp/resources/image/search001.png" style="width: 20px; height: " onclick="sendIt();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<!-- <input type="button" value="상세"  onclick="" >	 -->
			</form>	
		</td>	
	</tr>
		
	<tr style="height: 30px">
		<td style="width: 1400px" align="right" colspan="5">
			<img alt="" src="/erp/resources/image/book002.png" onclick="javasctipt:location.href='<%=cp%>/created.action';">
			<!-- <input type="button" value="작성" class="btn2" onclick=""> -->
		</td>
	</tr>
	
	<tr style="height: 30px; background-color: #E7E7E7">
		<td style="width: 800px;" align="center">제목
		</td>
		
		<td style="width: 150px;" align="center">작성자
		</td>
		
		<td style="width: 150px;" align="center">작성일
		</td>
		
		<td style="width: 150px;" align="center">첨부		
		</td>
		
		<td style="width: 150px;" align="center">조회수
		</td>
	
	</tr>
	
	<tr style="height: 10px;">
		<td style="width: 100px;"></td>
		<td style="width: 100px;"></td>
		<td style="width: 100px;"></td>
	</tr>
</table>

<table>
	<tr>
		<td class="subject">제목</td>
		<td class="name">작성자</td>
		<td class="created">작성일</td>
		<td class="">첨부</td>
		<td class="hitCount">조회수</td>
		
	
	</tr>




</table>








</body>
</html>