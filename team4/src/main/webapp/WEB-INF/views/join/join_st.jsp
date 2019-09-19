<!--
학생회원가입
김지수
2019-08-20
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>회원가입</title>
<link rel="stylesheet" href="../resources/vendorsBar/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="../resources/vendorsBar/base/vendor.bundle.base.css">
<link rel="stylesheet" href="../resources/cssBar/style.css">
<link rel="shortcut icon" href="../resources/imagesBar/favicon.png" />
<script src="../resources/js/jquery-3.4.1.js"></script>
<style>
tr.form-group{
  border-bottom: 15px solid #fff;
}
#yyYoungColor {
	color: #70c745;
}
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
<script src="../resources/js/jquery-3.4.1.js"></script>
<script>
$(document).ready(function(){
	//id 길이 체크
	$('#st_id').keyup(function(){
		var checkId = $('#st_id').val();
		if (checkId.length < 3 || checkId.length > 10){
			var i = '<p>3글자 이상 10글자 이상 입력해주세요.</p>'
			$('#idCheck').html(i);
			return;
		} else {
			$('#idCheck').html('');
		}
		
		
		$.ajax({
			url: 'idCheckSt',
			type: 'post',
			data: {checkId:checkId},
			dataType: 'text',
			success: function(s){
				$('#idCheck').html(s);
			},
			error: function(e){
				alert("아이디 검색 실패");
			}
		});
	});//id 길이 및 중복확인
	
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

function joinformCheck(){
	var st_ID = document.getElementById('st_id');
	var st_PW = document.getElementById('st_pw');
	var st_NAME = document.getElementById('st_name');
	var st_DOB = document.getElementById('st_dob');
	var st_PHONE = document.getElementById('st_phone');
	var st_EMAIL = document.getElementById('st_email');
	
	if (st_ID.value == '' || st_PW.value == '' || st_NAME == '' || st_DOB == '' || st_PHONE == '' || st_EMAIL == '') {
		alert('필수입력입니다.');
		return false;
	}
	return true;
}

</script>
</head>
<body>
<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
            	<h1 align="center">YA<span id="yyYoungColor">YOUNG</span></h1>
              	<h5 align="center">학생 회원가입 </h5>
              <form class="pt-3" action="insert_st" enctype="multipart/form-data" method="post" onsubmit="return joinformCheck()" id="joinform">
              	<table align="center">
					<tr class="form-group">
						<td>
							<input type="text" id="st_id" name="st_id" class="form-control form-control-lg" placeholder="아이디">
							<div id="idCheck"></div>
						</td>
					</tr>
					<tr class="form-group">
						<td>
							<input type="password" id="st_pw" name="st_pw" class="form-control form-control-lg" placeholder="비밀번호">
							<div id="pwLength"></div>
						</td>
					</tr>
					<tr class="form-group">
						<td>
							<input type="password" id="st_pws" class="form-control form-control-lg" placeholder="비밀번호 재입력">
							<div id="pwCheck"></div>
						</td>
					</tr>
					<tr class="form-group">
						<td><input type="file" id="st_picname" name="pic" class="form-control form-control-lg"></td>
					</tr>
					<tr class="form-group">
						<td><input type="text" id="name" name="st_name" class="form-control form-control-lg" placeholder="이름"></td>
					</tr>
					<tr class="form-group">
						<td><input type="text" id="st_dob" name="st_dob" class="form-control form-control-lg" placeholder="YYYY-MM-DD 형식"></td>
					</tr>
					<tr class="form-group">
						<td><input type="tel" name="st_phone" id="st_phone" class="form-control form-control-lg"  pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required placeholder="000-0000-0000 형식"></td>
					</tr>
					<tr class="form-group">
						<td><input type="email" id="email" name="st_email" class="form-control form-control-lg" placeholder="이메일"></td>
					</tr>
					<tr class="form-group">
						<td class="form-control form-control-lg">
							<span style="font-weight:bold;">학습수준</span>
							&nbsp&nbsp
								<input type="radio" name="st_level" value="1" checked="checked"> 초급
								<input type="radio" name="st_level" value="2"> 중급
								<input type="radio" name="st_level" value="3"> 고급
						</td>	
					</tr>
					<tr class="mt-3">
						<td><input type="submit" class="btn btn-block btn-success btn-lg font-weight-medium auth-form-btn"  value="회원가입"></td>
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
</body>
</html>