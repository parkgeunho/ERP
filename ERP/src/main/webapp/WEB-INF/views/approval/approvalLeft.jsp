<%@ page import="java.util.Calendar"%>
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

<link rel="stylesheet" href="/erp/resources/schedule/list.css" type="text/css"/>

	<style type="text/css">
		
		body{
			font-size: 12pt;
		
		}
		td{
			font-size: 12pt;
		}
	
	</style>
 
<script type="text/javascript">

	$(document).ready(function(){
		
		$('[id^="fold-"]').click(function(){
			
			var src = ($(this).attr('src')=='/erp/resources/schedule/image/minus.png') ?'/erp/resources/schedule/image/plus.png':'/erp/resources/schedule/image/minus.png';
		     $(this).attr('src',src);
			
			var obj = $('.'+ this.id);
			
			if(obj.css('display')=='none')
				obj.show();
			else
				obj.hide();
		});
	});

</script>

</head>

<body onload="sel()">

<span id="leftCal" style="display: none;"></span>

	<div>
		<dl>
			
			<dd><img id="fold-1" src="/erp/resources/schedule/image/minus.png"/>&nbsp;진행중</dd>
			
				<dd class="fold-1">&nbsp;&nbsp;&nbsp;<img src="/erp/resources/schedule/image/re.gif"/>
				&nbsp;<a style="text-decoration: none;" onmouseover="this.style.textDecoration='underline';" 
				onmouseout="this.style.textDecoration='none';" href="calendar2"><font color="black">상신한문서</font></a></dd>
				<dd class="fold-1">&nbsp;&nbsp;&nbsp;<img src="/erp/resources/schedule/image/re.gif"/>
				&nbsp;<a style="text-decoration: none;" onmouseover="this.style.textDecoration='underline';" 
				onmouseout="this.style.textDecoration='none';" href="calendar2"><font color="black">결재할문서</font></a></dd>
							
			<dd><img id="fold-1" src="/erp/resources/schedule/image/minus.png"/>&nbsp;완료</dd>
			
				<dd class="fold-1">&nbsp;&nbsp;&nbsp;<img src="/erp/resources/schedule/image/re.gif"/>
				&nbsp;<a style="text-decoration: none;" onmouseover="this.style.textDecoration='underline';" 
				onmouseout="this.style.textDecoration='none';" href="calendar2"><font color="black">상신한문서</font></a></dd>
				<dd class="fold-1">&nbsp;&nbsp;&nbsp;<img src="/erp/resources/schedule/image/re.gif"/>
				&nbsp;<a style="text-decoration: none;" onmouseover="this.style.textDecoration='underline';" 
				onmouseout="this.style.textDecoration='none';" href="calendar2"><font color="black">결재할문서</font></a></dd>
				<dd class="fold-1">&nbsp;&nbsp;&nbsp;<img src="/erp/resources/schedule/image/re.gif"/>
				&nbsp;<a style="text-decoration: none;" onmouseover="this.style.textDecoration='underline';" 
				onmouseout="this.style.textDecoration='none';" href="calendar2"><font color="black">반려문서${haha }</font></a></dd>
				
		</dl>
	</div>	

</body>
</html>



<%-- 
<div style="width: 270px;">
   <div class="buseo" >
   관리항목
   </div>
   <div>
      <ul>
         <li><label onclick="javascript:location.href='<%=cp%>/insa'">부서관리</label>
      
            <ul>
               <li>
               <label onclick="javascript:buseoManagement()">부서 생성/삭제</label></li>
               
               <li>
               <label onclick="javascript:location.href='<%=cp%>/join.action';">사원등록</label></li>   
            </ul>

         </li>
         
         <li><label onClick="window.open('http://localhost:8080/erp/approvalFormCreated','결재 양식 생성','width=900, height=1200, toolbar=no, menubar=no, scrollbars=yes, resizable=yes');return false;">양식추가</label></li>
         <li>
         <label onclick="javascript:location.href='<%=cp%>/con'">게시판관리</label>
         
         </li>
      
      </ul>
   
   </div>

</div> --%>