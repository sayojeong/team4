<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>로그인</title>
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
function formCheck(){
	 var id = document.getElementById('id');
	 var pw = document.getElementById('pw');
	 
	 if(id.value.length < 3 || id.value.length > 10){
		 alert('이이디는 3~10 글자를 입력하세요');
		 return false;
	 }
	 if(pw.value.length < 3 || pw.value.length > 10){
		 alert('비밀번호는 3~10 글자를 입력하세요');
		 return false;
	 }
	 
	 return true;
}

function toJoin(){
	location.href="../join/join_st";
}

function toId(){
	var url = "../login/idFind_st";
   var name = "idFind";
   var option = "width = 500, height = 500, top = 100, left = 200, location = no"
   window.open(url, name, option);
}

function toPw(){
	var url = "../login/pwFindForm_st";
   var name = "pwFind";
   var option = "width = 500, height = 500, top = 100, left = 200, location = no"
   window.open(url, name, option);
}

if (${close != null}) {
	alert('비밀번호 변경 성공');
	self.close();
}

if (${msg != null}) {
	alert('id나 pw가 일치하지 않습니다.');
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
              	<h5 align="center">학생 로그인</h5>
              <form class="pt-3" action="login_st" method="post" onsubmit="return formCheck()">
              	<table align="center">
					<tr class="form-group">
						<td><input type="text" id="id" name="st_id" class="form-control form-control-lg" placeholder="아이디"></td>
					</tr>
					<tr class="form-group">
						<td><input type="password" class="form-control form-control-lg" id="pw" name="st_pw" placeholder="비밀번호"></td>
					</tr>
					<tr class="mt-3">
						<th><input type="submit" class="btn btn-block btn-success btn-lg font-weight-medium auth-form-btn"  value="로그인"></th>
					</tr>
					<tr class="my-2 d-flex justify-content-between align-items-center">
						<th><input type="button" id="join" class="btn btn-block btn-inverse-success auth-form-btn" onclick="toJoin()" value="회원가입"></th>
						<th><input type="button" id="idFind" class="btn btn-block btn-inverse-success auth-form-btn" onclick="toId()" value="아이디 찾기"></th>
						<th><input type="button" id="pwFind" class="btn btn-block btn-inverse-success auth-form-btn" onclick="toPw()" value="비밀번호 찾기"></th>
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

