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

        <form>
            <textarea name="editor1" id="editor1" rows="10" cols="80">
                개쩐다 씨부럴
            </textarea>
            <script>
          CKEDITOR.replace( 
           'editor1',
           {
            toolbar : 'Basic',     
            filebrowserImageUploadUrl : 'fileupload.jsp?type=Images',   //파일업로드시 사용
            width : '100%',       //---넓이값
            height : '200'        //---높이값
           }
          );
            </script>
        </form>

</body>
</html>




