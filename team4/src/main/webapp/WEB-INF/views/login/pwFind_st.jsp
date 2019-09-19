<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>비밀번호 찾기</title>
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
	function formCheck() {
		var st_id = document.getElementById('id');
		var st_name = document.getElementById('name');
		var st_dob = document.getElementById('dob');
		var st_email = document.getElementById('email');
		
		if(st_id == ""){
			alert('아이디를 입력하세요');
			return false;
		}
		
		if(st_name == ""){
			alert('이름을 입력하세요');
			return false;
		}
		
		if(st_dob == ""){
			alert('생년월일을 입력하세요');
			return false;
		}
		
		if(st_email == ""){
			alert('이메일을 입력하세요');
			return false;
		}
		
		alert('비밀번호를 변경하시오');
		
		return true;
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
              	<h5 align="center">비밀번호 찾기</h5>
              	<form class="pt-3" action="pwFind_st" method="post" onsubmit="return formCheck()">
              	<table align="center">
					<tr class="form-group">
						<td><input type="text" id="id" name="st_id" value="${student.st_id }" class="form-control form-control-lg" placeholder="아이디"></td>
					</tr>
					<tr class="form-group">
						<td><input type="text" id="name" name="st_name" value="${student.st_name }" class="form-control form-control-lg" placeholder="이름"></td>
					</tr>
					<tr class="form-group">
						<td><input type="text" id="dob" name="st_dob" value="${student.st_dob }" class="form-control form-control-lg" placeholder="생년월일"></td>
					</tr>
					<tr class="form-group">
						<td><input type="email" id="email" name="st_email" value="${student.st_email }" class="form-control form-control-lg" placeholder="이메일"></td>
					</tr>
					<tr class="mt-3">
						<td><input type="submit" value="비밀번호 찾기" class="btn btn-block btn-success btn-lg font-weight-medium auth-form-btn"></td>
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