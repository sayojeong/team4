<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 하기</title>
<script src="../resources/js/jquery-3.4.1.js"></script>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta cname="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<style>
	table {
		margin: auto;
		text-align: center;
	}

	#btnInsert {
		margin: auto;
		text-align: center;
	}
	#yyYoungColor {
	color: #70c745;
}
</style>
<script>
$(document).ready(function(){
    $('#coupon').on('click', use);
 })
 
 function use(){
	var c_discount = $('select>option:selected').val();
	var c_num = $('select>option:selected').attr('num');
	var ins_price = $('#price').html();
	if (ins_price>c_discount) {
		var price = ins_price - c_discount;		
	}else {
		alert('쿠폰적용불가');
		return;
	}
	/* alert(c_num+" "+c_discount+" "+ins_price); */
	$.ajax({
		url:'coupon',
		type:'post',
		async:false,
		data:{c_num:c_num},
		success:function(){
			$('#price').html(price);
			alert('쿠폰적용성공');
		},
		error:function(e){
			alert('쿠폰적용실패');
		}
	})
	
}

if (${close != null}) {
	alert('결제 성공');
	self.close();
}

if (${msg != null}) {
	alert('${msg}');
	self.close();
}
</script>
</head>
<body>
<body>
	<div class="main-panel">
	  <div class="content-wrapper">
		<div class="row">
			<div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                	<h1 align="center">YA<span id="yyYoungColor">YOUNG</span></h1>
              		<h5 align="center">결제 하기</h5>             
                  <form class="forms-sample" action="buy" method="post">
                   <input type="hidden" name="ins_num" value="${vo.ins_num }">
                    <div class="form-group">
                      <table>
							<tr>
								<th>강의명</th>
								<td>${vo.ins_title}</td>
							</tr>
							<tr>
								<th>쿠폰</th>
								<td>			
							  		<select class="coupon">
										<c:forEach var="list" items="${list}">
						  					<option value="${list.c_discount}" num="${list.c_num}">${list.c_discount}</option>
										</c:forEach>
						  			</select>
							  	</td>
								<td><input type="button" class="btn btn-outline-success btn-sm" id="coupon" value="사용"></td>
							</tr>
						 	<tr>
								<th>결제금액</th>	
								<td><div id="price">${vo.ins_price}</div></td>	
							</tr>
					  </table>	
					 </div>
					 <div id="btnInsert"> 
					 	<input type="submit" value="구매" class="btn btn-success">
					 </div>	
                  </form>
                </div>
              </div>
            </div>
           </div>
         </div>
        </div>
</body>
</html>