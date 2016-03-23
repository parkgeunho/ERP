<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%		
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>


<link rel="stylesheet" href="/ERP/src/resources/css/style.css" type="text/css"/>
<link rel="stylesheet" href="/ERP/src/resources/css/created.css" type="text/css"/>


<script type="text/javascript">


function openNewWindow(listNum) { 
	open ("board/created.action?listNum="+listNum,"Mail","toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, width=1200, height=800"); 

	}
function article(listNum,boardNum) { 
	
	
	open ("board/article.action?listNum="+listNum+"&boardNum="+boardNum,"Mail","toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, width=1200, height=800"); 
	}


<%-- 	function sendIt(){
		
		var f = document.searchForm;
		
		f.action = "<%=cp%>/board/list.action";
		f.submit();
		
		
	} --%>


</script>


<DIV class="buseo">
${LDTO.boardName}
</DIV>		



<table border="0" align="center" cellpadding="0" cellspacing="15" >		
	
	<tr style="height: 30px">			
		<td style="width: 1400px" align="left" colspan="6">
		<form action="" name="searchForm" method="post">
				<select id="searchKey"  name="searchKey" class="selectFiled" style="width: 80px; height: 26px;">
					<option value="subject">제목</option>
					<option value="name">작성자</option>
					<option value="content">내용</option>
				</select>	
						<input type="text" name="searchValue" id="searchValue" class="textField" style="width: 150px; height: 20px;">
						<img  title="검색" alt="" src="/erp/resources/boardimage/search006.png" style="width: 20px; height: " onclick="sendIt();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<!-- <input type="button" value="상세"  onclick="" >	 -->
			</form>	
			
		</td>
		<td style="width: 72px;" align="center">
		<a target="_blank" title="글쓰기">
		  <img alt="" src="/erp/resources/boardimage/pencils001.png" onclick="javascript:openNewWindow(${listNum});" style="width: 20px;"></a>
		<!-- onclick="javascript:location.href='<%=cp%>/board/created.action?listNum=${listNum}';" -->
		</td>
		
	</tr>
</table>


<table border="0" align="center" cellpadding="0" cellspacing="0">	
	
	<tr style="height: 30px; background-color: #EEEEEE">
		<td style="width: 90px; border-right: 1px solid; border-color:#CACACA;" align="center" class="boardNum">No</td>
		
		<td style="width: 922px; border-right: 1px solid; border-color:#CACACA;" align="center" class="subject">제목</td>
	
		
		<td style="width: 140px; border-right: 1px solid; border-color:#CACACA;" align="center" class="name">작성자</td>
		
		
		<td style="width: 140px; border-right: 1px solid; border-color:#CACACA;" align="center" class="created">작성일</td>
		
		
		<td style="width: 140px; border-right: 1px solid; border-color:#CACACA;" align="center" class="file">파일</td>
		
		<td style="width: 90px;" align="center" class="hitCount" colspan="2">조회수</td>		
		
	</tr>	
	
	<tr style="height: 1px; background: #B2EBF4">
		<td colspan="11"></td>
	</tr>
</table>



<table border="0" cellpadding="0" cellspacing="0" align="center" >
	<c:forEach var="dto" items="${lists }">
	<tr style="height: 1px; background: #B2EBF4">		
	</tr>
	<tr style="height: 25px;">
		<td style="width: 90px;" class="boardNum" align="center">${dto.boardNum}</td>
		<td style="width: 922px;" class="subject">&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" onclick="article(${listNum},${dto.boardNum })">
				${dto.subject }</a></td>
		<td style="width: 140px;" class="name" align="center">${dto.name}</td>
		<td style="width: 140px;" class="created" align="center">${dto.created}</td>
		<td style="width: 140px;" align="center"></td>
		<td style="width: 90px;" class="hitCount" align="center">${dto.hitCount }</td>		
	</tr>	
	<tr style="height: 1px; background: #B2EBF4">
		<td colspan="7"></td>
	</tr> 
	</c:forEach>				
</table>

<table border="0" cellpadding="0" cellspacing="0" align="center">
	<tr style="height: 1px; ">
		<td  background: #B2EBF4" colspan="7"></td>
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
