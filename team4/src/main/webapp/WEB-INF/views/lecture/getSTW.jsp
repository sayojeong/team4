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
$(document).ready(function(){
	showW()
})
function showW(){
		var vid_num = ${vid_num};
		/* var vid_title = '${vid_title}'; */
		
		    $.ajax({
			url:'getSTW',
			type:'post',
			data:{vid_num:vid_num},
			dataType:'json',
			success: function(j){
				//alert(JSON.stringify(j))
				var txt = '<h2 id="yyStdId">'+'</h2><br><table>';
				$.each(j, function(k,v){
					txt += '<tr><th>문제</th></tr><tr><td><pre>'+v.w_question+'</pre></td></tr>'
					 	+ '<tr><td><input type="button" value="HINT" class="hints btn alazea-btn w-10" jhint="'+v.w_pointexp+'" divn="'+k+'"><p id="hint'+k+'"></p></td></tr>'
					 	+ '<tr><td><textarea placeholder="작문 하기" rows="5" cols="50" style="resize: none;" id="ans'+k+'"></textarea></td></tr>'
				})
				txt +='</table>'
					+ '<br><br><input type="button" class="btn alazea-btn w-10" value="답 제출 하기" id="regW" leng="'+j.length+'" vidn="'+vid_num+'">'
				
				
				$('#showWAList').html(txt);
				
				$('.hints').on('click', hintshowup);
				
				$('#regW').on('click', regW);
				
			},
			error:function(e){
					
			}
		}) 
}

  function hintshowup(){
  var hint = $(this).attr('jhint');
  var num = $(this).attr('divn');
  
  $('#hint'+num).html(hint);
} 

  function regW(){
  var n = $(this).attr('leng')
  var vid_num = $(this).attr('vidn');
  var array = []
  for(i=0 ; i<n ; i++){
	  array.push($('#ans'+i).val());
  }
  
  //alert(array)
  $.ajax({
	url:'regWAnswer',
	type:'post',
	data:{answers:array, vid_num:vid_num},
	dataType:'text',
	success:function(n){
		if(n=='1'){
			alert('답 등록 성공!')
			opener.location.reload();
			self.close();
		}else{
			alert('이미 답 등록하였습니다.');					
			self.close();
		}
	},
	error:function(e){
		alert('문제등록 실패');
	}
})
} 
</script>
</head>
<body>
<div>
	<div class="col-12 col-lg-5">
         <div id="showWAList"></div>
    </div>
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