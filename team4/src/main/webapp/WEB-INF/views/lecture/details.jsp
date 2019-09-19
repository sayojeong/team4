<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
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
		if(${vo.ins_thumbnailsave == null || list == null}){
			alert("등록된 비디오가 없습니다.");
			self.close();
		}
	</script>
	<style>
		/* 표 */
		.yyBoder {
			text-align: center;
		}
		#yyTextarea {
			font-size: 10pt;
		}
	</style>
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
	                               		<hr>	
	                               </th>
	                           </tr>
	                           <tr>
	                               <th>
	                               		<video src="${path}/resources/videofiles/${vo.ins_thumbnailsave}" width="230" height="190"></video>	
	                               </th>
	                               <th>
	                               		<pre>${vo.ins_des}</pre>
	                               </th>
	                           </tr>
	                           <tr>
									<th colspan="2" class="yyBoder">
										<textarea rows="10" cols="100" id="yyTextarea">${vo.ins_vidlist }</textarea>
									</th>
							   </tr>
	                       </thead>
	                   </table>
	                   <table class="table table-responsive">
	                       <tbody>
	                           <tr>
	                           		<th colspan="2">
										<h3 class="yyBoder">동영상</h3>
									</th>
	                           </tr>
	                           <c:forEach var="v" items="${list}">
									<tr>
										<td>
											<video src="${path}/resources/videofiles/${v.vid_vidsavename}" width="230" height="190" controls></video>	
										</td>
										<td>
											${v.vid_vidname}
										</td>		
									</tr>
								</c:forEach>
	                       </tbody>
						</table>
	               </div>
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