<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<c:set var="path" value="${pageContext.request.contextPath}"/>

    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title -->
    <title>YaYoung-English School</title>

    <!-- Favicon -->
    <link rel="icon" href="${path}/resources/jjin/imges/core-img/favicon.ico">

    <!-- Core Stylesheet -->
    <link rel="stylesheet" href="${path}/resources/jjin/style.css">
    
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    
    <script>
	    $(document).ready(function(){
			$('.vid').on('click', function(){
				var num = $(this).attr('vnum');
				var title = $(this).attr('title');	
				showHWList(num, title);
				showlist(num);
				showWList(num);
				showlistW(num);
			});
			
			 
		});
		
		function showWList(num){
			
			var vid_num = num;
			
			
			var txt = '<div id="s_showList"></div>'
			+'<table width="100%">'
			+'<tr><td>'
			+'<textarea rows="5" cols="60" name="question" id="questionW" placeholder="문제" style="resize: none;"></textarea>'
			+'</td><td>'
			+'<textarea rows="5" cols="60" name="explain" id="exp" placeholder="핵심표현" style="resize: none;"></textarea>'
			+'</td></tr>'
			+'<tr><td colspan="2">'
			+'<input type="button" value="작문 문제등록" class="btn alazea-btn w-10" id="insertWQ" wnum="'+vid_num+'"></td></tr></table>';
			
			$('#s_showList').html(txt);
			
			$('#insertWQ').on('click', insertAnswerW);
		}
		
		function insertAnswerW(){
			var w_question = $('#questionW').val();
			var w_pointexp = $('#exp').val();
			var vid_num = $(this).attr('wnum');	
			
			$.ajax({
				url:'insertQW',
				type:'get',
				data:{w_question:w_question, w_pointexp:w_pointexp, vid_num:vid_num},
				success:function(){
					showlistW(vid_num);
					$('#questionW').val('');
					$('#exp').val('');
				},
				error:function(){
					alert('문제등록 실패');	
				}
				
			}); 
			
		}
		
		function showlistW(num){
			var vid_num = num;
			
			$.ajax({
				url:'showListW',
				type:'get',
				data:{vid_num:vid_num},
				dataType:'json',
				success:function(j){
					var txt = '<br><br><table width="100%">'
							+'<tr><th colspan="2"><h4>작문 문제</h4></th></tr>';
					$.each(j, function(k,i){
						i.m_answer
						txt +='<tr>'
							+'<td><textarea rows="5" cols="60" placeholder="문제" style="resize: none;">'+i.w_question+'</textarea></td>'
							+'<td><textarea rows="5" cols="60" placeholder="문제해석" style="resize: none;">'+i.w_pointexp+'</textarea></td>'
							+'</tr>'; 
					})
					txt += '</table>';
					$('#s_hwList').html(txt); 
					
				},
				error:function(){
					alert('리스트 불러오기 실패');
				}
			
			
			})
			
		}
		
		function showHWList(num, title){		
			var str = '<h3>'+title+'</h3><br><br><br>'
			+'<div id="hwlist"></div>'
			+'<div id="showList"></div>'
			+'<table width="100%">'
			+'<tr><td>'
			+'<textarea rows="5" cols="60" name="question" id="question" placeholder="문제" style="resize: none;"></textarea>'
			+'</td><td>'
			+'<textarea rows="5" cols="60" name="explain" id="explain" placeholder="문제해석" style="resize: none;"></textarea>'
			+'</td><td>'
			+'<select id="ans">'
				+'<option name="answer" class="sel" value="1">1</option>'
				+'<option name="answer" class="sel" value="2">2</option>'
				+'<option name="answer" class="sel" value="3">3</option>'
				+'<option name="answer" class="sel" value="4">4</option>'
			+'</select>'
			+'</td></tr>'
			+'<tr><td colspan="3">'
			+'<input type="button" value="객관식 문제등록" class="btn alazea-btn w-10" id="insertQ" snum="'+num+'"></td></tr></table>';
					
			$('#hwList').html(str);
			
			
			$('#insertQ').on('click', insertAnswer);	
			
		}
		
		
		function insertAnswer(){
			//alert("dlfkjsldkfj");
			var m_question = $('#question').val();
			var m_exp = $('#explain').val();
			var m_answer = $('select>option:selected').val();
			var vid_num = $(this).attr('snum');	
			
			$.ajax({
				url:'insertQ',
				type:'get',
				data:{m_question:m_question, m_answer:m_answer, m_exp:m_exp, vid_num:vid_num},
				success:function(){
					showlist(vid_num);
					$('#question').val('');
					$('#explain').val('');
					$('select>option[value="1"]').attr('selected', 'selected');
				},
				error:function(){
					alert('보여주기 실패');	
				}
				
			}); 
			
		}
		
		function showlist(num){
			var vid_num = num;
			
			$.ajax({
				url:'showList',
				type:'get',
				data:{vid_num:vid_num},
				dataType:'json',
				success:function(j){
					var txt = '<table width="100%">'
							+'<tr><th colspan="3"><h4>객관식 문제</h4></th></tr>';
					$.each(j, function(k,i){
						i.m_answer
						txt +='<tr>'
							+'<td><textarea rows="5" cols="60" placeholder="문제" style="resize: none;">'+i.m_question+'</textarea></td>'
							+'<td><textarea rows="5" cols="60" placeholder="문제해석" style="resize: none;">'+i.m_exp+'</textarea></td>'
							+'<td>'+i.m_answer+'</td>'
							+'</tr>'; 
					})
					txt += '</table>';
					$('#showList').html(txt); 
					
				},
				error:function(){
					alert('리스트 불러오기 실패');
				}
			
			
			})
		}
    </script>
</head>

<body>
<div class="cart-area section-padding-0-100 clearfix">
	<div class="container">
	       <div class="row">
	           <div class="col-12">
	               <div class="cart-table clearfix">
	                   <table class="table table-responsive">
	                       <thead>
	                           <tr>
	                               <th colspan="2">
	                               		<br><br>
	                               		<h3 class="yyBoder">${vo.ins_title}</h3>	
	                               </th>
	                           </tr>
	                           <tr>
	                               	<c:forEach var="v" items="${list}">
										<td>
											<video src="${path}/resources/videofiles/${v.vid_vidsavename}" width="230" height="190" class="vid" vnum="${v.vid_num}" title="${v.vid_title}"></video>
										</td>
									</c:forEach>
									
	                          	</tr>
	                        </thead>
	                   </table>
	                        <!-- ##### 페이징 ##### -->
					         <nav aria-label="Page navigation" id="yyPagenavi">
					             <ul class="pagination">
					                 <li class="page-item"><a class="page-link" href="#"><i class="fa fa-angle-left"></i></a></li>
					                 <li class="page-item"><a class="page-link" href="#">1</a></li>
					                 <li class="page-item"><a class="page-link" href="#">2</a></li>
					                 <li class="page-item"><a class="page-link" href="#"><i class="fa fa-angle-right"></i></a></li>
					             </ul>
					         </nav>
					         <!-- ##### 페이징 ##### -->
					         <br><br><br>
	                   <div>
							<div id="hwList"></div>
							<div id="showList"></div>
							<div id="s_hwList"></div>
							<div id="s_showList"></div>
					   </div>
	     		  </div>  
	          </div>
	      </div>
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