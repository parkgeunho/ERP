<%@ page contentType="text/html; charset=UTF-8"%>
<%        
	
	String cp = request.getContextPath();

%>
<div style="width: 740px;margin-left: 30px; padding-top: 10px;">
					<div >게시판설정<br>
					게시판에 대한 정보 및 수정을 할 수 있습니다.<br>
					공지게시판으로 사용하시려면 글쓰기 권한을 관리자 이상으로 지정하세요.<br>
					</div>
					<div style="border-bottom: 1px solid;height: 30px;"></div>
					<div style="float: left; width: 200px; padding-top: 10px; ">
					
						<div style="height: 35px; border-bottom: 1px solid;" >게시판명</div>
					
					</div>
					
					
					<div style="float: left; padding-top: 10px; width: 540px;">
						<div style="height: 35px; border-bottom: 1px solid;"><input type="text" id="boardName" value="${boardData.boardName }">
						<input type="hidden" name="listNum" value="${boardData.listNum }">
						</div>
					
					</div>
					
						<DIV style="float: left; background-color: yellow; width:350px; height: 470px; margin-top: 10px;">
							<div style="height: 30px; width: 350px; border-bottom: 1px solid; border-top: 1px; solid;">
							권한
							</div>
							<div>
							권한받은사람들 출력
							</div>
						</div>
						
						<DIV style="float: left; background-color: aqua; width:350px;height: 470px; margin-top: 10px; margin-left: 40px;">
							<div style="height: 30px; width: 350px; border-bottom: 1px solid; border-top: 1px; solid;">
							수정
							</div>
							<div>
							권한 수정 하는
							</div> 
						</div>
					
					
				</div>