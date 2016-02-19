<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%        
	
	String cp = request.getContextPath();

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
      "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Untitled Document</title>
<link rel="stylesheet" type="text/css" media="screen" />
<style type="text/css"></style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script>

$(document).ready(function() {
	
	var vs =""; //클래스명 받기
	$('[id^="edit"]').dblclick(function(){
		
		var av = document.getElementById(this.id).innerText;
		 document.getElementById(this.id).innerHTML="<input type='text' value=" + av+ ">"; 
	
	});
		
	
	
});
</script>
    </head>
    <body>
    
    
    
    
    <table>
    <tr>
    <td></td>
    <td></td>
    <td></td>
    </tr>
    <tr>
    <td>2</td>
    <td>2</td>
    <td>
    
    
    </td>
    </tr>
   
    </table>
    
    
    </body>
</html>