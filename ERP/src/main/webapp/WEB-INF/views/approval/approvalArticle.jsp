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
<script src="/erp/resources/script/ckeditor/config2.js"></script>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="http://googledrive.com/host/0B-QKv6rUoIcGREtrRTljTlQ3OTg"></script><!-- ie10-viewport-bug-workaround.js -->
<script src="http://googledrive.com/host/0B-QKv6rUoIcGeHd6VV9JczlHUjg"></script><!-- holder.js -->

<link rel="stylesheet" href="<%=cp%>/resources/script/jquery-ui-1.11.4.custom/jquery-ui.css" type="text/css">
<script type="text/javascript" src="<%=cp%>/resources/schedule/jquery-2.2.0.js"></script>
<script type="text/javascript" src="<%=cp%>/resources/script/jquery-ui-1.11.4.custom/jquery-ui.js"></script>

<script type="text/javascript">

	function approvalOK(){
		
		if(confirm("승인 하시겠습니까??") == true){
					
			f = document.approvalForm;		
			f.action = "<%=cp%>/approvalOK_ok";
			f.submit();
			
			alert("결재가 승인 되었습니다.");
			window.opener.location.reload();
			window.close();	
					
		}else{
			return;
		}		
	}
	
	function approvalReturn(){
		
		if(confirm("반려 하시겠습니까??") == true){
					
			f = document.approvalForm;
			f.action = "<%=cp%>/approvalReturn_ok";
			f.submit();
			
			alert("반려 되었습니다.");
			window.opener.location.reload();
			window.close();	
					
		}else{
			return;
		}		
	}
	
	function articleClose(){
		window.close();
	}
	
	function openWin(i) {
	    window.open('./search_ok.action?num='+i, '','width=500, height=600, toolbar=no, menubar=no, scrollbars=no, resizable=yes');
	}
	
</script>


<!-- 스크립트스크립트스크립트스크립트스크립트스크립트스크립트스크립트스크립트스크립트스크립트스크립트스크립트스크립트스크립트 -->

<title>[${dto.type}]${dto.subject }</title>
</head>
<body>


<form action="" method="post" name="approvalForm">

<input type="hidden" name="depth1" value="${LoginDTO.id }">

<table width="100%" cellspacing="0" cellpadding="0">
<tr style="height:1px;" bgcolor="#8C8C8C"><td colspan="3"></td></tr> <!-- 라인 -->
<tr height="45"><td bgcolor="#8C8C8C" width="1"></td><td bgcolor="#EAEAEA">
<font style="font-size: 16pt">&nbsp;${dto.type} - ${dto.subject }</font>
</td>
<td bgcolor="#8C8C8C" width="1"></td></tr>
<tr style="height:1px;" bgcolor="#8C8C8C"><td colspan="3"></td></tr> <!-- 라인 -->
<tr height="40"><td align="right" colspan="3" >
<input type="button" onclick="articleClose()" value="닫기" />
</td></tr>
<tr style="height:1px;" bgcolor="#8C8C8C"><td colspan="3"></td></tr> <!-- 라인 -->
<tr height="70"><td colspan="3" align="center"><font style="font-size: 15pt; font-weight: bolder;">${dto.type}</font></td></tr> 
</table>

<table border="0" cellspacing="0" align="right"> 

  <div id="approvalLineOK" align="left">
	<c:set var="a" value="${dto.approvalDepth }"/>
	
	<c:forEach var="i" begin="1" end="${dto.approvalDepth-1}" step="1" >
		
		<div id="applovalfLine">
		<table align="right" cellspacing="0" cellpadding="0">
		<tr><td width="110" height="1" bgcolor="#BDBDBD"></td><td width="1" height="1" bgcolor="#BDBDBD"></td></tr>
		<tr><td width="110" height="28" bgcolor="#EAEAEA" align="center">
		<font style="font-size: 10pt; font-weight: bold;">
		<c:choose>
		<c:when test="${i!=1}">
		결재
		</c:when>
		<c:when test="${i==1}">
		전결
		</c:when>
		</c:choose>	
		</font>
		
		</td><td width="1" height="" bgcolor="#BDBDBD"></td></tr>
		<tr><td width="110" height="1" bgcolor="#BDBDBD"></td><td width="1" height="1" bgcolor="#BDBDBD"></td></tr>
		<tr><td width="110" height="28" align="center"><font style="font-size: 9pt;">
		
		<c:choose>
				
			<c:when test="${dto.approvalDepth==2}">
					<a href="javascript:openWin('${nameDTO.num2 }')">
					${nameDTO.depth2}
					</a>
			</c:when>
			
			<c:when test="${dto.approvalDepth==3}">		
			<c:choose>
				<c:when test="${i==1 }">
				<a href="javascript:openWin('${nameDTO.num3 }')">
					${nameDTO.depth3}
				</a>
				</c:when>
				<c:when test="${i==2 }">
				<a href="javascript:openWin('${nameDTO.num2 }')">
					${nameDTO.depth2}
				</a> 
				</c:when>
			</c:choose>
			</c:when>
		
			<c:when test="${dto.approvalDepth==4}">
			<c:choose>
				<c:when test="${i==1 }">
				<a href="javascript:openWin('${nameDTO.num4 }')">
					${nameDTO.depth4}
				</a>
				</c:when>
				<c:when test="${i==2 }">
				<a href="javascript:openWin('${nameDTO.num3 }')">
					${nameDTO.depth3}
				</a>
				</c:when>
				<c:when test="${i==3 }">
				<a href="javascript:openWin('${nameDTO.num2 }')">
					${nameDTO.depth2}
				</a>
				</c:when>
			</c:choose>
			</c:when>
			
			<c:when test="${dto.approvalDepth==5}">
			<c:choose>
				<c:when test="${i==1 }">
				<a href="javascript:openWin('${nameDTO.num5 }')">
					${nameDTO.depth5}
				</a>
				</c:when>
				<c:when test="${i==2 }">
				<a href="javascript:openWin('${nameDTO.num4 }')">
					${nameDTO.depth4}
				</a>
				</c:when>
				<c:when test="${i==3 }">
				<a href="javascript:openWin('${nameDTO.num3 }')">
					${nameDTO.depth3}
				</a>
				</c:when>
				<c:when test="${i==3 }">
				<a href="javascript:openWin('${nameDTO.num2 }')">
					${nameDTO.depth2}
				</a>
				</c:when>
			</c:choose>
			</c:when>
		
			<c:when test="${dto.approvalDepth==6}">
			<c:choose>
				<c:when test="${i==1 }">
				<a href="javascript:openWin('${nameDTO.num6 }')">
					${nameDTO.depth6}
				</a>
				</c:when>
				<c:when test="${i==2 }">
				<a href="javascript:openWin('${nameDTO.num5 }')">
					${nameDTO.depth5}
				</a>
				</c:when>
				<c:when test="${i==3 }">
				<a href="javascript:openWin('${nameDTO.num4 }')">
					${nameDTO.depth4}
				</a>
				</c:when>
				<c:when test="${i==4 }">
				<a href="javascript:openWin('${nameDTO.num3 }')">
					${nameDTO.depth3}
				</a>
				</c:when>
				<c:when test="${i==5 }">
				<a href="javascript:openWin('${nameDTO.num2 }')">
					${nameDTO.depth2}
				</a>
				</c:when>
			</c:choose>
			</c:when>
		
		</c:choose>

		</font></td><td width="1" height="" bgcolor="#BDBDBD"></td></tr>
	
		<tr><td width="110" height="1" bgcolor="#BDBDBD"></td><td width="1" height="1" bgcolor="#BDBDBD"></td></tr>
		<tr><td width="110" height="28" align="center">														
		<font style="font-size: 9pt; font-weight: bold; font-style: oblique">
		<c:choose>
				
			<c:when test="${dto.approvalDepth==2}">
			<c:choose>
				
				<c:when test="${dto.approvalOK2!=null}">
					${nameDTO.depth2}
				</c:when>
				
			</c:choose>
			</c:when>
			
			<c:when test="${dto.approvalDepth==3}">		
			<c:choose>

				<c:when test="${i==1 }">
				<c:choose>
					<c:when test="${dto.approvalOK3!=null}">
						${nameDTO.depth3}
					</c:when>
				</c:choose>
				</c:when>

				<c:when test="${i==2 }">
				<c:choose>
					<c:when test="${dto.approvalOK2!=null}">
						${nameDTO.depth2}
					</c:when>
				</c:choose>
				</c:when>
				
							
			</c:choose>
			</c:when>
		
			<c:when test="${dto.approvalDepth==4}">
			<c:choose>
				
				<c:when test="${i==1 }">
				<c:choose>
					<c:when test="${dto.approvalOK4!=null}">
						${nameDTO.depth4}
					</c:when>
				</c:choose>
				</c:when>
				
				<c:when test="${i==2 }">
				<c:choose>
					<c:when test="${dto.approvalOK3!=null}">				
						${nameDTO.depth3}
					</c:when>
				</c:choose>			
				</c:when>
				
				<c:when test="${i==3 }">
					<c:choose>
					<c:when test="${dto.approvalOK2!=null}">
						${nameDTO.depth2}
					</c:when>
				</c:choose>
				</c:when>
				
			</c:choose>
			</c:when>
			
			<c:when test="${dto.approvalDepth==5}">
			<c:choose>
				
				<c:when test="${i==1 }">
					<c:choose>
					<c:when test="${dto.approvalOK5!=null}">
						${nameDTO.depth5}
					</c:when>
					</c:choose>		
				</c:when>
				
				<c:when test="${i==2 }">
					<c:choose>
					<c:when test="${dto.approvalOK4!=null}">
						${nameDTO.depth4}
					</c:when>
					</c:choose>
				</c:when>
				
				<c:when test="${i==3 }">
					<c:choose>
					<c:when test="${dto.approvalOK3!=null}">
						${nameDTO.depth3}
					</c:when>
					</c:choose>
				</c:when>
				
				<c:when test="${i==4 }">
					<c:choose>
					<c:when test="${dto.approvalOK2!=null}">
						${nameDTO.depth2}
					</c:when>
					</c:choose>
				</c:when>				
				
			</c:choose>
			</c:when>
		
			<c:when test="${dto.approvalDepth==6}">
			<c:choose>
				
				<c:when test="${i==1 }">
					<c:choose>
					<c:when test="${dto.approvalOK6!=null}">
						${nameDTO.depth6}
					</c:when>
					</c:choose>	
				</c:when>
				
				<c:when test="${i==2 }">
					<c:choose>
					<c:when test="${dto.approvalOK5!=null}">
						${nameDTO.depth5}
					</c:when>
					</c:choose>		
				</c:when>
				
				<c:when test="${i==3 }">
					<c:choose>
					<c:when test="${dto.approvalOK4!=null}">
						${nameDTO.depth4}
					</c:when>
					</c:choose>
				</c:when>
				
				<c:when test="${i==4 }">
					<c:choose>
					<c:when test="${dto.approvalOK3!=null}">
						${nameDTO.depth3}
					</c:when>
					</c:choose>
				</c:when>
				
				<c:when test="${i==5 }">
					<c:choose>
					<c:when test="${dto.approvalOK2!=null}">
						${nameDTO.depth2}
					</c:when>
					</c:choose>
				</c:when>
				
			</c:choose>
			</c:when>
		
		</c:choose>
		</font>
		</td><td width="1" height="" bgcolor="#BDBDBD"></td></tr>	      
		
		<tr><td width="110" height="1" bgcolor="#BDBDBD"></td><td width="1" height="1" bgcolor="#BDBDBD"></td></tr>
		<tr><td width="110" height="28" align="center">
		<font style="font-size: 9pt;">
		
		<c:choose>
				
			<c:when test="${dto.approvalDepth==2}">
				${dto.approvalOK2}
			</c:when>
			
			<c:when test="${dto.approvalDepth==3}">		
			<c:choose>
				<c:when test="${i==1 }">
						${dto.approvalOK3}
				</c:when>
				<c:when test="${i==2 }">
						${dto.approvalOK2}	
				</c:when>							
			</c:choose>
			</c:when>
		
			<c:when test="${dto.approvalDepth==4}">		
			<c:choose>
				<c:when test="${i==1 }">
						${dto.approvalOK4}
				</c:when>
				<c:when test="${i==2 }">
						${dto.approvalOK3}	
				</c:when>
				<c:when test="${i==3 }">
						${dto.approvalOK2}	
				</c:when>													
			</c:choose>
			</c:when>
			
			<c:when test="${dto.approvalDepth==5}">		
			<c:choose>
				<c:when test="${i==1 }">
						${dto.approvalOK5}
				</c:when>
				<c:when test="${i==2 }">
						${dto.approvalOK4}	
				</c:when>
				<c:when test="${i==3 }">
						${dto.approvalOK3}	
				</c:when>
				<c:when test="${i==4 }">
						${dto.approvalOK2}	
				</c:when>													
			</c:choose>
			</c:when>
		
			<c:when test="${dto.approvalDepth==6}">		
			<c:choose>
				<c:when test="${i==1 }">
						${dto.approvalOK6}
				</c:when>
				<c:when test="${i==2 }">
						${dto.approvalOK5}	
				</c:when>
				<c:when test="${i==3 }">
						${dto.approvalOK4}	
				</c:when>
				<c:when test="${i==4 }">
						${dto.approvalOK3}	
				</c:when>
				<c:when test="${i==5 }">
						${dto.approvalOK2}	
				</c:when>														
			</c:choose>
			</c:when>	
		</c:choose>	
		
		</font></td><td width="1" height="" bgcolor="#BDBDBD"></td></tr>
		
		<tr><td width="110" height="1" bgcolor="#BDBDBD"></td><td width="1" height="1" bgcolor="#BDBDBD"></td></tr>
		<c:set var="a" value="${a - 1}"/>
		</table>
		</div>
	
	</c:forEach>
  </div>

  <table id="Approval2" class="" align="right" cellspacing="0" cellpadding="0">
  <tr><td width="110" height="1" bgcolor="#BDBDBD"></td><td width="1" height="1" bgcolor="#BDBDBD"></td></tr>
  <tr><td width="110" height="28" bgcolor="#EAEAEA" align="center"><font style="font-size: 10pt; font-weight: bold;">기안</font></td><td width="1" height="" bgcolor="#BDBDBD"></td></tr>
  
  <tr><td width="110" height="1" bgcolor="#BDBDBD"></td><td width="1" height="1" bgcolor="#BDBDBD"></td></tr>
  <tr><td width="110" height="28" align="center">
  <font style="font-size: 9pt;">${nameDTO.depth1 }</font></td><td width="1" height="" bgcolor="#BDBDBD"></td></tr>
  
  <tr><td width="110" height="1" bgcolor="#BDBDBD"></td><td width="1" height="1" bgcolor="#BDBDBD"></td></tr>
  <tr><td width="110" height="28" align="center">
  <font style="font-size: 9pt; font-weight: bold; font-style: oblique">
  ${nameDTO.depth1}
  </font></td><td width="1" height="" bgcolor="#BDBDBD"></td></tr>
  
  <tr><td width="110" height="1" bgcolor="#BDBDBD"></td><td width="1" height="1" bgcolor="#BDBDBD"></td></tr>
  <tr><td width="110" height="28" align="center">
  <font style="font-size: 9pt;">
  ${dto.created }
  </font>
  </td><td width="1" height="" bgcolor="#BDBDBD"></td></tr>
  
  <tr><td width="110" height="1" bgcolor="#BDBDBD"></td><td width="1" height="1" bgcolor="#BDBDBD"></td></tr>
  </table>
  <table id="ApprovalFirst" class="" align="right" cellspacing="0" cellpadding="0">
  <tr><td width="1" height="1" bgcolor="#BDBDBD"></td><td width="13" bgcolor="#BDBDBD"></td><td width="1" bgcolor="#BDBDBD"></td></tr>
	  <tr>
	  <td width="1" bgcolor="#BDBDBD"></td>
	  <td width="16" height="115" bgcolor="#EAEAEA" align="center">
		  <font style="font-size: 9pt; font-weight: bold;">결</br>재</br>라</br>인</br></font>
	  </td>
	  <td width="1" bgcolor="#BDBDBD"></td>
	  </tr>
  <tr><td width="1" height="1" bgcolor="#BDBDBD"></td><td width="13" bgcolor="#BDBDBD"></td><td width="1" bgcolor="#BDBDBD"></td></tr>
  </table>
  
 </table>

<table align="center" width="100%" cellpadding="0" cellspacing="0">

<tr height="20"><td colspan="3"></td></tr> <!-- 공백라인 -->

<tr style="height:1px;" bgcolor="#8C8C8C"><td colspan="3"></td></tr> <!-- 라인 -->

<tr>
<td width="150" height="30" bgcolor="#E4F7BA" align="center"> <font style="font-size: 11pt; font-style: 나눔고딕코딩;font-weight: bolder;">제목</font></td>
<td width="1" bgcolor="#8C8C8C"></td>
<td height="30" bgcolor="#E4F7BA" align="left">
&nbsp;&nbsp;&nbsp;&nbsp;${dto.subject }</td>
</tr> 

<tr style="height:1px;" bgcolor="#8C8C8C"><td colspan="3"></td></tr> <!-- 라인 -->

<tr><td colspan="3">
          
    <textarea name="contentArea" readonly="readonly" id="editor1" rows="10" cols="80">
    
    	${dto.content}
    
	</textarea>                      
 	
 	<script>		
		CKEDITOR.replace( 
		'editor1',{
			toolbar: 
				[
				[ 'Source' ],
				[ 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe' ], 
				[ 'Styles', 'Format', 'Font', 'FontSize' ]	
				],
			width : '100%',       //---넓이값
			height : '780'        //---높이값
			}
		);    
	</script>   

<input type="hidden" name="approvalNum" value="${dto.approvalNum }"/>

    	
</td></tr>
<c:choose>

<c:when test="${LoginDTO.id == dto.approval2 && dto.approvalOK2 == null }">
<tr height="60"><td colspan="4" align="center">
<input type="button" style="width: 100px; height: 30px; font-size: 10pt; font-family: 고딕;" name="" value="결재" onclick="javascript:approvalOK();"/>&nbsp;&nbsp;&nbsp;
<input type="button" style="width: 100px; height: 30px; font-size: 10pt; font-family: 고딕;" name="" value="반려" onclick="javascript:approvalReturn();"/>
<input type="hidden" name="mydepth" value="2"/>
</td></tr>
</c:when>

<c:when test="${LoginDTO.id == dto.approval3 && dto.approvalOK3 == null }">
<tr height="60"><td colspan="4" align="center">
<input type="button" style="width: 100px; height: 30px; font-size: 10pt; font-family: 고딕;" name="" value="결재" onclick="approvalOK();"/>&nbsp;&nbsp;&nbsp;
<input type="button" style="width: 100px; height: 30px; font-size: 10pt; font-family: 고딕;" name="" value="반려" onclick="approvalReturn();"/>
<input type="hidden" name="mydepth" value="3"/>
</td></tr>
</c:when>

<c:when test="${LoginDTO.id == dto.approval4 && dto.approvalOK4 == null }">
<tr height="60"><td colspan="4" align="center">
<input type="button" style="width: 100px; height: 30px; font-size: 10pt; font-family: 고딕;" name="" value="결재" onclick="approvalOK();"/>&nbsp;&nbsp;&nbsp;
<input type="button" style="width: 100px; height: 30px; font-size: 10pt; font-family: 고딕;" name="" value="반려" onclick="approvalReturn();"/>
<input type="hidden" name="mydepth" value="4"/>
</td></tr>
</c:when>

<c:when test="${LoginDTO.id == dto.approval5 && dto.approvalOK5 == null }">
<tr height="60"><td colspan="4" align="center">
<input type="button" style="width: 100px; height: 30px; font-size: 10pt; font-family: 고딕;" name="" value="결재" onclick="approvalOK();"/>&nbsp;&nbsp;&nbsp;
<input type="button" style="width: 100px; height: 30px; font-size: 10pt; font-family: 고딕;" name="" value="반려" onclick="approvalReturn();"/>
<input type="hidden" name="mydepth" value="5"/>
</td></tr>
</c:when>

<c:when test="${LoginDTO.id == dto.approval6 && dto.approvalOK6 == null }">
<tr height="60"><td colspan="4" align="center">
<input type="button" style="width: 100px; height: 30px; font-size: 10pt; font-family: 고딕;" name="" value="결재" onclick="approvalOK();"/>&nbsp;&nbsp;&nbsp;
<input type="button" style="width: 100px; height: 30px; font-size: 10pt; font-family: 고딕;" name="" value="반려" onclick="approvalReturn();"/>
<input type="hidden" name="mydepth" value="6"/>
</td></tr>
</c:when>

</c:choose>



</table>
</form>

</body>
</html>