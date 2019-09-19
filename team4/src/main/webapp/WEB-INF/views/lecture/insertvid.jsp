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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>

<script>
	if(${msg != null}){
		alert('${msg}');
		opener.location.reload();
		self.close();
	}
	
    // 라인을 늘일 변수
	var uf = '';
    // sw_file_add_form div에 input 태그를 추가하는 함수
    function sw_file_add(size) {
        // 최초 sw_file_add_form에 추가하고 다음부터는 sw_file_add_form1, 2, 3, 4, ... 로 계속 추가가 된다.
        // 물론 그에 맞는 div도 계속 생성한다. 차후에 추가한 div를 제거하는 것도 필요하다.
        eval('sw_file_add_form' + uf).innerHTML +="<label>동영상 " + (uf+2) +"    </label><input type='file' name='vid' size='" + size + "'class='file-upload-default' >" 
        										+ "<br>"
												+ "<div id='sw_file_add_form" + (uf+1) + "'></div>";
			
        uf++;

    }
   

</script>
<style>
	#btnInsert {
		margin: auto; 
		text-align: left;
	}
	
	#yybtn {
		margin: auto; 
		text-align: center;
	}
</style>
</head>
<body>

<script>
/*
$(document).ready(function(){

		
	$("#btn").on('click', function(){
		
		$('#file').trigger('click');
		
	});
	
	$('#file').on('change', function(){
		var fileValue = $("#file").val().split("\\");
		var fileName = fileValue[fileValue.length-1]; // 파일명
		$("#btn").val(fileName);
	})
	
})
*/
</script>
<!--  <input type="button" value="file" id="btn"><p id="name"></p>
<input type="file" id="file" style="display: none;">	-->
	
<%-- <form method="post" enctype="multipart/form-data" action="fileUpload">
		동영상 1: <input type="file" name="vid" size="60">
		<!-- 여기에 추가가 된다. -->
        <div id="sw_file_add_form"></div>
        <a href="javascript:sw_file_add(60);">파일추가</a>
	<input type="hidden" name="ins_num" value="${vo.ins_num}">
	<input type="submit" value="파일저장">
</form> --%>

<div class="main-panel">
	 <div class="content-wrapper">
		<div class="row">
			<div class="col-md-6 grid-margin stretch-card">
              <div class="card">
                <div class="card-body">
                  
                  <form class="forms-sample" method="post" enctype="multipart/form-data" action="fileUpload">
                    <div class="form-group">
                      <label>동영상 1</label>
                      <input type="file" name="vid" size="60" class="file-upload-default">
                      <br>
                      <div id="sw_file_add_form"></div>
                    </div>

                    <div id="btnInsert">
       				   <a href="javascript:sw_file_add(60);">업로드 추가</a>
					   <input type="hidden" class="btn btn-outline-info btn-fw" name="ins_num" value="${vo.ins_num}">
	                   <h4></h4>
	                   <div id="yybtn"><button type="submit" class="btn btn-success" id="yybtn">강의 영상 등록</button></div>
                    </div>
					</table>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>     
</body>
</html>