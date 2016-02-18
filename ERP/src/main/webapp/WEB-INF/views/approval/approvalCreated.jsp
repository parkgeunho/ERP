<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
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


<script type="text/javascript">

	$(function(){
	
		$("#LineModal").click(function(){
			
			$("<body>").dialog({
				
				modal:true,
				open:function(){
					$(this).load("approvalLine.action");
				},
				height:500,
				width:870,
				title:"결재선 지정"
			});
		});
	
	});

</script>


<title>결재 상신</title>
</head>
<body>

<table width="100%" cellspacing="0" cellpadding="0">
<tr style="height:1px;" bgcolor="#8C8C8C"><td colspan="3"></td></tr> <!-- 라인 -->
<tr height="45"><td bgcolor="#8C8C8C" width="1"></td><td bgcolor="#EAEAEA"><font style="font-size: 16pt">결재 - dto.type</font></td><td bgcolor="#8C8C8C" width="1"></td></tr>
<tr style="height:1px;" bgcolor="#8C8C8C"><td colspan="3"></td></tr> <!-- 라인 -->
<tr height="40"><td align="right" colspan="3" >
<input type="button" value="결재선 지정" id="LineModal" />
<input type="button" name="approvalSave" value="저장" />
<input type="button" name="approvalClose" value="닫기" />
</td></tr>
<tr style="height:1px;" bgcolor="#8C8C8C"><td colspan="3"></td></tr> <!-- 라인 -->
<tr height="70"><td colspan="3" align="center"><font style="font-size: 15pt; font-weight: bolder;">dto.type</font></td></tr> 
</table>


<c:set var="result" value="3"/>


<table border="1" cellspacing="0" align="right"> 

<c:forEach var="i" begin="1" end="4">
	<tr>
		<c:choose>
		
			<c:when test="${i==1}">			
				<c:forEach var="j" begin="1" end="${result}">
					
					<c:if test="${j==1}">
					<tr>
					<td>결</td>
					<td>기안자</td>
					</c:if>
					
					<c:if test="${j!=1}">
					<td>결재자</td>
					</c:if>
					
				</c:forEach>						
			</c:when>
				
			<c:when test="${i==2}">			
				<c:forEach var="j" begin="1" end="${result}">
					<c:if test="${j==1}">
					<tr>
					<td>재</td>
					<td>기안자이름</td>
					</c:if>
					
					<c:if test="${j!=1}">
					<td>결재자</td>
					</c:if>
				</c:forEach>						
			</c:when>	
				
			<c:when test="${i==3}">			
				<c:forEach var="j" begin="1" end="${result}">
					<c:if test="${j==1}">
					<tr>
					<td>라</td>
					<td>기안자서명</td>
					</c:if>
					
					<c:if test="${j!=1}">
					<td>결재자서명</td>
					</c:if>
				</c:forEach>						
			</c:when>	
						
			<c:when test="${i==4}">
				<c:forEach var="j" begin="1" end="${result}">
					<c:if test="${j==1}">
					<tr>
					<td>인</td>
					<td>기안일</td>
					</c:if>
					
					<c:if test="${j!=1}">
					<td>결재일</td>
					</c:if>
				</c:forEach>						
			</c:when>	
						
		</c:choose>
	</tr>
</c:forEach>

</table>

<table align="center" width="100%" cellpadding="0" cellspacing="0">

<tr height="20"><td colspan="3"></td></tr> <!-- 공백라인 -->

<tr style="height:1px;" bgcolor="#8C8C8C"><td colspan="3"></td></tr> <!-- 라인 -->

<tr>
<td width="150" height="30" bgcolor="#E4F7BA" align="center"> <font style="font-size: 11pt; font-style: 나눔고딕코딩;font-weight: bolder;">제목</font></td>
<td width="1" bgcolor="#8C8C8C"></td>
<td height="30" bgcolor="#E4F7BA" align="center"><input type="text" style="width: 90%; height: 40"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>

</tr> 

<tr style="height:1px;" bgcolor="#8C8C8C"><td colspan="3"></td></tr> <!-- 라인 -->

<tr><td colspan="3">
            
            
    <textarea name="contentArea" id="editor1" rows="10" cols="80">
		으하하하하하하하
	</textarea>        
            
            
	<script>
	/* CKEDITOR.editorConfig = function( config ) {
		config.toolbar = 'Full';
		config.language = 'es';
		config.uiColor = '#F7B42C';
		width = '100%';       //---넓이값
		height = '400';        //---높이값
		config.toolbarCanCollapse = true;
	};  
 */		
	CKEDITOR.replace( 
	'editor1',{
		toolbar : 'Basic',     	
		filebrowserImageUploadUrl : 'fileupload.jsp?type=Images',   //파일업로드시 사용
		width : '100%',       //---넓이값
		height : '400'        //---높이값
		}
	);    
	</script>
          
	
          
          
</td></tr>


<tr height="60"><td colspan="4" align="center"><input type="button" name="approvalUp" value="결재상신" onclick="window.open('http://localhost:8080/erp/approvalCreated_ok')"/></td></tr>

</table>


</body>
</html>