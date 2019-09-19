<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쿠폰</title>
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
<script src="../resources/js/jquery-3.4.1.js"></script>
<script>
$(document).ready(function(){   
    $('.delete').on('click', b_delete);
 })
 
function b_delete() {
	
	var c_num = $(this).attr('num');
	
	$.ajax({
		url:'c_delete',
		type:'post',
		data:{c_num:c_num},
		success:function(){
			/*새로고침 */
			location.reload(true);
		},
		error:function(e){
			alert('삭제실패');
		}
	})
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
              		<h5 align="center">쿠폰</h5>             
                    <div class="form-group"  id="basketList">
                      <table>
                      	<tr>
						  <th>이름</th>
						  <th>가격</th>
						</tr>
                      	<c:forEach var="list" items="${list}">
							<tr>
								<td>${list.c_name}&nbsp&nbsp</td>
								<td>${list.c_discount}원&nbsp&nbsp</td>
								<td><input type="button" id="delete" class="btn btn-outline-success btn-sm" value="삭제" num="${list.c_num }"></td>
							</tr>
						</c:forEach>
					  </table>
                   </div>
                 </div>
              </div>
            </div>
         </div>
       </div>
    </div>   
</body>
</html>