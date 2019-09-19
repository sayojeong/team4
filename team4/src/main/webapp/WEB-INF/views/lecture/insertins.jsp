<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

</style>
<script>
	function formck(){
		var title = document.getElementById('ins_title');
		var des = document.getElementById('ins_des');
		var cate = document.getElementById('category');
		var price = document.getElementById('ins_price');
		
		if(title.value == ''){
			alert('제목을 입력해 주세요');
			return false;
		}
		if(des.value == ''){
			alert('강의 설명을 입력해 주세요');
			return false;
		}
		if(cate.value == '선택'){
			alert('카테고리를 선택해 주세요');
			return false;
		}
		if(price.value == ''){
			alert('가격을 입력해 주세요');
			return false;
		}
		if(isNaN(price.value)){
			alert('숫자를 입력해 주세요')
			return false;
		}
		return true;
		
	}
	if(${ok != null}){
		alert('강의가 등록 되었습니다.');
		opener.location.reload();
		self.close();
		
	}
	if(${msg != null}){
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
                  
                  <form class="forms-sample" action="insertins" method="post" onsubmit="return formck()">
                    <div class="form-group">
                      <label>강의 제목</label>
                      <input type="text" class="form-control" id="ins_title" name="ins_title" size="30" style="resize: none;">
                    </div>
                    <div class="form-group">
                      <label>강의 설명</label>
                      <textarea class="form-control" id="ins_des" name="ins_des" rows="4"></textarea>
					</div>
		            <div class="form-group">
                      <label>카테고리</label>
                        <select class="form-control" id="category"  name="ins_cate">
                            <option value="선택" >선택</option>
							<option value="초급" >초급</option>
							<option value="중급" >중급</option>
							<option value="고급" >고급</option>
                        </select>
                    </div>
                    
                    <div class="form-group">
                      <label>가격</label>
                      <input type="text" class="form-control" id="ins_price" name="ins_price" size="30">
                    </div>
                    <div id="btnInsert">
	                   <button type="submit" class="btn btn-success">등록하기</button>
	                   <button type="reset" class="btn btn-outline-success btn-fw">다시쓰기</button>
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