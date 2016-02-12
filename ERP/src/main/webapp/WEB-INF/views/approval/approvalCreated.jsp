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
</head>
<body>

<table width="100%" cellspacing="0">
<tr height="1" bgcolor="#8C8C8C"><td bgcolor="#8C8C8C" width="1px"></td><td></td><td bgcolor="#8C8C8C"></td></tr>
<tr height="30"><td bgcolor="#EAEAEA"><font style="font-size: 16pt">결재 - ${dto.type}</font></td></tr>
<tr height="35" ><td align="right" >
<input type="button" name="approvalLine" value="결재선 지정" />
<input type="button" name="approvalSave" value="저장" />
<input type="button" name="approvalClose" value="닫기" />
</td></tr>
<tr><td>

            <textarea name="editor1" id="editor1" rows="10" cols="80">
                결재
            </textarea>
            <script>
          CKEDITOR.replace( 
           'editor1',
           {
            toolbar : 'Basic',     
            filebrowserImageUploadUrl : 'fileupload.jsp?type=Images',   //파일업로드시 사용
            width : '100%',       //---넓이값
            height : '400'        //---높이값
           }
          );
            </script>
</td></tr>



</table>
</body>
</html>




