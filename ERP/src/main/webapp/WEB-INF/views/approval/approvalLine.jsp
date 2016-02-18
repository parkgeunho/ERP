<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

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
<td width="35" bgcolor=""></td>
<td width="35" bgcolor=""></td>
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
<td width="100" bgcolor="" colspan="2">
<select id="selectX" multiple="multiple" style="width: 200px; height: 350px">
	<option value="original1" selected="selected">Orig1</option>
</select>
<br/>
</td>
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