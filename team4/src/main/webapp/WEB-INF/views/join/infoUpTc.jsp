<!-- 
선생님 개인 정보 수정
2019-08-21
김지수
-->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="../resources/vendorsBar/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="../resources/vendorsBar/base/vendor.bundle.base.css">
<link rel="stylesheet" href="../resources/cssBar/style.css">
<link rel="shortcut icon" href="../resources/imagesBar/favicon.png" />
<style>
tr.form-group {
  border-bottom: 15px solid #fff;
}
#yyYoungColor {
	color: #70c745;
}
</style>   
<script src="../resources/js/jquery-3.4.1.js"></script>
<script>
$(document).ready(function(){
	//비밀번호 길이 체크
	$('#st_pw').keyup(function(){
		var checkPw = $('#st_pw').val();
		if (checkPw.length < 3 || checkPw.length > 10){
			var i = '<p>3글자 이상 10글자 이상 입력해주세요.</p>'
			$('#pwLength').html(i);
			return;
		} else {
			$('#pwLength').html('');
		}
	});
	
	$('#st_pw2').keyup(function(){
		var pw = $('#st_pw').val();
		var pw2 = $('#st_pw2').val();
		if (pw != pw2) {
			var j = '<p>비밀번호가 일치하지 않습니다.</p>'
			$('#pwCheck').html(j);
			return;
		} else{
			$('#pwCheck').html('');	
			return;
		}
	});//비밀번호 일치
});

// 수정
function updateformCheck(){
	var st_PW = document.getElementById('st_pw');
	var st_PW2 = document.getElementById('st_pw2');
	var st_NAME = document.getElementById('st_name');
	var st_PHONE = document.getElementById('st_phone');
	var st_EMAIL = document.getElementById('st_email');
	
	if (st_PW.value == '' || st_PW2.value == '' || st_NAME == '' || st_PHONE == '' || st_EMAIL == '') {
		alert('필수입력입니다.');
		return false;
	}
	return true;
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
<title>회원 정보 수정</title>
</head>
<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              	<h1 align="center">YA<span id="yyYoungColor">YOUNG</span></h1>
              	<h5 align="center">회원 정보 수정 </h5>
              <form class="pt-3" id="joinform" action="updateTc" enctype="multipart/form-data" method="POST" onsubmit="return updateformCheck();">
              	<table align="center" >
					<tr class="form-group">
						<td colspan="3">
							<input type="text" id="tc_id" name="tc_id" class="form-control form-control-lg" readonly="readonly" value="${getTc.tc_id }">
						</td>
					</tr>
					<tr class="form-group">
						<td colspan="3">
							<input type="password" name="tc_pw" id="tc_pw" class="form-control form-control-lg" placeholder="Password">
							<div id="pwLength"></div>
						</td>
					</tr>
					<tr class="form-group">
						<td colspan="3">
							<input type="password" class="form-control form-control-lg" id="tc_pw2"  placeholder="PasswordCheck">
							<div id="pwCheck"></div>
						</td>
					</tr>	
					<tr class="form-group">
						<td class="form-control form-control-lg">${getTc.tc_picname }</td>
						<td><input type="button"  class= "btn btn-inverse-success" value="삭제" onclick="location.href='deletefileTcPic?tc_id=${getTc.tc_id}&tc_savedpicid=${getTc.tc_savedpicid}'"></td>
						<td><input type="file" class="form-control form-control-lg" name="pic" id="tc_picname"></td>	
					</tr>
					<tr class="form-group">
						<td colspan="3">
							<input type="text" class="form-control form-control-lg" value="${getTc.tc_name}" name="tc_name" id="st_name">
						</td>
					</tr>
					<tr class="form-group">
						<td colspan="3">
							<input type="text" id="tc_dob" name="tc_dob" class="form-control form-control-lg" readonly="readonly" value="${getTc.tc_dob }">
						</td>
					</tr>
					<tr class="form-group">
						<td colspan="3">
							<input type="tel" class="form-control form-control-lg" value="${getTc.tc_phone }" name="tc_phone" id="tc_phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required placeholder="000-0000-0000 형식">
						</td>
					</tr>
					<tr class="form-group">
						<td colspan="3">
							<input type="email" value="${getTc.tc_email }" name="tc_email" id="tc_email" class="form-control form-control-lg" >
						</td>
					</tr>
					<tr class="mt-3">
						<td colspan="3">
							<!-- 수정  -->
							<input type="submit" value="수정 " class="btn btn-block btn-success btn-lg font-weight-medium auth-form-btn">
						</td>
					</tr>
				</table>
              </form>
            </div>
          </div>
        </div>
      </div>
      <!-- content-wrapper ends -->
    </div>
    <!-- page-body-wrapper ends -->
  </div>
  <!-- container-scroller -->
  <!-- plugins:js -->
  <script src="../resources/vendorsBar/base/vendor.bundle.base.js"></script>
  <!-- endinject -->
  <!-- inject:js -->
  <script src="../resources/jsBar/off-canvas.js"></script>
  <script src="../resources/jsBar/hoverable-collapse.js"></script>
  <script src="../resources/jsBar/template.js"></script>
${msg }
</body>
</html>