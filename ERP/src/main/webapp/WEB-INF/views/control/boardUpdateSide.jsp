<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%        
	
	String cp = request.getContextPath();

%>
<script>


$("input[name=writeck]").click(function(){
	
	dtd = $("input:radio[name=writeck]:checked").val();
	
	
	var url = "<%=cp%>/boardSideUpdate";
	$.post(url,{num:num,ckNum:ck,change:dtd},function(args){
		trim()
	});
	

});



</script>
<div>
	<div style="height: 50px; width: 350px; border-bottom: 1px solid; border-top: 1px;line-height: 50px;" align="center">
		<label style="font: bolder; font-size: 20px;">정 보</label>
	</div>
	<div style="height: 210px; width: 350px;">
		<c:if test="${sort=='Bus' }">	
			<div style="height: 105px;">
				<div style="float: left; width: 100px;">부서</div>
				<div style="float: left;">
					<Div>${lastDepth1 }</div>
					<Div>${lastDepth2 }</div>
				</div>
			</div>
			
			<Div style="height: 105px;line-height: 105px;">
				<div style="float: left; width: 100px;">인원수</div>
				<Div style="float: left;">${count }명</Div>
			</Div>
		</c:if>
		
		<c:if test="${sort=='Mem' }">	
			<div style="height: 70px;">
				<div style="float: left; width: 100px;">부서</div>
				<div style="float: left;">
					<Div>${mDTO.depth1 }${mDTO.depth2 }</div>
					<Div>${mDTO.depth3 }${mDTO.depth4 }${mDTO.depth5 }</div>
				</div>
			</div>
			
			<Div style="height: 140px;">
				<Div style="height: 70px;">
					<div style="float: left; width: 100px;">사원번호</div>
					<Div style="float: left;">${mDTO.usernum }</Div>
				</Div>
			
				<div style="height: 70px;">
					<div style="float: left; width: 100px;">사내번호</div>
					<Div style="float: left;">${mDTO.oPhone }</Div>
				</Div>
			</Div>
		</c:if>
	</div>
	
	<div style="height: 210px; width: 350px; border-top: 1px solid;">
		
		<div style="height: 210px; width: 350px; border-top: 1px solid;" >
			
			<div style="height: 50px; width: 350px; border-bottom: 1px solid;  line-height: 50px;" align="center">
				<label style="font: bolder; font-size: 20px;">권한 수정</label> 	
			</div>
			
			
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
</div>
