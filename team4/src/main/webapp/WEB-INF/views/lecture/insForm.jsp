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
 	   $('#insbutton').on('click', gotoins)
 	   
    })
 	
    function gotoins(){
   	   var url = "insertForm";
 	   var name = "insert";
 	   var option = "width = 600, height = 500, top = 50, left = 200, location = no"
 	   window.open(url, name, option);
 	}
    
    function insvid(num){
 	   var url = "insertVid?ins_num="+num;
 	   var name = "detail";
 	   var option = "width = 600, height = 700, top = 50, left = 200, location = no"
 	   window.open(url, name, option);
    }
    
    function  godetail(num){
 	   var url = "details?ins_num="+num;
 	   var name = "detail";
 	   var option = "width = 800, height = 700, top = 50, left = 200, location = no"
 	   window.open(url, name, option);
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
		}
		/* 표 */
		.yyBoder {
			text-align: center;
		}
		#yyInsTitle {
			margin-bottom: 30px;
			padding-bottom: 30px;
		}
	</style>
	
</head>

<body>
    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-circle"></div>
        <div class="preloader-img">
            <img src="${path}/resources/jjin/img/core-img/leaf.png" alt="">
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
                                <div class="login">
                                    <a href="${path}/login/logout"><i class="fa fa-user" aria-hidden="true"></i><span>로그아웃</span></a>
                                </div>
                                <!-- 개인정보 수정 -->
                                <div class="login">
                                    <a href="${path}/join/infoUpFormTc"><span>개인정보 수정</span></a>
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
                                    <li><a href="${path}/lecture/insertClass">강의 등록</a></li>
                                    <li><a href="${path}/lecture/insertHW">과제 등록</a></li>
                                    <li><a href="${path}/lecture/TWanswer">작문 답변</a></li>
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

    <!-- ##### Breadcrumb Area Start ##### -->
    <div class="breadcrumb-area">
        <!-- Top Breadcrumb Area -->
        <div class="top-breadcrumb-area bg-img bg-overlay d-flex align-items-center justify-content-center" style="background-image: url(${path}/resources/jjin/imges/bg-img/24.jpg);">
            <h2>강의 등록</h2>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#"><i class="fa fa-home"></i> Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">강의 등록</li>
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
            <button type="button" class="btn alazea-btn w-30" id="insbutton">           
				강의 등록
           	</button>
            <br><br>
            <div class="row">
                <div class="col-12">
                    <div class="cart-table clearfix">
                        <table class="table table-responsive">
                            <thead>
                                <tr>
                                    <th class="yyBoder">강의 제목</th>
                                    <th class="yyBoder">카테고리</th>
                                    <th class="yyBoder">강의 등록일</th>
                                    <th class="yyBoder">&nbsp&nbsp&nbsp&nbsp&nbsp가격</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="list" items="${insList}">
                                <tr>
                                    <td>
                                       <video src="${path}/resources/videofiles/${list.ins_thumbnailsave}" width="100" height="80"></video>
                                       <p><a id="yyInsTitle" href="javascript: godetail(${list.ins_num})">${list.ins_title}</a></p>
                                    </td>
                                    <td>
                                        ${list.ins_cate}
                                    </td>
                                    <td>${list.ins_date}</td>
                                    <td>${list.ins_price}원</td>
                                    <td>
                                    	<input type="button" class="btn alazea-btn w-10" id='insvid' onclick="insvid(${list.ins_num})" value="영상등록">
                                    </td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                
                <!-- ##### 페이징 ##### -->
		         <nav aria-label="Page navigation" id="yyPagenavi">
		             <ul class="pagination">
		                 <li class="page-item"><a class="page-link" href="${path}/lecture/insertClass?page=${navi.currentPage - 1}"><i class="fa fa-angle-left"></i></a></li>
		                 <c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
							<c:if test="${counter == navi.currentPage}"><b></c:if>
				                 <li class="page-item"><a class="page-link" href="${path}/lecture/insertClass?page=${counter}">${counter}</a></li>
							<c:if test="${counter == navi.currentPage}"></b></c:if>
						</c:forEach>
		                 <li class="page-item"><a class="page-link" href="${path}/lecture/insertClass?page=${navi.currentPage + 1}"><i class="fa fa-angle-right"></i></a></li>
		             </ul>
		         </nav>
		         <!-- ##### 페이징 ##### -->
             </div>
        </div>
    </div>
    <!-- ##### Cart Area End ##### -->

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
                                    <li><a href="#">F&A</a></li>
                                    <li><a href="#">강의 등록</a></li>
                                    <li><a href="#">Q&A</a></li>
                                    <li><a href="#">과제 등록</a></li>
                                    <li><a href="#">작문 답변</a></li>
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
                                    <li><a href="#">강의 등록</a></li>
                                    <li><a href="#">과제 등록</a></li>
                                    <li><a href="#">작문답변</a></li>
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