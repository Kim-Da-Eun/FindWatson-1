<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아줘! 왓슨</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminBoard.css">
<style>
#boardContent{
min-height: 500px;
}
</style>
</head>
<body>
<!-- container -->
	<div class="container col-12">
	
	<!-- 헤더 -->
	<jsp:include page="../standard/headerAdmin.jsp" />   
	     
	<div class="row mt-2">
	    <div class=container>
	        
	        <!-- 중심내용 -->
	      <div class=row>
		<div class=col-12>
		<h3>커뮤니티 - 질문</h3>
		<hr>
				<h4>${dto.title}</h4>
		</div>
		</div>
		<div class=row>
			<div class=col-6>
				<h5>${dto.writer}</h5>
			</div>
			<div class="col-6">
				<h5 class="right">${dto.getDate()}&emsp;view.${dto.viewCount}</h5>
			</div>
			<div class=col-12><hr></div>
			<hr>
		</div>
		<div class=row>
			<div class=col-12 id=boardContent>${dto.content}</div>
			<div class=col-12><hr></div>
		</div>
	        <!-- 중심내용 -->
	        
	    </div>
	</div>
	
	<!-- 푸터-->
	<jsp:include page="../standard/footer.jsp" />
	
	</div>
<!-- container --> 
</body>
</html>