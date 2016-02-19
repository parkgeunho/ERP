<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String cp = request.getContextPath();
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="/erp/resources/insa/jquery.session.js"></script>
<script src="/erp/resources/insa/jquery.mCustomScrollbar.concat.min.js"></script>
<link rel="stylesheet" type="text/css" href="/erp/resources/ManagementView.css">
<link rel="stylesheet" type="text/css" href="/erp/resources/jquery.mCustomScrollbar.css">

<title>Insert title here</title>

<script>
$(document).ready(function() {
	//스크롤바 변경
	  $(".content").mCustomScrollbar();
	
	//하위 접고 열기 +  이미지 변경
	  $('[id^="dep-"]').click(function(){
			
		     var src = ($(this).attr('src')==='/erp/resources/image/minus.png') ?'/erp/resources/image/plus.png':'/erp/resources/image/minus.png';
		     $(this).attr('src',src);
		 
			
				var obj = $('.'+ this.id);
				
				if(obj.css('display')=='none')
					obj.show();
				else
					obj.hide();
				
				
			});
	  	  
	//클릭한 div에 대한 색상 변경
	var dds = $('[id^="edit-"]');

 	$('[id^="edit-"]').click(function(){
 		
 		for(var i=1;i<dds.length+1;i++){
 			
 			
 			var v = "edit-"+i;
 			if(v==this.id){
 				
 				document.getElementById(this.id).style.backgroundColor = "#E8D9FF";
 				
 			}else{
 				
 				document.getElementById(v).style.backgroundColor = "#FFFFFF";
 			}
 			
 		} 		
 		
 		/* document.getElementById(this.id).style.backgroundColor = "#E8D9FF"; */
 		//클릭한 것을 세션에 넣어줌
/* 		var obj = $('.num'+this.id).val();
		$.session.set("num",obj); */
				
	});
	 
	
	//클릭을 했을 시 인풋 박스로 변경 시킨다.
	$('[id^="edit-"]').dblclick(function(){
		
		var obj = $('.'+ this.id).val();
		
		
		 
		var av = document.getElementById(this.id).innerText;
		 document.getElementById(this.id).innerHTML= "<input type='text' value="+av+" name="+obj+ ">"; 
	
	});

});
</script>


<script language="JavaScript" type="text/javascript">
 
	var count1 = 0;
	var count2 = 0;
	var count3 = 0;

	//선택된 옵션을 삭제한다.

	function removeOptionSelected(){
		
		var elSel = document.getElementById('selectX');
		var i;
		
		for (i = elSel.length - 1; i>=0; i--) {
			if (elSel.options[i].selected) {
				elSel.remove(i);
			}
		}
	}
 

	//마지막에 새로운 option을 추가한다.
	function appendOptionLast(num){
		  
		var elOptNew = document.createElement('option');
		elOptNew.text = 'Append' + num;
		elOptNew.value = 'append' + num;
		  
		var elSel = document.getElementById('selectX');
	    
		try {
			elSel.add(elOptNew, null); // standards compliant; doesn't work in IE
		}catch(ex) {
			elSel.add(elOptNew); // IE only
		}
	  
	}
 
 
	function menuMove(id,mode) {
	 
		var obj = document.getElementById(id);
		var idx = obj.selectedIndex;
	
		if (idx < 0) 
			idx = obj.selectedIndex = 0;
	
		var opt = obj.options[obj.selectedIndex];
	
		switch (mode) {
			case 'first':
			obj.insertBefore(opt, obj.options[0]);
			break;
			case 'last':
			obj.appendChild(opt);
			break;
			case 'up':
			if (idx > 0) 
				obj.insertBefore(opt, obj.options[idx-1]);
			break;
			case 'down':
			if (idx < obj.options.length-1) 
				obj.insertBefore(obj.options[idx+1], opt);
			break;
			case 'move':
				
			break;
		}
	}
	
	function move(num) {
		
		var elSel = document.getElementById('selectX');
		var i;
		
		for (i = elSel.length - 1; i>=0; i--) {
			if (elSel.options[i].selected) {
				elSel.remove(i);
			}
		}		
		
		var elOptNew = document.createElement('option');
		elOptNew.text = 'Append' + num;
		elOptNew.value = 'append' + num;
		  
		var elSel = document.getElementById('select2');
	    
		try {
			elSel.add(elOptNew, null); // standards compliant; doesn't work in IE
		}catch(ex) {
			elSel.add(elOptNew); // IE only
		}		
		
	}
</script>



</head>
<body>

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
<td width="25" align="center"><input type="checkbox"></td>
<td width="1" bgcolor="#8C8C8C"></td>
<td width="80" bgcolor="" align="center">
<font style="font-size: 9pt;">이름</font></td>	
<td width="1" bgcolor="#8C8C8C"></td>
<td width="80" bgcolor="" align="center">
<font style="font-size: 9pt;">직위</font></td>	
<td width="1" bgcolor="#8C8C8C"></td>

<td width="10"></td>

<td width="1" bgcolor="#8C8C8C"></td>
<td width="35" bgcolor="">이</td>
<td width="35" bgcolor="">히</td>
<td width="1" bgcolor="#8C8C8C"></td>

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
<!-- 44444444444444444444444444444 -->

<!-- 55555555555555555555555555555 -->
<tr height="">

<td width="10"></td>

<td width="1" bgcolor="#8C8C8C"></td>
<td width="4" bgcolor=""></td>
<td width="100" bgcolor="" colspan="2"></td>
<td width="4" bgcolor=""></td>
<td width="1" bgcolor="#8C8C8C"></td>


<td width="10"></td>

<td width="1" bgcolor=""></td>
<td width="15" bgcolor=""></td>
<td width="1" bgcolor=""></td>
<td width="60" bgcolor=""></td>
<td width="1" bgcolor=""></td>
<td width="60" bgcolor=""></td>	
<td width="1" bgcolor=""></td>

<td width="10"></td>

<td width="1" bgcolor=""></td>
<td width="35" bgcolor=""></td>
<td width="35" bgcolor=""></td>
<td width="1" bgcolor=""></td>

<td width="10"></td>

<td width="1" bgcolor=""></td>
<td bgcolor="" colspan="5">
<select id="selectX" multiple="multiple" style="width: 200px; height: 350px">
	<option value="original1" selected="selected">Orig1</option>
</select>
</td>	
<td width="1" bgcolor=""></td>

<td width="10"></td>
</tr>
<!-- 55555555555555555555555555555 -->



</table>

</body>
</html>