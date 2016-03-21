<%@page import="java.util.StringTokenizer"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	String start = request.getParameter("start");
	String end = request.getParameter("end");
	
	String stY, stM, stD, stH, stMin;
	String endY, endM, endD, endH, endMin;
	
	StringTokenizer st = new StringTokenizer(start,".");
	stY = st.nextToken();
	stM = st.nextToken();
	stD = st.nextToken();
	stH = st.nextToken();
	stMin = st.nextToken();
	
	st = new StringTokenizer(end,".");
	endY = st.nextToken();
	endM = st.nextToken();
	endD = st.nextToken();
	endH = st.nextToken();
	endMin = st.nextToken();
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
<link rel="stylesheet" href="/erp/resources/script/jquery-ui-1.11.4.custom/jquery-ui.css" type="text/css">
<script src="/erp/resources/schedule/jquery-2.2.0.js"></script>
<script src="/erp/resources/schedule/jquery-1.12.2.min.js"></script>
<script src="/erp/resources/script/jquery-ui-1.11.4.custom/jquery-ui.js"></script>

<script type="text/javascript">

	function sel() {
		
		var f = document.myform;
	
		var sStH = f.stH;
		for (i=0; i<24; i++){
			
			if(i<10)
				sStH[i] = new Option("0"+i);
			else
				sStH[i] = new Option(i);
		}
		for (i=0; i<24; i++){
			
			if (sStH[i].value == <%= stH%>)
				sStH[i].selected = true; 
		}	
	
		var sStMin = f.stMin;
		for (i=0; i<60; i++){
			
			if(i<10)
				sStMin[i] = new Option("0"+i);
			else
				sStMin[i] = new Option(i);
		}
		for (i=0; i<60; i++){
			
			if (sStMin[i].value == <%= stMin%>)
				sStMin[i].selected = true; 
		}	
	
		var sEndH = f.endH;
		for (i=0; i<24; i++){
			
			if(i<10)
				sEndH[i] = new Option("0"+i);
			else
				sEndH[i] = new Option(i);
		}
		for (i=0; i<24; i++){
			
			if (sEndH[i].value == <%= endH%>)
				sEndH[i].selected = true; 
		}	
	
		var sEndMin = f.endMin;
		for (i=0; i<60; i++){
			
			if(i<10)
				sEndMin[i] = new Option("0"+i);
			else
				sEndMin[i] = new Option(i);
		}
		for (i=0; i<60; i++){
			
			if (sEndMin[i].value == <%= endMin%>)
				sEndMin[i].selected = true; 
		}
	};

	$("#calendar").datepicker({
		
		changeMonth: true,
		changeYear: true,
		showOn: 'button',
		buttonImageOnly: true
	});
	
	$('img.ui-datepicker-trigger').css({'cursor':'pointer','margin-left':'5px', 'margin-top':'3px'});
	
	$.datepicker.setDefaults({dateFormat:'YYYY-mm-dd'});

</script>

<script>

	$(function() {
		  
	    var dialog, form,
	    	name = $( "#name" ),
	    	email = $( "#email" ),
	    	password = $( "#password" ),
	    	allFields = $( [] ).add( name ).add( email ).add( password ),
	    	tips = $( ".validateTips" );
			
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
		        /* allFields.removeClass( "ui-state-error" ); */        
		      }		      
		 });		
		 
		 $( "#approvalLineModal" ).button().on( "click", function() {
				dialog.dialog( "open" );
		 });
		 
		 function approvalLineOK (){

				var valid = true;
				 
			      if ( valid ) {
			        $( "#approvalLineOK" ).append( 
			     		     
			         "<table align=\"right\" cellspacing=\"0\" cellpadding=\"0\">"+
			         "<tr><td width=\"110\" height=\"1\" bgcolor=\"#BDBDBD\"></td><td width=\"1\" height=\"1\" bgcolor=\"#BDBDBD\"></td></tr>"+
			         "<tr><td width=\"110\" height=\"28\" bgcolor=\"#EAEAEA\" align=\"center\"><font style=\"font-size: 10pt; font-weight: bold;\">기안자</font></td><td width=\"1\" height=\"\" bgcolor=\"#BDBDBD\"></td></tr>"+
			         "<tr><td width=\"110\" height=\"1\" bgcolor=\"#BDBDBD\"></td><td width=\"1\" height=\"1\" bgcolor=\"#BDBDBD\"></td></tr>"+
			         "<tr><td width=\"110\" height=\"28\" align=\"center\"><font style=\"font-size: 9pt;\">session.userName</font></td><td width=\"1\" height=\"\" bgcolor=\"#BDBDBD\"></td></tr>"+
			         "<tr><td width=\"110\" height=\"1\" bgcolor=\"#BDBDBD\"></td><td width=\"1\" height=\"1\" bgcolor=\"#BDBDBD\"></td></tr>"+
			         "<tr><td width=\"110\" height=\"28\" align=\"center\"></td><td width=\"1\" height=\"\" bgcolor=\"#BDBDBD\"></td></tr>"+			         
			         "<tr><td width=\"110\" height=\"1\" bgcolor=\"#BDBDBD\"></td><td width=\"1\" height=\"1\" bgcolor=\"#BDBDBD\"></td></tr>"+
			         "<tr><td width=\"110\" height=\"28\" align=\"center\"></td><td width=\"1\" height=\"\" bgcolor=\"#BDBDBD\"></td></tr>"+
			         "<tr><td width=\"110\" height=\"1\" bgcolor=\"#BDBDBD\"></td><td width=\"1\" height=\"1\" bgcolor=\"#BDBDBD\"></td></tr>"+
			         "</table>"
			        
			        );
			        dialog.dialog( "close" );
			      }
			      
			return valid;	
		}
		 
		form = dialog.find( "form" ).on( "submit", function( event ) {
			 event.preventDefault();
			 approvalLineOK();
		});
		
		
		function approvalLineTest (){
		
			if ($('.member').is(":checked")){
				
				
				
				
				
				
			}		
			
			dialog.dialog( "close" );
		}
		
	
	});
	
</script>


<script type="text/javascript">

$(document).ready(function(){
	
	
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
				alert("에러");
			},
			success: function(args){
				$("#approvalMemberList").html(args);                           
			}
		});			
	});
		
	$('.AppendLine').click( function(){
		
		var elSel = document.getElementById('selectX');
		
		alert(elSel.length()); 
		
		if (!$('.member').is(":checked")){
			alert("결재자를 선택 하십시오.")		
		}	

		var chk = document.getElementsByName("member[]"); // 체크박스객체를 담는다
		var len = chk.length;    //체크박스의 전체 개수
		var checkRow = '';      //체크된 체크박스의 value를 담기위한 변수
		var checkCnt = 0;        //체크된 체크박스의 개수
		var checkLast = '';      //체크된 체크박스 중 마지막 체크박스의 인덱스를 담기위한 변수
		var rowid = '';             //체크된 체크박스의 모든 value 값을 담는다
		var cnt = 0;             
		
		for(var i=0; i<len; i++){
			if(chk[i].checked == true){
				checkCnt++;        //체크된 체크박스의 개수
				checkLast = i;     //체크된 체크박스의 인덱스
			}
		} 
		
		for(var i=0; i<len; i++){
		
			if(chk[i].checked == true){  //체크가 되어있는 값 구분

				checkRow = chk[i].value;			            	

				if(checkCnt == 1){                            //체크된 체크박스의 개수가 한 개 일때,
					rowid += "'"+checkRow+"'";        //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
				}else{                                            //체크된 체크박스의 개수가 여러 개 일때,
					if(i == checkLast){                     //체크된 체크박스 중 마지막 체크박스일 때,
						rowid += "'"+checkRow+"'";  //'value'의 형태 (뒤에 ,(콤마)가 붙지않게)
					}else{
						rowid += "'"+checkRow+"',";	 //'value',의 형태 (뒤에 ,(콤마)가 붙게)         			
					}
				}
			cnt++;
			checkRow = '';    //checkRow초기화.
			}
		}
						
		for(var k=0; k < checkCnt; k++){
						
			
			$( "#selectX" ).append(				
							
				 "<option value=\"original\" selected=\"selected\" >"+
				"앙 기뮤띠!@!!!!"+k+
				"</option>" 
			)	
		}	
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
			
			if(selectObj.index() == 0 ){ 
				return false;
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
    
    
});

</script>

<title></title>
</head>
<body onload="sel()">

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
						<a href="" style="text-decoration: none; color: black;">
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
	<input type="button" value="추가" class="AppendLine"/>
	
	
	</td>
	<td width="1" bgcolor=""></td>
	
	<td width="10"></td>
	
	<td width="1" bgcolor=""></td>
	<td bgcolor="" colspan="5" style="font-size: 10pt">
	<select id="selectX" multiple="multiple" style="width: 265px; height: 350px">
		<option value="original1">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;결재자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;직위&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;펀치상사&nbsp;&nbsp;&nbsp;&nbsp;
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

<table width="100%" cellspacing="0" cellpadding="0">
<tr style="height:1px;" bgcolor="#8C8C8C"><td colspan="3"></td></tr> <!-- 라인 -->
<tr height="45"><td bgcolor="#8C8C8C" width="1"></td><td bgcolor="#EAEAEA"><font style="font-size: 16pt; 
	font-style: 나눔고딕코딩;font-weight: bolder;">&nbsp;&nbsp;일정관리</font></td><td bgcolor="#8C8C8C" width="1"></td></tr>
<tr style="height:1px;" bgcolor="#8C8C8C"><td colspan="3"></td></tr> <!-- 라인 -->
<tr height="40">
	<td align="right" colspan="3" >
		<font style="font-style: 나눔고딕코딩;"><input type="button" name="approvalSave" value="저장" />
		<input type="button" name="approvalClose" value="닫기"  /></font></td></tr> 
</table>

<form method="get" name="myform">
<table align="center" width="100%" cellpadding="0" cellspacing="0">
<tr>
	<td style="border-color:#E0E0E0; border-width: 1px; border-style: solid; border-bottom-width: 0" 
		width="150" height="30" bgcolor="#E4F7BA" align="center"> <font style="font-size: 11pt; 
		font-style: 나눔고딕코딩;font-weight: bolder;">제목</font></td>
	<td style="border-color:#E0E0E0; border-width: 1px; border-style: solid; border-left-width: 0; 
		border-bottom-width: 0" height="30" bgcolor="#E4F7BA">&nbsp;&nbsp;&nbsp;<input type="text" style="font-size:11pt; 
		border-color:#E0E0E0; border-width: 1px; border-style: solid; width: 70%; height: 18px;"/></td></tr> 
		
<tr>
	<td style="border-color:#E0E0E0; border-width: 1px; border-style: solid; border-bottom-width: 0" 
		width="150" height="30" bgcolor="#F6F6F6" align="center"> <font style="font-size: 11pt; 
		font-style: 나눔고딕코딩;font-weight: bolder;">일자</font></td>
	<td style="border-color:#E0E0E0; border-width: 1px; border-style: solid; border-left-width: 0; 
		border-bottom-width: 0" height="30">&nbsp;&nbsp;&nbsp;<input type="text" id="calendar" name="calendar"/></td></tr> 

<tr>
	<td style="border-color:#E0E0E0; border-width: 1px; border-style: solid; border-bottom-width: 0" 
		width="150" height="30" bgcolor="#F6F6F6" align="center"> <font style="font-size: 11pt; 
		font-style: 나눔고딕코딩;font-weight: bolder;">시간</font></td>
	<td style="border-color:#E0E0E0; border-width: 1px; border-style: solid; border-left-width: 0; 
		border-bottom-width: 0" height="30">&nbsp;&nbsp;
		<select name="stH" onchange="stH()"></select>&nbsp;:
		<select name="stMin" onchange="stMin()"></select>&nbsp;~
		<select name="endH" onchange="endH()"></select>&nbsp;:
		<select name="endMin" onchange="endMin()"></select></td></tr> 

<tr>
	<td colspan="3">
                        
    <textarea name="contentArea" id="editor1" rows="10" cols="80">
    
    	
    
	</textarea>        
                        
	<script>		
		CKEDITOR.replace( 
		'editor1',{
			toolbar : 'Standard',     	
			filebrowserImageUploadUrl : 'fileupload.jsp?type=Images',   //파일업로드시 사용
			width : '100%',       //---넓이값
			height : '500'        //---높이값
			}
		);    
	</script></td></tr>

<tr height="60">
	<td colspan="4" align="center">
		<input type="button" name="approvalUp" value="결재상신" 
		onclick="window.open('http://localhost:8080/erp/approvalCreated_ok')"/></td></tr>
</table>
</form>

</body>
</html>