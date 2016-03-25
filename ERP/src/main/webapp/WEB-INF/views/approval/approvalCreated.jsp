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
<script type="text/javascript" src="<%=cp%>/resources/schedule/jquery-2.2.0.js"></script>
<script type="text/javascript" src="<%=cp%>/resources/script/jquery-ui-1.11.4.custom/jquery-ui.js"></script>

<script>

	$(function() {
		  		
		dialog = $( "#approvalLine" ).dialog({
		      autoOpen: false,
		      height:520,
			  width:800,
		      modal: true,
		      buttons: {
		      	"결재선 지정": approvalLineOK,
		      	취소: function() {
		          dialog.dialog( "close" );
		        }		        
		      },		      
		      close: function() {
		                
		      }		      
		 });		
		 
		$( ".approvalLineModal" ).button().on( "click", function() {
				dialog.dialog( "open" );
		});	 
		 
		function approvalLineOK (){
		
			var elSel = document.getElementById('selectX');
			
			var params = "";
						
			$('[id^="applovalfLine"]').remove();
					    
		 	for(var i = 1; i < elSel.length; i++){
		 		if(i!=1){
		 			params += "&"
		 		}		 			 	
		 		params += "id"+i+"="+elSel.options[i].value; 	 		 		
		 	}
		 	
		 	params += "&num="+elSel.length;
		 	
		 	$.ajax({
				
				url:'approvalLineOK_Ajax',
				data:params,
				type:'POST',
					
				error:function(args){
					alert("에러");
				},					
				success: function(args){
					$("#approvalLineOK").prepend(args);
				}					
			});
		 	
		 		 	
			dialog.dialog( "close" );
		}
		
		$('[id^="dep-"]').click(function(){
			
			var src = ($(this).attr('src')==='/erp/resources/image/minus.png') ?'/erp/resources/image/plus.png':'/erp/resources/image/minus.png';
		     
		    $(this).attr('src',src);
		 
			var obj = $('.'+ this.id);
				
			if(obj.css('display')=='none')
				obj.show();
			else
				obj.hide();
		});
			
		$('.check-all').click( function(){
			$('.member').prop('checked',this.checked);
		});	
		
		$('[id^="ch-"]').click(function(){
						
			num= $('.num'+this.id).val();
				
			$.ajax({
				url:'approvalMemberList',
				data:{num:num},
				type:'POST',
			
				error:function(args){
					
				},
				success: function(args){
					$("#approvalMemberList").html(args);                           
				}
			});			
		});
			
		$('.approvalLineAppend').click( function(){
			
			var elSel = document.getElementById('selectX');
					
			var mchk;
			var chk = document.getElementsByName("member[]"); 
			var len = chk.length;    
			var checkRow = '';      
			var checkCnt = 0;       
			var checkLast = '';     
			var rowid = '';         
			var cnt = 0;             
				
			if (!$('.member').is(":checked")){
				alert("결재자를 선택 하십시오.");
				return;
			}	
			
			for(var i=0; i<len; i++){
				if(chk[i].checked == true){
					checkCnt++;        
					checkLast = i;     
				}
			} 
			
			if(checkCnt+elSel.length > 6){
				alert("결재라인은 기안자를 포함하여 6명 까지 가능합니다.")
				return;
			}
			
			for(var i=0; i<len; i++){
			
				if(chk[i].checked == true){  

					checkRow = chk[i].value;			            	

					if(checkCnt == 1){       
						rowid += "'"+checkRow+"'";
					}else{                        
						if(i == checkLast){        
							rowid += "'"+checkRow+"'"; 
						}else{
							rowid += "'"+checkRow+"',";	         			
						}
					}
					cnt++;
					checkRow = '';    //checkRow초기화.
				}
			}
								
			mchk = rowid;
					
			for(var k=0; k < checkCnt; k++){
				var a = rowid.split(",")
			}
				
			for (var i = 0; i < a.length; i++){
				
				for(var j = 0; j < elSel.length; j++){
					
					var kn = a[i];		
					kn = kn.substring(1, kn.length-1);
					
					if(kn == elSel.options[j].value){
						alert("이미 등록되어 있습니다.");
						return; 
					}				
				}			
				
				$.ajax({ 
					url:'approvalOptionList',
					data:{id:a[i]},
					type:'POST',
				
					error:function(args){
						alert("에러");
					},
					success: function(args){
						$("#selectX").append(args);                           
					}
				});		
			} 
					
			a = null;
			
		});
		
		$('.approvalLineRemove').click( function(){
			
			var elSel = document.getElementById('selectX');
			var i;
			
			if(elSel.options[0].selected){
				alert("기안자는 삭제할 수 없습니다.");
				return;
			}
					
			for (i = elSel.length - 1; i>=0; i--) {
				if (elSel.options[i].selected) {
					elSel.remove(i);
				}
			}
		});
		
		
		
		
		
		$('#approvalLineUp').click( function(){  
			       
			$('#selectX option:selected').each(function(){   
				var selectObj = $(this);
				
				if(selectObj.index()==1){
	        		alert("기안자는 이동할 수 없습니다.");
	        		return;
	        	}
				
				if(selectObj.index()==0){ 
					alert("기안자는 이동할 수 없습니다.");
	        		return;
				}
				
				var targetObj = $('#selectX option:eq('+(selectObj.index()-1)+')');   
			          targetObj.before(selectObj);
			}); 
		});
		
	    $("#approvalLineDown").click(function(){     
			
			$('#selectX option:selected').each(function(){   
	        	var selectObj = $(this);
	        	
	        	if(selectObj.index()==0){
	        		alert("기안자는 이동할 수 없습니다.");
	        		return;
	        	}
	        	
	    		if(selectObj.index() == $('#selectX').children().length ){ 
	    			return false; 
	    		}       
	        	var targetObj = $('#selectX option:eq('+(selectObj.index()+1)+')');
	   			targetObj.after(selectObj);
			}); 
		});
		
		$('.approvalSave').click( function(){
			
			
			
			
			
			
		});
		
		$('.approvalClose').click( function(){
			window.close();	
		});
	    	    
	    
	});
	
</script>

<script type="text/javascript">

	function sendIt(){
		
		var elSel = document.getElementById('selectX');
		
		f = document.approvalForm;

		str = f.subject.value;
    	str = str.trim();
        if(!str) {
            alert("제목을 입력하십시오.");
            f.subject.focus();
            return;
        }      
        
        str = f.contentArea.value;
    	str = str.trim();
        if(!str) {
            alert("내용을 입력하십시오.");
            f.contentArea.focus();
            return;
        }             
        
        if(elSel.length==1){
        	alert("결재선을 지정하십시오.");
        	return;
        }
        
		f.action = "<%=cp%>/approvalCreated_ok";
		f.submit();
		
		alert("결재 상신 완료.");
		window.close();
		
		window.opener.location.reload();
	}
	
	function openWin(i) {
	    window.open('./search_ok.action?num='+i, '','width=500, height=600, toolbar=no, menubar=no, scrollbars=no, resizable=yes');
	}
</script>


<!-- 스크립트스크립트스크립트스크립트스크립트스크립트스크립트스크립트스크립트스크립트스크립트스크립트스크립트스크립트스크립트 -->

<title>결재 상신</title>
</head>
<body>

<div id="approvalLine" title="결재선 지정">

	<table cellpadding="0" cellspacing="0" border="0">
	
	<!-- 라인라인라인라인라인라인라인라인라인라인라인라인라인 -->
	<tr height="1"> 
	
	<td width="10"></td>
	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="4" bgcolor="#8C8C8C"></td>
	<td width="100" bgcolor="#8C8C8C"></td>
	<td width="100" bgcolor="#8C8C8C"></td>
	<td width="4" bgcolor="#8C8C8C"></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	
	
	<td width="10"></td>
	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="15" bgcolor="#8C8C8C"></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="60" bgcolor="#8C8C8C"></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="60" bgcolor="#8C8C8C"></td>	
	<td width="1" bgcolor="#8C8C8C"></td>
	
	<td width="10"></td>
	
	<td width="1" bgcolor=""></td>
	<td width="35" bgcolor=""></td>
	<td width="35" bgcolor=""></td>
	<td width="1" bgcolor=""></td>
	
	<td width="10"></td>
	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="60" bgcolor="#8C8C8C"></td>	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="60" bgcolor="#8C8C8C"></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="80" bgcolor="#8C8C8C"></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	
	<td width="10"></td>
	</tr>
	
	<!-- 22222222222222222222222222222 -->
	
	<tr height="25">
	
	<td width="10"></td>
	
	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="4"></td>
	<td width="100" align="right">
	<input type="button" value="모두닫음" style="width: 60px; height: 18px; font-size: 8pt; "/>&nbsp;</td>
	<td width="100" align="left">
	<input type="button" value="모두펼침" style="width: 60px; height: 18px; font-size: 8pt; "/></td>
	<td width="4"></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	
	
	<td width="10"></td>
	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="25" align="center"><input type="checkbox" name="all" class="check-all"/></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="80" bgcolor="" align="center">
	<font style="font-size: 9pt;">이름</font></td>	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="80" bgcolor="" align="center">
	<font style="font-size: 9pt;">직위</font></td>	
	<td width="1" bgcolor="#8C8C8C"></td>
	
	<td width="10"></td>
	
	<td width="1" bgcolor=""></td>
	<td width="35" bgcolor=""></td>
	<td width="35" bgcolor=""></td>
	<td width="1" bgcolor=""></td>
	
	<td width="10"></td>
	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="80" bgcolor="" align="center">
	<font style="font-size: 9pt;">이름</font></td>	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="60" bgcolor="" align="center">
	<font style="font-size: 9pt;">직위</font></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="120" bgcolor="" align="center">
	<font style="font-size: 9pt;">부서</font></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	
	<td width="10"></td>
	</tr>
	
	<!-- 22222222222222222222222222222 -->
	
	<!-- 33333333333333333333333333333 -->
	
	<tr height="1">
	
	<td width="10"></td>
	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="4" bgcolor=""></td>
	<td width="100" bgcolor=""></td>
	<td width="100" bgcolor=""></td>
	<td width="4" bgcolor=""></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	
	
	<td width="10"></td>
	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="15" bgcolor=""></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="60" bgcolor=""></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="60" bgcolor=""></td>	
	<td width="1" bgcolor="#8C8C8C"></td>
	
	<td width="10"></td>
	
	<td width="1" bgcolor=""></td>
	<td width="35" bgcolor=""></td>
	<td width="35" bgcolor=""></td>
	<td width="1" bgcolor=""></td>
	
	<td width="10"></td>
	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="60" bgcolor=""></td>	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="60" bgcolor=""></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="80" bgcolor=""></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	
	<td width="10"></td>
	</tr>
	
	<!-- 33333333333333333333333333333 -->
	
	<!-- 44444444444444444444444444444 -->
	<tr height="1">
	
	<td width="10"></td>
	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="6" bgcolor=""></td>
	<td width="100" bgcolor="#8C8C8C" colspan="2"></td>
	<td width="6" bgcolor=""></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	
	
	<td width="10"></td>
	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="15" bgcolor="#8C8C8C"></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="60" bgcolor="#8C8C8C"></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="60" bgcolor="#8C8C8C"></td>	
	<td width="1" bgcolor="#8C8C8C"></td>
	
	<td width="10"></td>
	
	<td width="1" bgcolor=""></td>
	<td width="35" bgcolor=""></td>
	<td width="35" bgcolor=""></td>
	<td width="1" bgcolor=""></td>
	
	<td width="10"></td>
	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="60" bgcolor="#8C8C8C"></td>	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="60" bgcolor="#8C8C8C"></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="80" bgcolor="#8C8C8C"></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	
	<td width="10"></td>
	</tr>
	<!-- 44444444444444444444444444444 -->
	
	<!-- 55555555555555555555555555555 -->
	<tr height="">
	
	<td width="10"></td>
	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="4" bgcolor=""></td>
	<td width="200" bgcolor="" colspan="2" style="vertical-align: top">
	<div align="justify">
				<c:forEach var="parent" items="${parent }">
					<c:forEach var="depth0" items="${lists }">
						<c:choose>
						
						<c:when test="${depth0.parent==0 && depth0.groupNum==parent.groupNum && depth0.replyNum>0}">
						<div>
						<img id="fold-${depth0.buseoNum}" src="/erp/resources/image/minus.png"/>
						<label id="ch-${depth0.buseoName}">${depth0.buseoName }</label>
						<input type="hidden" class="numch-${depth0.buseoName }" value="${depth0.buseoNum }"></a>
						</div>
							<div class="fold-${depth0.buseoNum}">							
							
							<c:forEach var="depth1" items="${lists }">
											
								<c:choose>								
								
								<c:when test="${depth1.parent==depth0.buseoNum && depth1.replyNum>0 }">
									<div style="margin-left: 20px;">
									<img id="fold-${depth1.buseoNum}" src="/erp/resources/image/minus.png"/>
									<label id="ch-${depth1.buseoName }">${depth1.buseoName }</label>
									<input type="hidden" class="numch-${depth1.buseoName }" value="${depth1.buseoNum }">
									</div>
									<div class="fold-${depth1.buseoNum}">									
									
										<c:forEach var="depth2" items="${lists}">
																			
										<c:choose>										
										
											<c:when test="${depth2.parent==depth1.buseoNum && depth2.replyNum>0}">
												<div style="margin-left: 40px;">
												<img id="fold-${depth2.buseoNum}" src="/erp/resources/image/minus.png"/>
												
												<label id="ch-${depth2.buseoName }">${depth2.buseoName }</label>
												<input type="hidden" class="numch-${depth2.buseoName }" value="${depth2.buseoNum }">
												</div>
												<div class="fold-${depth2.buseoNum}">
																								
													<c:forEach var="depth3" items="${lists }" >
													
														<c:choose>														
														
														<c:when test="${depth3.parent==depth2.buseoNum && depth3.replyNum>0 }">
															<div style="margin-left: 60px;">
															<img id="fold-${depth3.buseoNum}" src="/erp/resources/image/minus.png"/>
															<label id="ch-${depth3.buseoName }">${depth3.buseoName }</label>
															<input type="hidden" class="numch-${depth3.buseoName }" value="${depth3.buseoNum }">
															
															</div>
															<div class="fold-${depth3.buseoNum}">
													
															<c:forEach var="depth4" items="${lists }">
															
																<c:choose>
																
																	<c:when test="${depth4.parent==depth3.buseoNum }">
																		<div style="margin-left: 80px;">
																		<label id="ch-${depth4.buseoName }">${depth4.buseoName }</label>
																		<input type="hidden" class="numch-${depth4.buseoName }" value="${depth4.buseoNum }">
																		</div>
																	</c:when>
																</c:choose>
															
															</c:forEach>
															</div>
														</c:when>
																												
														<c:when test="${depth3.parent==depth2.buseoNum && depth3.replyNum==0 }">
															<div style="margin-left: 60px;">
															<label id="ch-${depth3.buseoName }">${depth3.buseoName }</label>
															<input type="hidden" class="numch-${depth3.buseoName }" value="${depth3.buseoNum }">
															</div>
														</c:when>
													
														</c:choose>
													</c:forEach>
												</div>
											</c:when>
											
											
											<c:when test="${depth2.parent==depth1.buseoNum && depth2.replyNum==0 }">
												<div style="margin-left: 40px;">
												<label id="ch-${depth2.buseoName }">${depth2.buseoName }</label>
												<input type="hidden" class="numch-${depth2.buseoName }" value="${depth2.buseoNum }">
												</div>
											</c:when>
										</c:choose>
									
										</c:forEach>
									</div>
								</c:when>
								
								
								
								<c:when test="${depth1.parent==depth0.buseoNum &&depth1.replyNum==0 }">
									<div style="margin-left: 20px;">
									<label id="ch-${depth1.buseoName }">${depth1.buseoName }</label>
									<input type="hidden" class="numch-${depth1.buseoName }" value="${depth1.buseoNum }">
									</div>
								</c:when>
								
								</c:choose>
							</c:forEach>
							</div>
									
						</c:when>
						<c:when test="${depth0.parent==0 && depth0.groupNum==parent.groupNum && parent.replyNum==1}">
						<div>
						<label id="ch-${depth0.buseoName }">${depth0.buseoName }</label>
						<input type="hidden" class="numch-${depth0.buseoName }" value="${depth0.buseoNum }">
	
						</div>
						</c:when>
						</c:choose>
					</c:forEach>
			</c:forEach>
		</div>
	</td>
	<td width="4" bgcolor=""></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	
	
	<td width="10"></td>
	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="15" bgcolor="" colspan="5" style="vertical-align: top">
	<form name="approvalMemberForm">
	<div id="approvalMemberList" style="vertical-align: top">
	</div>
	</form>
	</td>
	<td width="1" bgcolor="#8C8C8C"></td> 
	
	<td width="10"></td>
	
	<td width="1" bgcolor=""></td>
	<td width="35" bgcolor="" colspan="2" align="center">
	
	<input type="button" value="위" id="approvalLineUp" /></a></br>
	<input type="button" value="아래" id="approvalLineDown" /></a></br></br></br>
	<input type="button" value="삭제" class="approvalLineRemove"/></br>
	<input type="button" value="추가" class="approvalLineAppend"/>
	
	
	</td>
	<td width="1" bgcolor=""></td>
	
	<td width="10"></td>
	
	<td width="1" bgcolor=""></td>
	<td bgcolor="" colspan="5" style="font-size: 10pt">
	<select id="selectX" multiple="multiple" style="width: 265px; height: 350px">
		<option value="${LoginDTO.id }">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${LoginDTO.name }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${LoginDTO.grade }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;${LoginDTO.depth2 }&nbsp;&nbsp;&nbsp;&nbsp;
		</option>
	</select>
	</td>	
	<td width="1" bgcolor=""></td>
	
	<td width="10"></td> 
	</tr>
	<!-- 55555555555555555555555555555 -->
	
	<!-- 끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝 -->
	<tr height="1"> 
	
	<td width="10"></td>
	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="4" bgcolor="#8C8C8C"></td>
	<td width="100" bgcolor="#8C8C8C"></td>
	<td width="100" bgcolor="#8C8C8C"></td>
	<td width="4" bgcolor="#8C8C8C"></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	
	
	<td width="10"></td>
	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="15" bgcolor="#8C8C8C"></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="60" bgcolor="#8C8C8C"></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="60" bgcolor="#8C8C8C"></td>	
	<td width="1" bgcolor="#8C8C8C"></td>
	
	<td width="10"></td>
	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="35" bgcolor="#8C8C8C"></td>
	<td width="35" bgcolor="#8C8C8C"></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	
	<td width="10"></td>
	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="60" bgcolor="#8C8C8C"></td>	
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="60" bgcolor="#8C8C8C"></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	<td width="80" bgcolor="#8C8C8C"></td>
	<td width="1" bgcolor="#8C8C8C"></td>
	
	<td width="10"></td>
	</tr>
	<!-- 끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝끝 -->
	
	</table>
</div> 

<form action="" method="post" name="approvalForm">

<input type="hidden" name="depth1" value="${LoginDTO.id }">

<table width="100%" cellspacing="0" cellpadding="0">
<tr style="height:1px;" bgcolor="#8C8C8C"><td colspan="3"></td></tr> <!-- 라인 -->
<tr height="45"><td bgcolor="#8C8C8C" width="1"></td><td bgcolor="#EAEAEA">
<font style="font-size: 16pt"> ${Adto.approvalFormType} - ${Adto.approvalFormName}</font>
<input type="hidden" name="type" value="${Adto.approvalFormType}">
</td>
<td bgcolor="#8C8C8C" width="1"></td></tr>
<tr style="height:1px;" bgcolor="#8C8C8C"><td colspan="3"></td></tr> <!-- 라인 -->
<tr height="40"><td align="right" colspan="3" >
<input type="button" value="결재선" class="approvalLineModal" style="width: 70px; height: 30px; font-size: 11pt; font-family: 고딕; " />
</td></tr>
<tr style="height:1px;" bgcolor="#8C8C8C"><td colspan="3"></td></tr> <!-- 라인 -->
<tr height="70"><td colspan="3" align="center"><font style="font-size: 15pt; font-weight: bolder;">${Adto.approvalFormName}</font></td></tr> 
</table>

<table border="0" cellspacing="0" align="right"> 

  <div id="approvalLineOK" align="right">

  </div>

  <table id="Approval2" class="" align="right" cellspacing="0" cellpadding="0">
  <tr><td width="110" height="1" bgcolor="#BDBDBD"></td><td width="1" height="1" bgcolor="#BDBDBD"></td></tr>
  <tr><td width="110" height="28" bgcolor="#EAEAEA" align="center"><font style="font-size: 10pt; font-weight: bold;">기안</font></td><td width="1" height="" bgcolor="#BDBDBD"></td></tr>
  
  <tr><td width="110" height="1" bgcolor="#BDBDBD"></td><td width="1" height="1" bgcolor="#BDBDBD"></td></tr>
  <tr><td width="110" height="28" align="center"><font style="font-size: 9pt;">${LoginDTO.name }</font></td><td width="1" height="" bgcolor="#BDBDBD"></td></tr>
  
  <tr><td width="110" height="1" bgcolor="#BDBDBD"></td><td width="1" height="1" bgcolor="#BDBDBD"></td></tr>
  <tr><td width="110" height="28" align="center"></td><td width="1" height="" bgcolor="#BDBDBD"></td></tr>
  
  <tr><td width="110" height="1" bgcolor="#BDBDBD"></td><td width="1" height="1" bgcolor="#BDBDBD"></td></tr>
  <tr><td width="110" height="28" align="center"></td><td width="1" height="" bgcolor="#BDBDBD"></td></tr>
  
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
<td height="30" bgcolor="#E4F7BA" align="center"><input name="subject" type="text" style="width: 90%; height: 40"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
</tr> 

<tr style="height:1px;" bgcolor="#8C8C8C"><td colspan="3"></td></tr> <!-- 라인 -->

<tr><td colspan="3">
                        
    <textarea name="contentArea" id="editor1" rows="10" cols="80">
    
    	${Adto.approvalFormContent}
    
	</textarea>        
                        
	<script>		
		CKEDITOR.replace( 
		'editor1',{
			toolbar :
				[
					[ 'Source', '-', 'Save', 'NewPage', 'Preview', 'Print', '-', 'Templates' ] ,
					[ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt' ] ,
					[ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] ,
					[ 'Link', 'Unlink', 'Anchor' ] ,
					[ 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe' ] ,
					'/',
					[ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language' ], 
					[ 'Styles', 'Format', 'Font', 'FontSize' ] ,
				],     	
			filebrowserImageUploadUrl : 'fileupload.jsp?type=Images',   //파일업로드시 사용
			width : '100%',       //---넓이값
			height : '500'        //---높이값
			}
		);    
	</script>          
          
</td></tr>

<tr height="60"><td colspan="4" align="center">
<input type="button" style="width: 100px; height: 30px; font-size: 10pt; font-family: 고딕;" name="approvalUpLoad" value="결재상신" onclick="sendIt();"/></td></tr>
<!-- <button type="button" style="width: 100px; height: 30px; font-size: 10pt; font-family: 고딕; " class="okbtn" onclick="sendIt();">등록하기</button> -->
</table>
</form>

</body>
</html>