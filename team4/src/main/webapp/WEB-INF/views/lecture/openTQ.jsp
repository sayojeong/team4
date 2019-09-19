<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<c:set var="path" value="${pageContext.request.contextPath}"/>

    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <script src="${path}/resources/js/jquery-3.4.1.js"></script>
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>YaYoung-English School-English School</title>

    <!-- Favicon -->
    <link rel="icon" href="${path}/resources/jjin/imges/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="${path}/resources/jjin/style.css">
<style>
#yyStdId {
	padding-top: 30px;
}
</style>    
    
<script>
if(${check != null}){
	alert('등록 성공!')
	opener.location.reload();
	self.close();
}
function submitWA(){
	var wa_tcomment = document.getElementById('wa_tcomment');
	if(wa_tcomment.value == ""){
		alert("답을 입력 해 주세요!")
		return false;
	}
	return true;
}
</script>
</head>
<body>
<div>
<form action="updateTWA" method="post" onsubmit="return submitWA()">
	<input type="hidden" name="wa_num" value="${sw.wa_num}">
	<div class="col-12 col-lg-5">
         <!-- Section Heading -->
         <div class="section-heading">
             <h2 id="yyStdId">${sw.st_id} 학생의 답</h2>
         </div>
         <!-- Contact Form Area -->
         <div class="contact-form-area mb-100">
                 <div class="row">
                     <div class="col-12">
                         <div class="form-group">
                         	 <h6>문제</h6>
                             <pre><textarea class="form-control" id="message" cols="30" rows="10">${sw.w_question}</textarea></pre>
                         </div>
                     </div>
                     <div class="col-12">
                         <div class="form-group">
                         	 <h6>학생의 답</h6>
                             <pre><textarea class="form-control"  id="message" cols="30" rows="10">${sw.wa_stans}</textarea></pre>
                         </div>
                     </div>
                     <div class="col-12">
                         <div class="form-group">
                         	 <h6>강사의 답</h6>
                             <pre><textarea class="form-control" id="wa_tcomment" name="wa_tcomment" cols="30" rows="10">${sw.wa_tcomment}</textarea></pre>
                         </div>
                     </div>
                     <div class="col-12">
                        <c:if test="${sw.wa_tcomment != null}">
							<input class="btn alazea-btn w-10" type="submit"  value="코멘트 수정 하기" >
						</c:if>
						<c:if test="${sw.wa_tcomment == null}">
							<input class="btn alazea-btn w-10" type="submit"  value="코멘트 작성 하기" >
						</c:if>
                     </div>
                 </div>
         </div>
     </div>
</form>
</div>
  <!-- ##### All Javascript Files ##### -->
    <!-- jQuery-2.2.4 js -->
    <!-- jQuery-2.2.4 js -->
    <script src="${path}/resources/jjin/js/jquery/jquery-2.2.4.min.js"></script>
    <!-- Popper js -->
    <script src="${path}/resources/jjin/js/bootstrap/popper.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${path}/resources/jjin/js/bootstrap/bootstrap.min.js"></script>
    <!-- All Plugins js -->
    <script src="${path}/resources/jjin/js/plugins/plugins.js"></script>
    <!-- Active js -->
    <script src="${path}/resources/jjin/js/active.js"></script>
</body>
</html>