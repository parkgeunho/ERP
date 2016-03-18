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
<div>
	<div style="height: 50px; width: 350px; border-bottom: 1px solid; border-top: 1px;">
		수정	
	</div>
	<div style="height: 210px; width: 350px;">
	눌러진 값에 대한 정보를 출력 시킨다
	만약 부서라면 최상위부서까지 출력이 되며
	개인이라면 개인에 대한 부서 정보 사번이 나온다	
	</div>
	
	<div style="height: 210px; width: 350px; border-top: 1px solid;">
		
		<div style="float: left; width: 110px;">
			글쓰기 권한
		
		</div>
		
		<div style="float: left;width: 110px;">
			쓰기가능<br>
			<c:if test="${ck!=null }">
			<input type="radio"  value="write" checked="checked" name="writeck">
			</c:if>
			
			<c:if test="${ck==null }">
			<input type="radio"  value="write" name="writeck">
			</c:if>
		</div>
	
		<div style="float: left;width: 110px;">
		쓰기불가<br>
			<c:if test="${ck!=null }">
			<input type="radio"  value="non" name="writeck">
			</c:if>
			<c:if test="${ck==null }">
			<input type="radio"  value="non" checked="checked" name="writeck">
			</c:if>
		</div>
	

	
	</div>
</div>
