<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="../resources/js/jquery-3.4.1.js"></script>
<title>Insert title here</title>
 <script>
            //카운트 시작 숫자
            var count = 5;
            //카운트다운함수
            var countdown = setInterval(function(){
            //해당 태그에 아래 내용을 출력
            $("p.countdown").html("<b><font color='blue' size='90pt'>&nbsp;&nbsp;&nbsp;"
            + count + "</font><b><p></p>");
                //0초면 초기화 후 강의중 비디오 멈추고 사이렌과 함게 경고
                if (count == 0) {
                    clearInterval(countdown);
                    opener.video2.pause();
					opener.siren.play();
                    opener.alert("학습에 집중해 주세요!")
                    self.close();
                    }
                count--;//카운트 감소
            }, 1000);
        </script>
</head>
<body>
	<p class="countdown"></p>
</body>
</html>