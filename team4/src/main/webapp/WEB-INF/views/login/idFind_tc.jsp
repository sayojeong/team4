<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>아이디 찾기</title>
<link rel="stylesheet" href="../resources/vendorsBar/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="../resources/vendorsBar/base/vendor.bundle.base.css">
<link rel="stylesheet" href="../resources/cssBar/style.css">
<link rel="shortcut icon" href="../resources/imagesBar/favicon.png" />
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
	$('#idFind').on('click', idFind);
});

function idFind() {
	var tc_name = $('#name').val();
	var tc_dob = $('#dob').val();
	var tc_email = $('#email').val();
	
	if(tc_name == ""){
		alert('이름을 입력하세요');
		return;
	}
	if(tc_dob == ""){
		alert('생년월일을 입력하세요');
		return;
	}
	if(tc_email == ""){
		alert('이메일을 입력하세요');
		return;
	}
	
	$.ajax({
		url: 'idFind_tc',
		type: 'post',
		data: $('#info').serialize(),
		dataType: 'text',
		success: function(s) {
			
			var str = s + '<br>';
				str += '<input type="hidden" name="tc_id" value="'+s+'">';
				str += '<h4></h4>';
				str += '<input type="submit" class="btn btn-inverse-success btn-sm" value="비밀번호 찾기">';
						
			$('#FindId').html(str);
						
		},
		error:function(e){
			alert('해당 정보와 관련된 아이디가 존재하지 않습니다.');
		}
	})
	
}
</script>
</head>
<body>
  <div class="container-scroller">
    <div class="container-fluid page-body-wrapper full-page-wrapper">
      <div class="content-wrapper d-flex align-items-center auth px-0">
        <div class="row w-100 mx-0">
          <div class="col-lg-4 mx-auto">
            <div class="auth-form-light text-left py-5 px-4 px-sm-5">
              	<h1 align="center">YA<span id="yyYoungColor">YOUNG</span></h1>
              	<h5 align="center">아이디 찾기</h5>
              <form class="pt-3" action="pwFindForm_tc" method="post" onsubmit="return formCheck()" id="info">
              	<table align="center">
					<tr class="form-group">
						<td><input type="text" id="name" name="tc_name" class="form-control form-control-lg" placeholder="이름"></td>
					</tr>
					<tr class="form-group">
						<td><input type="text" id="dob" name="tc_dob" class="form-control form-control-lg" placeholder="YYYY-MM-DD형식"></td>
					</tr>
					<tr class="form-group">
						<td><input type="email" id="email" name="tc_email" class="form-control form-control-lg" placeholder="이메일"></td>
					</tr>
					<tr class="mt-3">
						<td><input type="button" id="idFind" value="아이디 찾기" class="btn btn-block btn-success btn-lg font-weight-medium auth-form-btn"></td>
					</tr>
				</table>
				<div id="FindId" align="center" style="font-size:25px;"></div>
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