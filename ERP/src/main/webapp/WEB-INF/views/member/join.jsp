<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% String cp = request.getContextPath(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>인사카드 작성</title>
<link rel="stylesheet" type="text/css" href="/erp/resources/join.css">

<script type="text/javascript" src="/erp/resources/member/util.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>

<script type="text/javascript">

	$(document).ready(function(){
	
		$.ajax({

			url : "buseoChange",
			type : 'POST',

			success : function(args) {
				$("#buseo1").html(args);
			},
			error : function(e) {
				alert(e.responseText);
			}

			});

		
		
		
		
	});



	
	//아이디 중복검사 ajax
	function compareId(){
		
		$.ajax({
			
					url:"compareID",
					type:'POST',
					data : {compID : document.myForm.id.value},
					
					success: function(args){
						$("#result").html(args);
					},
					error:function(e){
		  				alert(e.responseText);
		
					}

		});

	}
	
	function change1(){
		
		
		var myForm = $('form').serialize();
			
		 
			$.ajax({
					
				url:"buseoChange",
				type:'POST',
				data: myForm,
				
				success: function(args){
					$("#buseo1").html(args);
				},
				error:function(e){
	  				alert(e.responseText);

				}
				
				
			});
			
			
		}
	
	
	
	



	
</script>

<script type="text/javascript">
	


	function sendIt(){
		
		f = document.myForm;

		thumbext = document.getElementById("file").value;
		

		thumbext = thumbext.slice(thumbext.indexOf(".") + 1).toLowerCase(); //파일 확장자를 잘라내고, 비교를 위해 소문자로 만듭니다.

		if(thumbext != "jpg" && thumbext != "png" &&  thumbext != "gif" &&  thumbext != "bmp" && thumbext != "jpeg"){ //확장자를 확인합니다.

			alert('썸네일은 이미지 파일(jpg, jpeg, png, gif, bmp)만 등록 가능합니다.');

			return;

		}
		
			
			
		str = f.name.value;
    	str = str.trim();
        if(!str) {
            alert("\n이름을 입력하세요. ");
            f.name.focus();
            return;
        }
        f.name.value = str;
        
        
        if(!isValidJumin(f.jumin.value)) {
            alert("\n정상적인 주민등록번호를 입력하세요. ");
            f.jumin.focus();
            return;
        }
        
        
        str = f.mPhone.value;
    	str = str.trim();
        if(!str) {
            alert("\n휴대전화를 입력하세요. ");
            f.mPhone.focus();
            return;
        }
        f.mPhone.value = str;
        
        
        if(f.email.value) {
	    	if(!isValidEmail(f.email.value)) {
                alert("\n정상적인 E-Mail을 입력하세요. ");
                f.email.focus();
                return;
	    	}
        }
        
        str = f.id.value;
    	str = str.trim();
        if(!str) {
            alert("\n아이디를 입력하세요. ");
            f.id.focus();
            return;
        }
        f.id.value = str;
        
        str = f.pwd.value;
    	str = str.trim();
        if(!str) {
            alert("\비밀번호를 입력하세요. ");
            f.pwd.focus();
            return;
        }
        f.pwd.value = str;
        
        str = f.grade.value;
    	str = str.trim();
        if(!str) {
            alert("\직급을 선택 하세요. ");
            f.grade.focus();
            return;
        }
        f.grade.value = str;
        
        str = f.secure.value;
        str = str.trim();
        if(str<1 || str>3){
        	alert("등급은 1~3에서 선택 하세요.")
        	f.grade.focus();
        	return;
        	}
       
        
        str = f.depth1.value;
        str = str.trim();
        if(str=='no'){
        	alert("부서를 필수로 선택하세요")
        	return;
        	}
        
        
        str = f.file.value;
    	str = str.trim();
        if(!str) {
            alert("사진을 업로드 하세요. ");
            f.file.focus();
            return;
        }
        f.file.value = str;
        
        var check = $("#check").text();
		
		if(check=="사용불가 아이디"){
			alert("사용 불가능한 아이디 입니다.")
			return;
		}
		
		alert("정상적으로 등록이 완료되었습니다.");

		f.action = "<%=cp%>/created_ok.action";
		f.submit();
				
	}
	
	





</script>

</head>
<body>

<form action="" method="post" name="myForm" enctype="multipart/form-data">
<center>
<table border="0" align="center" width="1000" style="margin-top: 50px;" cellpadding="0" cellspacing="0">
	
<tr><td height="2" width="1000" style="background-color: #bbbbbb;"></td></tr>

	<tr>
		<td align="center" style="font-size: 30pt; font-family: 고딕; font-weight: bold;">인사카드 작성</td>
	</tr>
	
<tr><td height="2" width="1100" style="background-color: #bbbbbb;"></td></tr>


</table>

<table border="0" width="1000"align="center" style="margin-top: 20px; margin-bottom: 0px;" cellpadding="0" cellspacing="0">
	<tr height="40">
		<td width="200" align="center" style="font-size: 14pt;font-weight: bold;">사 진 업로드 : </td>
		<td width="300" colspan="3"><input type="file"  id="file" name="file" style="height: 30px; font-size: 12pt; font-family: 고딕; width: 400px; font-weight: bold;  border: none;"></td>
		<td width="500" align="right" colspan="2">
		<button type="button" style="width: 100px; height: 30px; font-size: 10pt; font-family: 고딕; " class="okbtn" onclick="sendIt();">등록하기</button>
		<button type="button" style="width: 70px; height: 30px; font-size: 10pt; font-family: 고딕;" class="okbtn" onclick="javascript:location.href='<%=cp%>/insa.action';">취소</button>
		</td>
</table>


<table border="0" width="1000" style="margin: 0px;">
	<tr>
	<td height="40" style=""><div id="result"></div></td>
	</tr>
</table>
<table border="0" align="center" style="margin:0px ; border-radius : 10px;" cellpadding="0">
	<tr height="40">
		<td width="100" class="color" align="center">이 름</td>
		<td width="400" colspan="3" align="center"><input type="text" class="dap_text_box" id="usr" name="name" placeholder="ex) 홍 길 동" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 95%;"></td>
		<td width="100" class="color" align="center">주민번호</td>
		<td width="400" colspan="3" align="center"><input type="text" class="dap_text_box" id="usr" name="jumin" placeholder="ex) 123456-1234567" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 400px;"></td>
	</tr>
	<tr height="40">
		<td width="100" class="color" align="center">주 소</td>
		<td width="400" colspan="3" align="center"><input type="text" class="dap_text_box" id="usr" name="addr" placeholder="ex) 서울시 강남구 역삼동 ... " style="height: 35px; font-size: 15pt; font-family: 고딕; width: 95%;"></td>
		<td width="100" class="color" align="center">보안등급</td>
		<td width="400" colspan="3" align="center"><input type="text" class="dap_text_box" id="usr" name="secure" placeholder="ex) 1 ~ 3" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 400px;"></td>
	</tr>
	<tr height="40">
		<td width="100" class="color" align="center">사내번호</td>
		<td width="400" colspan="3" align="center"><input type="text" class="dap_text_box" id="usr" name="oPhone" placeholder="ex) 070-1234-5678" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 95%;"></td>
		<td width="100" class="color" align="center">휴대전화</td>
		<td width="400" colspan="3" align="center"><input type="text" class="dap_text_box" id="usr" name="mPhone" placeholder="ex) 010-1234-5678" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 400px;"></td>
	</tr>
	<tr height="40">
		<td width="100" class="color" align="center">부 서</td>
		<td width="400" colspan="3" align="center">

		
		<div id="buseo1"></div>
		
		</td>
		<td width="100" class="color" align="center">E-Mail</td>
		<td width="400" colspan="3" align="center"><input type="text" class="dap_text_box" id="usr" name="email" value="babonim@punch.com" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 400px;"></td>
	</tr>
	<tr height="40">
		<td width="100" class="color" align="center">아이디</td>
		<td width="150" ><input type="text" class="dap_text_box" id="usr" name="id" placeholder="ex) kim123" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 150px;" onkeyup="compareId();"></td>
		<td width="100" class="color" align="center">비밀번호</td>
		<td width="150" ><input type="text" class="dap_text_box" id="usr" name="pwd" placeholder="ex) 1234" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 90%;"></td>
		<td width="100" class="color" align="center">직 급</td>
		<td width="150">
		<select name="grade" class="dap_text_box" id="usr" style="height: 35px; font-family: 고딕; width: 99%;">
   			<option value="">선택</option>
    		<option value="사원">사원</option>
    		<option value="대리">대리</option>
    		<option value="과장">과장</option>
    		<option value="차장">차장</option>
    		<option value="실장">실장</option>
    		<option value="부장">부장</option>
    		<option value="부사장">부사장</option>
    		<option value="사장">사장</option>
		</select>
		</td>
		<td width="100" class="color" align="center">직 책</td>
		<td width="130"><input type="text" class="dap_text_box" id="usr" name="duty" placeholder="ex) 팀장" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 135px;"></td>
	</tr>
	<tr height="40">
		<td width="100" class="color" align="center">혈액형</td>
		<td width="150" >
		<select name="blood" class="dap_text_box" id="usr" style="height: 35px; font-family: 고딕; width: 150px;">
   			<option value="">선택</option>
    		<option value="A">A</option>
    		<option value="B">B</option>
    		<option value="O">O</option>
    		<option value="AB">AB</option>
		</select>
		</td>
		<td width="100" class="color" align="center">종 교</td>
		<td width="150" ><input type="text" class="dap_text_box" id="usr" name="reli" placeholder="ex) 기독교" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 90%;"></td>
		<td width="100" class="color" align="center">취 미</td>
		<td width="150" ><input type="text" class="dap_text_box" id="usr" name="hobby" placeholder="ex) 농구" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 150px;"></td>
		<td width="100" class="color" align="center">근 태</td>
		<td width="130" ><input type="text" class="dap_text_box" id="usr" name="dal" placeholder="ex) 휴가" style="height: 35px; font-size: 15pt; font-family: 고딕; width: 135px;"></td>
	</tr>
	<tr height="40">
		<td width="100" class="color" align="center">메 모</td>
		<td width="400" colspan="8" ><textarea class="dap_text_box" id="usr" name="memo" placeholder="ex) 특이사항" style="height: 200px; font-size: 15pt; font-family: 고딕; width: 99%;"></textarea></td>
	</tr>
	
	
</table>










</center>
</form>


</body>
</html>