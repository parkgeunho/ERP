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

<!-- //javascript:openpage_small('/form01?openform&form=GV28'); -->
<script type="text/javascript">

/* $(document).ready(function() {
	
	
}); */


</script>



<script type="text/javascript">

	$(function(){
		
		var dialog;
		
		var test;
		
		$("#approvalLineModal").click(function(){
			
			alert("앙수민11띠");
			
			dialog = $("<body>").dialog({
				
				modal:true,				
				open:function(){
					
					//$(this).load("approvalLine.jsp");
					$(this).load("approvalLine");
				},
				
				height:600,
				width:900,
				title:"결재선 지정",
				
				buttons: {
					"넘겨라3":function(){
											
						alert(hihi());
						
						dialog.dialog("close");					
					},
					"닫아라":function(){
						
						dialog.dialog("close");
					}
				}, 
				
				close: function(){
					this.close();
				} 
			});
		});		
	});

</script>


<title>결재 상신</title>
</head>
<body>

<table width="100%" cellspacing="0" cellpadding="0">
<tr style="height:1px;" bgcolor="#8C8C8C"><td colspan="3"></td></tr> <!-- 라인 -->
<tr height="45"><td bgcolor="#8C8C8C" width="1"></td><td bgcolor="#EAEAEA"><font style="font-size: 16pt">dto.type - dto.approvalFormName</font></td><td bgcolor="#8C8C8C" width="1"></td></tr>
<tr style="height:1px;" bgcolor="#8C8C8C"><td colspan="3"></td></tr> <!-- 라인 -->
<tr height="40"><td align="right" colspan="3" >
<input type="button" value="결재선 지정" id="approvalLineModal" />
<input type="button" name="approvalSave" value="저장" />
<input type="button" name="approvalClose" value="닫기"  />
</td></tr>
<tr style="height:1px;" bgcolor="#8C8C8C"><td colspan="3"></td></tr> <!-- 라인 -->
<tr height="70"><td colspan="3" align="center"><font style="font-size: 15pt; font-weight: bolder;">dto.approvalFormName</font></td></tr> 
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
    
		<table align="center" border="0" cellpadding="0" cellspacing="0" style="border-collapse:collapse; width: 520pt">
			<tbody>
				<tr>
					<td colspan="4" style="width: 520pt; height: 38.25pt;">
						<table align="center" cellpadding="0" cellspacing="0">
							<tbody>
								<tr>
									<td colspan="4" style="width: 520pt; height: 38.25pt; text-align: center; vertical-align: middle;">
									<p style="margin-left: 40px;"><strong><span style="font-size:26px">사직원</span></strong></p>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td style="border-color: gray; width: 90pt; height: 31.5pt; text-align: center; vertical-align: middle; background-color: rgb(217, 225, 242);">소속</td>
					<td style="border-color: gray; width: 170pt; text-align: center; vertical-align: middle;">인프라운영실</td>
					<td style="border-color: gray; width: 90pt; text-align: center; vertical-align: middle; background-color: rgb(217, 225, 242);">직급</td>
					<td style="border-color: gray; width: 170pt;text-align: center; vertical-align: middle;">대리</td>
				</tr>
				<tr>
					<td style="border-color: gray; height: 32.1pt; text-align: center; vertical-align: middle; background-color: rgb(217, 225, 242);">성명</td>
					<td style="border-color: gray; text-align: center; vertical-align: middle;">김기훈</td>
					<td style="border-color: gray; text-align: center; vertical-align: middle; background-color: rgb(217, 225, 242);">입사일</td>
					<td style="border-color: gray; text-align: center; vertical-align: middle;">&nbsp;</td>
				</tr>
				<tr>
					<td style="border-color: gray; height: 32.1pt; text-align: center; vertical-align: middle; background-color: rgb(217, 225, 242);">연락처</td>
					<td style="border-color: gray; text-align: center; vertical-align: middle;">&nbsp;</td>
					<td style="border-color: gray; text-align: center; vertical-align: middle; background-color: rgb(217, 225, 242);">외부 e-mail</td>
					<td style="border-color: gray; text-align: center; vertical-align: middle;">&nbsp;</td>
				</tr>
				<tr>
					<td style="border-color: gray; height: 32.1pt; text-align: center; vertical-align: middle; background-color: rgb(217, 225, 242);">주소</td>
					<td colspan="3" style="border-color: gray; text-align: center; vertical-align: middle;">&nbsp;</td>
				</tr>
				<tr>
					<td style="border-color: gray; height: 35.25pt; text-align: center; vertical-align: middle; background-color: rgb(217, 225, 242);">사직 희망일</td>
					<td style="border-color: gray; text-align: center; vertical-align: middle;">&nbsp;</td>
					<td style="border-color: gray; text-align: center; vertical-align: middle; background-color: rgb(217, 225, 242);">회사가 정한 사직일</td>
					<td style="border-color: gray; text-align: center; vertical-align: middle;">&nbsp;</td>
				</tr>
				<tr>
					<td style="border-color: gray; height: 69.75pt; text-align: center; vertical-align: middle; background-color: rgb(217, 225, 242);">사직 사유</td>
					<td colspan="3" style="border-color: gray; text-align: center; vertical-align: middle;">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="4" style="border-color: gray; width: 477pt; height: 128.25pt; text-align: center; vertical-align: middle;">상기 본인은 위와 같은 사유로 사직하고자 하오니 이에 재가를 바랍니다.&nbsp;<br />
					<br />
					<strong><strong>2016/02/19</strong> </strong><br />
					<br />
					<strong>신청자 성명 :&nbsp;김기훈&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>&nbsp;&nbsp;&nbsp;&nbsp;</strong><strong>(서명)</strong></td>
				</tr>
				<tr>
					<td colspan="4" style="border-color: gray; width: 477pt; height: 129.75pt; text-align: center; vertical-align: middle;">
					<p><strong><span style="font-size:14px">[퇴사 Process 안내]</span></strong></p>
		
					<p style="text-align: left;">
					&nbsp;퇴직 의향 부서장 전달 &gt; HR 면담 및 사직 절차 안내(사직 의향자 면담서 HR 제출)<br />
					&nbsp;[온라인 진행사항] 사직원 전자결재 작성, 업무인수 서 전자 결재 작성,&nbsp; 사용자 계정 신청/삭제 전자결재 작성<br />
					&nbsp;[오프라인 진행사항] (HR면담시 메일로 전달된) 퇴직확인서Kit 인쇄 및 유관 부서 확인<br />
					&nbsp;(기밀유지서약서, 사직절차준수서약서, 자산반납 등 확인서를 퇴직자가 직접 해당부서 방문해 진행)<br />
					&nbsp;(기안 상신 후 결재 완료된) 사직원 인쇄 및 서명 + 퇴직 확인서 Kit를 HR 제출</p>
					</td>
				</tr>
			</tbody>
		</table>

	</textarea>        
            
            
	<script>		
		CKEDITOR.replace( 
		'editor1',{
			toolbar : 'Basic',     	
			filebrowserImageUploadUrl : 'fileupload.jsp?type=Images',   //파일업로드시 사용
			width : '100%',       //---넓이값
			height : '500'        //---높이값
			}
		);    
	</script>          
          
</td></tr>


<tr height="60"><td colspan="4" align="center"><input type="button" name="approvalUp" value="결재상신" onclick="window.open('http://localhost:8080/erp/approvalCreated_ok')"/></td></tr>

</table>


</body>
</html>