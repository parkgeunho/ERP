<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%        
	
	String cp = request.getContextPath();

%>
<script>


$("input[name=writeck]").click(function(){
	alert("오긴오지?");
	dtd = $("input:radio[name=writeck]:checked").val();
	alert(dtd);
	
	var url = "<%=cp%>/boardSideUpdate";
	$.post(url,{num:num,ckNum:ck,change:dtd},function(args){
		trim()
	});
	

});



</script>

<div style="height: 30px; width: 350px; border-bottom: 1px solid; border-top: 1px;">
	수정	
</div>
<div>
	<c:if test="${ck==null }">
	안되
		<input type="radio"  value="non" checked="checked" name="writeck">
		<input type="radio"  value="write" name="writeck">
	</c:if>
	
	<c:if test="${ck!=null }">
	되
		<input type="radio"  value="write" checked="checked" name="writeck">
		<input type="radio"  value="non" name="writeck">
	</c:if>
</div>
