<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>구매창</title>
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
	opener.close();
	
	$(document).ready(function(){
		   
	    $('#coupon').on('click', use);
	 })
	 
	 function use(){
		var c_discount = $('select>option:selected').val();
		var c_num = $('select>option:selected').attr('num');
		var price = $("input[name='ins_price']").length;
		var ins_price = new Array(price);
		var all_price = 0;
		
	//	alert("dis :" + c_discount + "cmun: " + c_num + "price: " + price + "inspri: " + ins_price + " all:" + all_price);
		
		for (var i = 0; i < price; i++) {
			ins_price[i] = $("input[name='ins_price']")[i].value;
			all_price += parseInt(ins_price[i]);
		}
	//	alert(all_price)
		if (all_price>c_discount) {
			all_price = all_price - c_discount;	
			
		}else {
			alert('쿠폰적용불가');
			return;
		}
		$.ajax({
			url:'coupon',
			type:'post',
			async:false,
			data:{c_num:c_num},
			success:function(){
				$('#allprice').html(all_price);
				alert('쿠폰적용성공');
			},
			error:function(e){
				alert('쿠폰적용실패');
			}
		})
		
	}
	
	if (${close != null}) {
		alert('구매성공');
		self.close();
	}
	
	if (${msg != null}) {
		alert('${msg}');
	}
</script>
</head>
<body>
	<div class="main-panel">
	  <div class="content-wrapper">
		<div class="row">
			<div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
              		<h1 align="center">YA<span id="yyYoungColor">YOUNG</span></h1>
              		<h5 align="center">구매창</h5>       
              	  <form class="forms-sample" action="buyList" method="post" onsubmit="return formCheck()"> 	            
                    <div class="form-group"  id="basketList">
                      <table>
							<tr>
								<th>강의명</th>
								<th>강의가격</th>
							</tr>
						<c:forEach var="list" items="${list}">
							<tr>
							  <td><input type="hidden" name="ins_num[]" id="ins_num[]" value="${list.ins_num}"></td>
							</tr>
							<tr>
						  		<td>${list.ins_title}</td>
						  		<td><div name="ins_prices"><input type="hidden" name="ins_price" value="${list.ins_price}">${list.ins_price}</div></td>
							</tr>
					  	</c:forEach>
					  	<tr>
							<th>쿠폰</th>
							<td>			
						  		<select class="coupon">
									<c:forEach var="coupon" items="${coupon}">
					  					<option value="${coupon.c_discount}" num="${coupon.c_num}">${coupon.c_discount}</option>
									</c:forEach>
					  			</select>
						  	</td>
							<td><input type="button" class="btn btn-outline-success btn-sm" id="coupon" value="사용"></td>
						</tr>	
					  </table>
					 <h3></h3>
					  <div id="btnInsert">
					  	<h5>총 결제금액</h5>
					  	<div id="allprice"></div>
					  	<h3></h3>				  
							<input type="submit" value="구매" class="btn btn-success">
					  </div>	
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