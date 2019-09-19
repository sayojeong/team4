<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="${path}/resources/js/jquery-3.4.1.js"></script>
<!-- include libraries(jQuery, bootstrap) -->
<link rel="stylesheet" href="${path}/resources/jjin/style.css">
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 
<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>

<script>
$(document).ready(function(){
	
	$('#ori').on('keyup', trans)
	
})
$(function(){
	$("#note").summernote({
		height:150,
		width:500
	});
});

function trans(){
			var ori = $(this).val()
			var olang = $('select>option:selected').attr('olang');
			var tlang = $('select>option:selected').attr('tlang');
			
			
			$.ajax({
				url:'../lecture/translate',
				type:'get',
				data:{ori:ori, olang:olang, tlang:tlang},
				success:function(j){
					
				
					$('#show').val(j);
					
					
				},
				error:function(){
						
				}
			})
		
}
</script>
</head>
<body>
<form action="createNote" method="post">
	번역 : <input type="text" id="ori" name="ori" size="43"> 
	<select id="options">
		<option name="lang" olang="ko" tlang="en">한국어 -> 영어</option>
		<option name="lang" olang="en" tlang="ko">영어 -> 한국어</option>
		<!-- <option name="lang" olang="ko" tlang="ja">한국어 -> 일본어</option>
		<option name="lang" olang="ja" tlang="ko">일본어 -> 한국어</option> -->
	</select>
	<br>
	<input type="text" id="show"  size="65">
	<br>
	<textarea id="note" name="note_content"></textarea>
	<input type="submit" class="btn alazea-btn w-5" id="add" value="노트저장">
</form>
</body>
</html>