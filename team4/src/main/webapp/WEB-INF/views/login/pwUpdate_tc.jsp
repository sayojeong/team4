<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>비밀번호 수정</title>
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
	$('#pwck').on('keyup', pwcheck);
});

function pwcheck() {

	var st_pw = $('#pw').val();
	var st_pwck = $('#pwck').val();
	
	if (st_pw == st_pwck) {
		$('#pwch').html('비밀번호 일치');
	}else {
		$('#pwch').html('비밀번호 불일치');
	} 
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
              	<h5 align="center">비밀번호 수정</h5>
              	<form class="pt-3" action="pwUpdate_tc" method="post">
              		<input type="hidden" name="tc_id" value="${teacher.tc_id }">
              		<table align="center">
						<tr class="form-group">
							<td><input type="password" id="pw" name="tc_pw" class="form-control form-control-lg" placeholder="비밀번호입력"></td>
						</tr>
						<tr class="form-group">
							<td><input type="password" id="pwck" class="form-control form-control-lg" placeholder="비밀번호다시입력"></td>
						</tr>
							<td><p id="pwch"></p></td>
						<tr>
						
						</tr>
						<tr class="mt-3">
							<td><input type="submit" value="비밀번호 수정" class="btn btn-block btn-success btn-lg font-weight-medium auth-form-btn"></td>
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