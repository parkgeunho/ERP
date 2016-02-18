<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="/erp/resources/script/editor/ckeditor/ckeditor.js"></script>


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

<form>

 
<select id="selectX" size="30">
	<option value="original1" selected="selected">Orig1</option>
</select>
<br/>
 
<select id="select2" size="20">
	<option value="op1" selected="selected">op1...........</option>
</select>
 
</form>

<div>
	<a href="javascript:menuMove('selectX','first')" >처음</a> |
	<a href="javascript:menuMove('selectX','up')" >위로</a> |
	<a href="javascript:menuMove('selectX','down')" >아래로</a> |
	<a href="javascript:menuMove('selectX','last')" >마지막</a> |
	<input type="button" value="삭제" onclick="removeOptionSelected();" />
	<input type="button" value="추가" onclick="appendOptionLast(count2++);" />
	<input type="button" value="이동" onclick="move(count3++);" />
</div>






</body>
</html>


<!-- <a href="javascript:'" onclick="window.open('http://localhost:8080/erp/approvalCreated','','width=800,height=900');">결재 상신</a>
<input type="button" onclick="window.open('http://localhost:8080/erp/approvalCreated')"> -->

