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
<link rel="stylesheet" type="text/css" href="/erp/resources/ManagementView.css">


<script type="text/javascript">

	function deleted(){
		
		var url ="<%=cp%>/board/delete.action?boardNum=${dto.boardNum}&pageNum=${pageNum}&listNum=${listNum }";
		
		var del = confirm("정말 삭제 하시겠습니까?");
		
		if(del==true){
			location.href = url;
		}else{
			
			return;
		}
		
		
	}



</script>


</head>
<body>



<form action="" name="myForm">
		<div>
			<table border="0" cellpadding="0" cellspacing="1" align="center">
				<tr style="height: 80px; background: #EEEEEE">


					<td colspan="3"
						style="width: 1572px; font-size: 20px; border-color: #E0E0E0; border-width: 1px; border-style: solid; border-bottom-width: 0; font-style: 나눔고딕코딩; font-weight: bolder;"
						align="center">${listDTO.boardName }</td>
				</tr>
				<tr style="height: 40px;">
					<td style="width: 1572px;" align="right">
						<%-- <input type="button" value="리스트" class="btn2" style="background: #00D8FF; color: white;" 
				onclick="javasctipt:location.href='<%=cp%>/board/list.action';"> --%>

						<input type="button" value="수정" class="btn2"
						style="background: #E0E0E0"
						onclick="javascript:location.href='<%=cp%>/board/update.action?boardNum=${dto.boardNum}&pageNum=${pageNum}&listNum=${listNum }';">

						<input type="button" value="삭제" class="btn2"
						style="background: #E0E0E0" onclick="deleted();">

					</td>
				</tr>

			</table>


			<table border="0" cellpadding="0" cellspacing="0">
				<tr style="height: 30px; background: #E4F7BA">
					<td
						style="width: 200px; font-size: 15px; border-color: #E0E0E0; border-width: 1px; border-style: solid; border-bottom-width: 0; font-style: 나눔고딕코딩; font-weight: bolder;"
						align="center">제목</td>
					<td
						style="width: 1372px; font-size: 15px; border-color: #E0E0E0; border-width: 1px; border-style: solid; border-bottom-width: 0;">&nbsp;&nbsp;&nbsp;&nbsp;${dto.subject}</td>
				</tr>

				<tr style="height: 30px;">
					<td
						style="width: 200px; font-size: 15px; border-color: #E0E0E0; border-width: 1px; border-style: solid; border-bottom-width: 0; font-style: 나눔고딕코딩; font-weight: bolder; background: #EEEEEE"
						align="center">작성자</td>
					<td
						style="width: 1372px; font-size: 15px; border-color: #E0E0E0; border-width: 1px; border-style: solid; border-bottom-width: 0;">&nbsp;&nbsp;&nbsp;&nbsp;${dto.name}</td>
				</tr>

				<tr style="height: 30px">
					<td
						style="width: 200px; font-size: 15px; border-color: #E0E0E0; border-width: 1px; border-style: solid; border-bottom-width: 0; font-style: 나눔고딕코딩; font-weight: bolder; background: #EEEEEE"
						align="center">첨부파일</td>
					<td
						style="width: 1372px; font-size: 15px; border-color: #E0E0E0; border-width: 1px; border-style: solid; border-bottom-width: 0;">&nbsp;&nbsp;${fdto.originalFileName}

						<c:if test="${fdto.boardNum!=null}">
							<a
								href="javascript:location.href='<%=cp%>/download.action?boardNum=${dto.boardNum}&listNum=${listNum }';">
								<img style="width: 16px;" alt=""
								src="/erp/resources/boardimage/down003.png">
							</a>
						</c:if>
					</td>

				</tr>



				<tr style="height: 1px; background: #E7E7E7">
					<td style="width: 1572px;" colspan="3"></td>
				</tr>

			</table>

			<div style="overflow-y: scroll; height: 580px;">
				<table border="0" align="center">
					<tr style="height: 580px;">
						<td style="width: 1572px; height: 500px;"
							valign="top">&nbsp;&nbsp;&nbsp;&nbsp;${dto.content}</td>
					</tr>
				</table>
			</div>
		</div>

		<!-- 댓글 -->
<!-- <table border="0" align="center" cellpadding="0" cellspacing="0" >
	<tr style="height: 60px; background: #E1E1E1">
		<td style="width: 70px;" align="center">
			<img alt="" src="/erp/resources/image/image.jpg" style="width: 60px; height: 55px;">
		
		</td>			
		
		<td style="width: 1200px;">
			<textarea rows="" cols="" style="width: 1432px; height: 55px;"></textarea>
		</td>
		<td style="width: 60px;" align="center">
			<img alt="" src="/erp/resources/image/regist002.PNG" style="width: 55px; height: 50px;" onclick=""/>
		
			<input type="button" value="등록" class="btn2" onclick="">
		</td>
	</tr>
</table>

<table>
	<tr>
		<td>
	
	</tr>



</table>
 -->
 

<!-- 댓글보기 -->
<!-- <table border="0" align="center" cellpadding="0" cellspacing="0"  >
	<tr style="height: 15px; background: ">
		<td style="width: 70px;" align="center" rowspan="2">
			<img alt="" src="/erp/resources/image/image.jpg" style="width: 60px; height: 45px;">
		
		</td>
			
		
		
		<td style="width: 1502px; font-size: 13px;">작성자/시간</td>
				
	</tr>
	
	<tr style="height: 30px; background: ">
		
		<td style="width: 1502px; height: 40px;">내용</td>
	</tr>
	
	
</table>

 -->



<!-- <table border="0" align="center">
	
	<tr style="height: 3px;">
		<td></td>
	</tr>
	
	
	<tr style="height: 1px;">
		<td style="width: 1572px; background: #E7E7E7" colspan="2">
		</td>
	</tr>
</table> -->





</form>

</body>
</html>