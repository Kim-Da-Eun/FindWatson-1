<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>찾아줘 왓슨!</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<%--썸머노트 --%>
      <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/adminBoard.css">

</head>
<body>
<form action="${pageContext.request.contextPath}/expertWrite.admin" method="post" id=frm>
	<div class="container">

			<jsp:include page="../standard/headerAdmin.jsp" /> 		

		<!--            -->
		<div class="row">
			<div class="col-12 mb-3" id="article">
				<div class="row">
					<div id="article-middle" class="col-12 mt-2">
						<div class="row mb-3 p-1 text-center">
							<h3 id="board-top" class="col-auto col-sm-4 m-0">전문가 Q&A</h3>
							<span class="col-auto col-sm-8 mt-2"> <!-- 코멘트를 뭐라 적어야할지 모르겠... -->
							</span>
						</div>
						<div class="row">
							<div class="col-1 p-1">
								제목 : 
							</div>
							<div class="col-11 p-1">
								<input type="text" class="" id="boardTitle" name="boardTitle">
							</div>
						</div>
						<div class="row">
							<div class="col-12 p-1">
								<!-- 썸머노트 -->
								<textarea id = "summernote"></textarea><br>
							<textarea id=snInput class=noneExist name=content></textarea>
								<!-- 썸머노트 -->
							</div>
						</div>
						<div class="row mb-2">
							<div class="col-12 p-1 text-center">
								<button id="writeBtn" type="button"
									class="btn btn-sm btn-outline-secondary">작성</button>
									<button id="returnBtn" type="button"
									class="btn btn-sm btn-outline-secondary">돌아가기</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--            -->

		<jsp:include page="../standard/footer.jsp" />

	</div>
	</form>
	<script>
	//썸머노트 이미지 업로드
	$("#summernote").summernote({
		height : 600,
		tabsize: 2,
		callbacks : {
			onImageUpload : function(files) {
				var data = new FormData();
				data.append("expertImg", files[0]);

				$.ajax({
					url : "${pageContext.request.contextPath}/expertWriteImgUpload.admin",
					enctype : "multipart/form-data",
					type : "post",
					data : data,
					contentType : false,
					processData : false,
					cache : false,
					dataType : "json"
				}).done(function(resp) {
					console.log(resp.imgPath);
					var p = $("<p></p>");
					var img = $("<img>");
					$(img).attr("src", resp.imgPath);
					p.append(img);
					$(".note-editable").append(p);
				}).fail(function(a, b, c) {
					console.log("fail");
					console.log(a);
					console.log(b);
					console.log(c);
				});

			}
		}
	})
	
	//작성버튼
	$("#writeBtn").on("click",function(){
		var title = $("#boardTitle").val(); 
		var content = $(".note-editable").html();
		var regex = /<p>.{1}[^b].*?<\/p>/;
		var result = regex.exec(content);
		
		if( (title == "") || (result == null) ){
			alert("내용은 2줄이상 입력해주세요");
		}else{
			var result = confirm("정말 등록 하시겠습니까?");
			if(result){
				var contentReal = $(".note-editable").html();
				$("#snInput").val(contentReal);
				$("#frm").submit();
			}
		}
	})
	
	//등록하기 버튼
	$("#returnBtn").on("click",function(){
		var result = confirm("입력하신 내용은 저장되지 않습니다. 정말 돌아가시겠습니까?");
		if(result){
			location.href = '${pageContext.request.contextPath}/main/mainAdmin.jsp';
		}
	})
	

	

	</script>
</body>
</html>