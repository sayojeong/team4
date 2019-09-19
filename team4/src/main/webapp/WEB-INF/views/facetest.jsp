<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script defer src="./resources/js/face-api.min.js"></script>
<script defer src="./resources/js/script1.js"></script>
<script>
window.onblur = window.focus(); 
</script>
<style>
	body {
		padding: 0;
		width: 100vw;
		height: 100vh;
		display: flex;
		/* justify-content: center;
		align-items: center; */
	}
	canvas {
	position:absolute;
	}
</style>
</head>
<body>

	<video id="video" width="300" height="200" autoplay muted></video>
</body>
</html>