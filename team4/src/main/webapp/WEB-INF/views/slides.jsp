<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" media="screen" href="./resources/slide/css/CSSreset.min.css" />
<link rel="stylesheet" type="text/css" media="screen" href="./resources/slide/css/als_demo.css" />
<script type="text/javascript" src="./resources/slide/als/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="./resources/slide/als/jquery.als-1.7.min.js"></script>
<script type="text/javascript">
			$(document).ready(function() 
			{
				$("#lista1").als({
					visible_items: 3,
					scrolling_items: 2,
					orientation: "horizontal",
					circular: "yes",
					autoscroll: "no",
					interval: 5000,
					speed: 500,
					easing: "linear",
					direction: "right",
					start_from: 0
				});
				
				$("#lista2").als({
					visible_items: 2,
					scrolling_items: 1,
					orientation: "vertical",
					circular: "yes",
					autoscroll: "no",
					start_from: 1
				});
				
				//logo hover
				$("#logo_img").hover(function()
				{
					$(this).attr("src","images/als_logo_hover212x110.png");
				},function()
				{
					$(this).attr("src","images/als_logo212x110.png");
				});
				
				//logo click
				$("#logo_img").click(function()
				{
					location.href = "http://als.musings.it/index.php";
				});
				
				$("a[href^='http://']").attr("target","_blank");
				$("a[href^='http://als']").attr("target","_self");
			});
		</script>
</head>
<body>

			<div id="lista1" class="als-container">
				<span class="als-prev"><img src="./resources/slide/images/thin_left_arrow_333.png" alt="prev" title="previous" /></span>
				<div class="als-viewport">
					<ul class="als-wrapper">
						 <c:forEach var="list" items="${insList}">
							<li class="als-item"><video src="./resources/videofiles/${list.ins_thumbnailsave}" width="380" height="200">영어</video></li>
            			 </c:forEach>
					</ul>
				</div>
				<span class="als-next"><img src="./resources/slide/images/thin_right_arrow_333.png" alt="next" title="next" /></span>
			</div>

</body>
</html>