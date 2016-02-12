<%@ page contentType="text/html; charset=UTF-8"%>
<%
	String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<table width="100%" cellspacing="0">
<tr style="height:1px; ;" bgcolor="#8C8C8C"><td colspan="3"></td></tr>
<tr height="45"><td bgcolor="#8C8C8C" width="1"></td><td bgcolor="#EAEAEA"><font style="font-size: 16pt">결재 - ${dto.type}</font></td><td bgcolor="#8C8C8C" width="1"></td></tr>
<tr height="35" ><td align="right" colspan="3" >
<input type="button" name="approvalLine" value="결재선 지정" />
<input type="button" name="approvalSave" value="저장" />
<input type="button" name="approvalClose" value="닫기" />
</td></tr>
</table>


</body>
</html>