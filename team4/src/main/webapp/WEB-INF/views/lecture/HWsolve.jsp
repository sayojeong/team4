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
				showList(num, title);
			});
			
		});
		
		function showList(num, title){
			var vid_num = num;
			$.ajax({
				url:'gethwlist',
				type:'get',
				data:{vid_num:vid_num},
				dataType:'json',
				success:function(j){
					/* alert(JSON.stringify(j));
					alert(j.length) */
					showm(j)
					showAnswerSheet(j, vid_num)
					
					
				},
				errer:function(e){
					alert('문제 가져오기 실패');
				}
			})
			
		}
		
		function showm(j){
			var txt = '<div id="showList"><textarea rows="25" cols="100" style="resize: none;" readonly="readonly">';
			$.each(j, function(i,v){
				txt += (i+1)+'. ' + v;
				
			})
			txt += '</textarea></div>';
			
			$('#showList').html(txt);
		}
		
		function showAnswerSheet(j, vid_num){
			var txt = '<table>';
			$.each(j, function(i,v){
				txt += '<tr><td>'+(i+1) + '.  </td><td>1<input type="radio" name="answer'+i+'" value="1" >'
					+ '2<input type="radio" name="answer'+i+'" value="2" >'
				    + '3<input type="radio" name="answer'+i+'" value="3" >'
					+ '4<input type="radio" name="answer'+i+'" value="4" ></td></tr>' 
			})
			txt +='</table>'
			txt +='<input type="button" class="btn alazea-btn w-5" value="문제등록" id="regAnswers" vidnum="'+vid_num+'" nums="'+j.length+'">'
			$('#HWsolve').html(txt);
			
			$('#regAnswers').on('click', regAnswer);
		}
		
		function regAnswer(){
			var n = $(this).attr('nums');
			var vid_num = $(this).attr('vidnum');
			
			var array = [];
			for(var i=0; i<n; i++){
				   array.push($('input:radio[name="answer'+i+'"]:checked').val());
			}
			//alert(array);
	
			$.ajax({
				url:'regAnswer',
				type:'post',
				data:{answers:array, vid_num:vid_num},
				dataType:'text',
				success:function(n){
					if(n=='1'){
						
						if(confirm('문제 등록 성공!! 영작문제로 가시겠습니다.')){
							location.href="stWrite";
						}else{
							
							location.href="../";
						}
					}else{
						alert('이미 답 등록하였습니다.');					
					}
				},
				errer:function(e){
					alert('문제등록 실패');
				}
			})
	
		}
	</script>
    
    <style>
		/* 네비바 로고 */
		#yyLogoSpan1 {
			font-size: 30pt;
			color: white;
			font-weight: bolder;
		}
		#yyLogoSpan2 {
			font-size: 30pt;
			color: #70c745;
			font-weight: bolder;
		}
		/* 페이징 */
		#yyPagenavi {
			margin-bottom: 20px;
			margin-right: 400px;
		}
		/* 표 */
		.yyBoder {
			text-align: center;
		}
		#yyInsTitle {
			margin-bottom: 30px;
			padding-bottom: 30px;
		}
		/* 문제 */
		#showList{
			float:left;
			margin-top: 20px;
		}
		#HWsolve{
			border: 2px solid;
			width:250px;
			height:600px;
			float:left;
		}
	</style>
	
</head>

<body>
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-circle"></div>
        <div class="preloader-img">
            <img src="${path}/resources/jjin/imges/core-img/leaf.png" alt="">
        </div>
    </div>

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">

         <!-- ***** Top Header Area ***** -->
        <div class="top-header-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="top-header-content d-flex align-items-center justify-content-between">
                            <!-- Top Header Content -->
                            <div class="top-header-meta">
                                <a href="#" data-toggle="tooltip" data-placement="bottom" title="infodeercreative@gmail.com"><i class="fa fa-envelope-o" aria-hidden="true"></i> <span>Email: syj4@gmail.com</span></a>
                                <a href="#" data-toggle="tooltip" data-placement="bottom" title="+1 234 122 122"><i class="fa fa-phone" aria-hidden="true"></i> <span>Call : 010 1122 2211</span></a>
                            </div>
                            
                            <!-- Top Header Content -->
                            <div class="top-header-meta d-flex">
                                <!-- 로그아웃 -->
                                <div class="login" class="yyTextWhite">
                                    <a href="#"><span>${loginId_st}님 안녕하세요!</span></a>
                                </div>
                                <div class="login">
                                    <a href="${path}/login/logout"><i class="fa fa-user" aria-hidden="true"></i> <span>로그아웃</span></a>
                                </div>
                                <!-- 개인정보 수정 -->
                               <!-- 개인정보 수정 -->
                                <div class="login">
                                    <a href="${path}/join/infoUpFormSt"><span>개인정보 수정</span></a>
                                </div>
                                <!-- 내 쿠폰 -->
                                <div class="login">
                                    <a href="${path}/suc/couponForm" onclick="window.open(this.href,'Basket', 'width = 500, height = 300');return false;" target="_blank"><span>내 쿠폰 <span class="cart-quantity"></span></span></a>
                                </div>
                                <!-- 장바구니 -->
                                <div class="cart">
                                    <a href="${path}/suc/basketForm" onclick="window.open(this.href,'Basket', 'width = 500, height = 500');return false;" target="_blank"><i class="fa fa-shopping-cart" aria-hidden="true"></i> <span>장바구니 <span class="cart-quantity"></span></span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ***** 고정 바 ***** -->
        <div class="alazea-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    <nav class="classy-navbar justify-content-between" id="alazeaNav">

                        <!-- Nav Brand -->
                        	<!-- 로고 누르면 홈으로 가기 -->
                        <a href="${path}/" class="nav-brand"><sapn id="yyLogoSpan1">YA</sapn><span id="yyLogoSpan2">YOUNG</span><%-- <img src="${path}/resources/jjin/imges/core-img/logo.png" alt=""> --%></a>

                        <!-- Navbar Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">

                            <!-- Close Button -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Navbar Start -->
                            <div class="classynav">
                                <ul>
                                    <li><a href="${path}/">Home</a></li>
                                    <li><a href="${path}/lecture/mylecture">내 강의실</a></li>
                                    <li><a href="${path}/lecture/studentHW">과제하기</a></li>
                                    <li><a href="${path}/lecture/stWrite">영작하기</a></li>
                                    <li><a href="${path}/lecture/wrongAns">오답확인</a></li>
                                    <li><a href="${path}/suc/classList">수강신청</a></li>
                                </ul>
                            </div>
                            <!-- Navbar End -->
                        </div>
                    </nav>

                    <!-- Search Form -->
                    <div class="search-form">
                        <form action="#" method="get">
                            <input type="search" name="search" id="search" placeholder="Type keywords &amp; press enter...">
                            <button type="submit" class="d-none"></button>
                        </form>
                        <!-- Close Icon -->
                        <div class="closeIcon"><i class="fa fa-times" aria-hidden="true"></i></div>
                    </div>
                </div>
            </div>
        </div>
    </header>
    <!-- ##### Header Area End ##### -->

    <!-- ##### 강의 목록 ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(${path}/resources/jjin/imges/bg-img/24.jpg);">
            <h2>과제 하기</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">과제 하기</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Breadcrumb Area End ##### -->

    <!-- ##### Cart Area Start ##### -->
    <div class="cart-area section-padding-0-100 clearfix">
        <div class="container">
	       	<table class="table table-responsive">
	           <tbody>
					<tr>
						<c:forEach var="v" items="${list}">
							<td>
								<video src="${path}/resources/videofiles/${v.vid_vidsavename}" width="230" height="190" class="vid" vnum="${v.vid_num}" title="${v.vid_title}"></video>
							</td>
						</c:forEach>
					</tr>
				</tbody>
	       	</table>
	        <hr>
    	</div>
	</div>
    <!-- ##### Cart Area End ##### -->
    
    <!-- ##### 문제영역 Start ##### -->
    <div class="checkout_area mb-100">
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-12 col-lg-7">
                    <div class="checkout-content">
                        <h5>문제</h5>
                            <div class="row">
                                <div class="col-md-100 mb-100">
                                	<div id="showList">
                                    	<textarea rows="25" cols="100" style="resize: none;" readonly="readonly"></textarea>
                                	</div>
                                </div>
                            </div>
                    </div>
                </div>

                <div class="col-12 col-lg-4">
                    <div class="checkout-content">
                        <h5 class="title--">정답 선택</h5>
                        <div class="products">
                            <div class="products-data">
                                <div class="single-products d-flex justify-content-between">
                                    <div id="HWsolve">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Checkout Area End ##### -->
    

    <!-- ##### 하단 Area Start ##### -->
    <footer class="footer-area bg-img" style="background-image: url(${path}/resources/jjin/imges/bg-img/3.jpg);">
        <!-- Main Footer Area -->
        <div class="main-footer-area">
            <div class="container">
                <div class="row">

                    <!-- Single Footer Widget -->
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="single-footer-widget">
                            <div class="footer-logo mb-30">
                                <!-- 로고 누르면 홈으로 가기 -->
                        <a href="${path}/" class="nav-brand"><sapn id="yyLogoSpan1">YA</sapn><span id="yyLogoSpan2">YOUNG</span><%-- <img src="${path}/resources/jjin/imges/core-img/logo.png" alt=""> --%></a>
                            </div>
                            
                            
                            <div class="social-info">
                                <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                                <a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
                            </div>
                        </div>
                    </div>

                    <!-- Single Footer Widget -->
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="single-footer-widget">
                            <div class="widget-title">
                                <h5>QUICK LINK</h5>
                            </div>
                            <nav class="widget-nav">
                                <ul>
                                    <li><a href="#">Home</a></li>
                                    <li><a href="#">오답정리</a></li>
                                    <li><a href="#">내 강의실</a></li>
                                    <li><a href="#">수강신청</a></li>
                                    <li><a href="#">과제하기</a></li>
                                    <li><a href="#">F&A</a></li>
                                    <li><a href="#">영작하기</a></li>
                                    <li><a href="#">Q&A</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>

                    
                    <!-- Single Footer Widget -->
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="single-footer-widget">
                            <div class="widget-title">
                                <h5>CONTACT</h5>
                            </div>

                            <div class="contact-information">
                                <p><span>주소:</span> 광주 광산구 무진대로 282&nbsp7층</p>
                                <p><span>연락처:</span> 010 1122 2211</p>
                                <p><span>Email:</span> syj4@gmail.com</p>
                                <p><span>상담 문의:</span> 월 - 금: 8 AM to 6 PM</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

                    <!-- 최하단 -->
        <div class="footer-bottom-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="border-line"></div>
                    </div>
                    <!-- Copywrite Text -->
                    <div class="col-12 col-md-6">
                        <div class="copywrite-text">
                            <p>YAYOUNG-English School</p>
                        </div>
                    </div>
                    <!-- Footer Nav -->
                    <div class="col-12 col-md-6">
                        <div class="footer-nav">
                            <nav>
                                <ul>
									<li><a href="#">Home</a></li>
                                    <li><a href="#">내 강의실</a></li>
                                    <li><a href="#">과제하기</a></li>
                                    <li><a href="#">영작하기</a></li>
                                    <li><a href="#">오답정리</a></li>
                                    <li><a href="#">수강신청</a></li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!-- ##### Footer Area End ##### -->
    
    <!-- ##### All Javascript Files ##### -->
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
    <a id="scrollUp" href="#top" style="position: fixed; z-index: 2147483647; display: none;"><i class="fa fa-angle-up"></i></a>
    <div role="log" aria-live="assertive" aria-relevant="additions" class="ui-helper-hidden-accessible"></div>
    <div role="log" aria-live="assertive" aria-relevant="additions" class="ui-helper-hidden-accessible"></div>

</body>

</html>