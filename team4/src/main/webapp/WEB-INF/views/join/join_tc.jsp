<!-- 
선생님 회원가입
김지수
2019/08/19 
-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>JOIN</title>
<!-- plugins:css -->
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
	$('#tc_id').keyup(function(){
		var checkId = $('#tc_id').val();
		if (checkId.length < 3 || checkId.length > 10){
			var i = '<p>3글자 이상 10글자 이상 입력해주세요.</p>'
			$('#idCheck').html(i);
			return;
		} else {
			$('#idCheck').html('');
		}
		
		
		$.ajax({
			url: 'idCheckTc',
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
	$('#tc_pw').keyup(function(){
		var checkPw = $('#tc_pw').val();
		if (checkPw.length < 3 || checkPw.length > 10){
			var i = '<p>3글자 이상 10글자 이상 입력해주세요.</p>'
			$('#pwLength').html(i);
			return;
		} else {
			$('#pwLength').html('');
		}
	});
	
	$('#tc_pw2').keyup(function(){
		var pw = $('#tc_pw').val();
		var pw2 = $('#tc_pw2').val();
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
function joinformCheck(){
	var tc_ID = document.getElementById('tc_id');
	var tc_PW = document.getElementById('tc_pw');
	var tc_PW2 = document.getElementById('tc_pw2');
	var tc_PICNAME = document.getElementById('tc_picname');
	var tc_NAME = document.getElementById('tc_name');
	var tc_DOB = document.getElementById('tc_dob');
	var tc_PHONE = document.getElementById('tc_phone');
	var tc_EMAIL = document.getElementById('tc_email');
	
	if (tc_ID.value == '' || tc_PW.value == '' || tc_PW2.value == ''|| tc_PICNAME.value == '' || tc_NAME == '' || tc_DOB == '' || tc_PHONE == '' || tc_EMAIL == '') {
		alert('필수입력입니다.');
		return false;
	}
	return true;
}

</script>
</head>
<title>선생님 회원가입</title>
</head>
<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              	<h1 align="center">YA<span id="yyYoungColor">YOUNG</span></h1>
              	<h5 align="center">강사 회원가입 </h5>
              <form class="pt-3" id="joinform" action="insert_tc" enctype="multipart/form-data" method="POST" onsubmit="return joinformCheck();">
              	<table align="center">
					<tr class="form-group">
						<td>
							<input type="text" id="tc_id" name="tc_id" class="form-control form-control-lg" placeholder="아이디">
							<div id="idCheck"></div>
						</td>	
					</tr>
					<tr class="form-group">
						<td>
							<input type="password" class="form-control form-control-lg" id="tc_pw" name="tc_pw" placeholder="비밀번호">
							<div id="pwLength"></div>					
						</td>
					</tr>
					<tr class="form-group">
						<td>
							<input type="password" class="form-control form-control-lg" id="tc_pw2"  placeholder="비밀번호다시입력">
							<div id="pwCheck"></div>
						</td>
					</tr>
					<tr class="form-group">
						<td><input type="file" class="form-control form-control-lg" type="file" name="pic" id="tc_picname"></td>
					</tr>
					<tr class="form-group">
						<td><input type="text" class="form-control form-control-lg"  name="tc_name" id="tc_name" placeholder="이름"></td>
					</tr>
					<tr class="form-group">
						<td><input type="text" class="form-control form-control-lg" name="tc_dob" id="tc_dob" placeholder="YYYY-MM-DD 형식"></td>
					</tr>
					<tr class="form-group">
						<td><input type="tel" class="form-control form-control-lg" id="tc_phone" name="tc_phone" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" required placeholder="000-0000-0000 형식"></td>
					</tr>
					<tr class="form-group">
						<td><input type="email" class="form-control form-control-lg" name="tc_email" id="tc_email" placeholder="이메일"></td>
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
${msg }
</body>
</html>