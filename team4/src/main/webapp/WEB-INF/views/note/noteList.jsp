<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${path}/resources/jjin/style.css">
 <script src="${path}/resources/js/jquery-3.4.1.js"></script>
 <script>
 $(document).ready(function(){
	 $('#add').on('click', function(){
		location.href="Notepad"; 
	 })
 })
 </script>
</head>
<body>
<input type="button" class="btn alazea-btn w-5" id="add" value="노트추가">
<c:forEach var="list" items="${list}">
<br><a href="noteDetail?note_num=${list.note_num}">${list.note_title}</a>
</c:forEach>
</body>
</html>