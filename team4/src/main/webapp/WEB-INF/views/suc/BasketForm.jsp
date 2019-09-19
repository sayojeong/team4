<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>
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
    $('#delete').on('click', b_delete);
 })
 
function b_delete() {
	
	var ins_num = $(this).attr('num');
	//alert(ins_num);
	
	$.ajax({
		url:'basketDelete',
		type:'post',
		data:{ins_num:ins_num},
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
              		<h5 align="center">장바구니</h5>             
                  <form class="forms-sample" action="basketBuy" method="post">
                    <div class="form-group"  id="basketList">
                      <table>
							<tr>
								<th colspan="2">강의명</th>
								<th>강의가격</th>
							</tr>
						 <c:forEach var="list" items="${list}">
							<tr>
								<td><input type="checkbox" name="ins_num[]" class="ckbox" value="${list.ins_num }">&nbsp&nbsp</td>
								<th>${list.ins_title}&nbsp&nbsp</th>
								<th>${list.ins_price}&nbsp&nbsp</th>
								<th><input type="button" id="delete" class="btn btn-outline-success btn-sm" value="삭제" num="${list.ins_num }"></th>
							</tr>
						 </c:forEach>	
					  </table>	
					 </div>
					 <div id="btnInsert"> 
					 	<c:if test="${ list !=null && listLength > 0  }">       
					 	<input type="submit" value="구매" class="btn btn-success">
					 	</c:if>
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