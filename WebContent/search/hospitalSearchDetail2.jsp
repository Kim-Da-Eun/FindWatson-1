<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>병원상세검색2</title>
		<%--부트 스트랩 --%>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

		<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>


		<%--썸머노트 --%>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.css" rel="stylesheet">
		<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote-bs4.js"></script>

		<%--별점 --%>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="UTF-8">

<style>
* {
	box-sizing: border-box;
}

div {
		border: 1px solid green;
}

#logo {
	width: 500px;
	height: 100px;
	margin: auto;
	background-color: ghostwhite;
}

#article-img {
	width: 100%;
	height: 100px;
	margin: auto;
	background-color: ghostwhite;
}

#footer {
	height: 100px;
}

img {
	width: 500px;
}

#array {
	text-align: right;
}

.review>div {
	float: left;
}

.hosIn1 {
	height: 80%;
}

.hosIn2 {
	height: 20%;
}

#hosImg {
	width: 100%;
}

.center {
	text-align: center;
}
#page${cpage}{
	color : red;
}
#logo{
width:100%;
}
.checked {
                color: orange;
            }
.starCon{
display :inline;
}

.fa-star:hover{
cursor : pointer;
}
#titleReview{
width:58%;
}
#starInputCon{
width:100px;
display:inline;
}
#sss{
text-align:right;
width:150px;
display:inline;
position:absolute;
right:2%;
}
#ssss{
position:relative;
}
.noneExist{
display:none;
}
</style>
</head>
<body>
	<form action="${pageContext.request.contextPath}/reviewWrite.re" method="post" id=reviewSave>

		<div class="container">
			<div class="row">
				<div id="loginBtn" class="col-12 text-right">
					<button class="btn btn-sm btn-outline-secondary">로그인</button>
				</div>
			</div>
			<div class="row">
				<div id="title" class="col-12 mb-3">
					<div id="logo">로고이미지</div>
				</div>
			</div>
			<div class="row">
				<div id="navi" class="col-12 mb-3">
					<nav class="navbar navbar-expand-lg navbar-light bg-light">
						<a class="navbar-brand" href="#">Home</a>
						<button class="navbar-toggler" type="button"
							data-toggle="collapse" data-target="#navbarNav"
							aria-controls="navbarNav" aria-expanded="false"
							aria-label="Toggle navigation">
							<span class="navbar-toggler-icon"></span>
						</button>
						<div class="collapse navbar-collapse" id="navbarNav">
							<ul class="navbar-nav">
								<li class="nav-item"><a class="nav-link" href="#">공지사항</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">병원검색</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">전문가Q&A</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">커뮤니티</a>
								</li>
								<li class="nav-item"><a class="nav-link" href="#">마이페이지</a>
								</li>
							</ul>
						</div>
					</nav>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<h1>병원 이름</h1>
					<h5>정보수정일 2019.01.01 Total.100</h5>
					<hr>
				</div>
			</div>

			<div class=row>
				<div class="col-6">
					<img src="../imgs/hospital/김포우리병원계열.jpg" id=hosImg>
				</div>
				<div class="col-6">
					<div class="row hosIn1">
						<div class=col-12>
							동해물과 백두산이<br> 마르고 닳도록 하느님이 <br> 보우하사 우리나라 만세<br>
							무궁화 삼천리 화려강산<br> 대한사람 대한으로 길이 보전하리<br>
						</div>
					</div>
					<div class="row hosIn2">
						<div class=col-12>
							<button type="button" class="btn btn-secondary">정보 수정 제안</button>
						</div>
					</div>
				</div>
			</div>

			<div class=row>
				<div class=col-12>
					<br>
					<div class="btn-group" role="group" aria-label="Basic example">
						<button type="button" class="btn btn-secondary">상세정보</button>
						<button type="button" class="btn btn-secondary">지도</button>
						<button type="button" class="btn btn-secondary">후기</button>
					</div>
					<hr>
				</div>
			</div>
			<div class=row>
				<div class=col-12>
					<h2>후기</h2>
				</div>
			</div>

			<div class=row>
				<div class=col-12 id=array>
					<a href="${pageContext.request.contextPath}/hospitalSearchDetail2ByScore.re" id=scoreRange>별점순</a>
					<a href="${pageContext.request.contextPath}/hospitalSearchDetail2.re">최신순</a> 
					<a href="${pageContext.request.contextPath}/hospitalSearchDetail2ByLike.re" id=defaultRange>좋아요순</a>
				</div>
			</div>
			<c:choose>
			<c:when test="${list.size() == 0}">
			<div class=row>
			<div class=col-12>
			게시글이 존재하지 않습니다.
			</div>
			</div>
			</c:when>
			<c:otherwise>
			<c:forEach items="${reviewList}" var="dto"><%-------------------------------------------------------------------------------------------------- --%>
			<div class=row>
				<div class=col-2>
				<div class=starCon>
            <span class="fa fa-star" id="star1t${dto.seq}" onclick="addt${dto.seq}(this,1)"></span>
            <span class="fa fa-star" id="star2t${dto.seq}" onclick="addt${dto.seq}(this,2)"></span>
            <span class="fa fa-star" id="star3t${dto.seq}" onclick="addt${dto.seq}(this,3)"></span>
            <span class="fa fa-star" id="star4t${dto.seq}" onclick="addt${dto.seq}(this,4)"></span>
            <span class="fa fa-star" id="star5t${dto.seq}" onclick="addt${dto.seq}(this,5)"></span>
      
       				</div>
				</div>
				<div class=col-6>
				<p>
 				 <button class="btn btn-secondary" type="button" data-toggle="collapse" data-target="#collapse${dto.seq}" aria-expanded="false" 
 				 aria-controls="collapseExample">
				${dto.title}
				</button>
				</p>
				</div>
				<div class=col-2>${dto.writeDate}</div>
				<div class=col-2>
				${dto.writer} 
				<button type=button id="like${dto.seq}">좋아요</button> ${dto.likeCount}
				</div>
			</div>
			
			<div class="row collapse" id = "collapse${dto.seq}">
			<div class="col-12 card card-body">
			${dto.content}
			</div>
			</div>
			<script>
			//별점 - 출력
             var point = ${dto.score};
             $("#star"+point+"t${dto.seq}").trigger("click");
			
             function addt${dto.seq}(ths,sno){
                 for (var i=1;i<=5;i++){
                     var cur=document.getElementById("star"+i+"t" + ${dto.seq});
                     cur.className="fa fa-star";
                 }
                 for (var i=1;i<=sno;i++){
                     var cur=document.getElementById("star"+i+"t" + ${dto.seq});
                     if(cur.className=="fa fa-star")
                     {
                         cur.className="fa fa-star checked";
                         $("#rating").val(i);
                     }
                 }
             }
           //좋아요 기능
     		$("#like${dto.seq}").on("click",function(){
     			location.href="likeIncrement.re?seq="+${dto.seq};
     		}); 
             
			</script>
			</c:forEach><%------------------------------------------------------------------------------------------------------------------------------ --%>
			</c:otherwise>
			</c:choose>

			
			<div class=row>
			<div class="col-12 center">
			${navi}
			</div>
			</div>
			
			<div class=row>
				<div class=col-12 id=ssss>
					<h2>후기 남기기</h2>
					제목 : <input type="text" id=titleReview name=title>
					
					<div id = sss>
					별점 : 
					<div id=starInputCon>
            <span class="fa fa-star" id="star1" onclick="add(this,1)"></span>
            <span class="fa fa-star" id="star2" onclick="add(this,2)"></span>
            <span class="fa fa-star" id="star3" onclick="add(this,3)"></span>
            <span class="fa fa-star" id="star4" onclick="add(this,4)"></span>
            <span class="fa fa-star" id="star5" onclick="add(this,5)"></span>
            <input type="hidden" id="rating" value="1" name="rating">
       				</div>
       				</div>
					<br>

				</div>
			</div>
			<div class=row>
			<div class="col-12 center">
					<textarea id="summernote"></textarea><br>
					<textarea id=snInput class=noneExist name=content></textarea>
					<button id=reviewSaveBtn type=button>후기 등록</button>
			</div>
			</div>

			<div class="row">
				<div id="footer" class="col-12">푸터</div>
			</div>
		</div>
	</form>
	<script>
		//리뷰 등록 전 유효성 검사
		$("#reviewSaveBtn").on("click", function() {
			var title = $("#titleReview").val(); 
			var content = $(".note-editable").html();
			var regex = /<p>.{1}[^b].*?<\/p>/;
			var result = regex.exec(content);
			console.log(result);
			console.log(content);
			if( (title == "") || (result == null) ){
				alert("내용을 입력해주세요");
			}else{
				var result = confirm("정말 등록 하시겠습니까?");
				if(result){
					var contentReal = $(".note-editable").html();
					$("#snInput").val(contentReal);
					$("#reviewSave").submit();
				}
			}
			
		})

		//썸머노트 이미지 업로드
		$("#summernote").summernote({
			height : 600,
			tabsize: 2,
			callbacks : {
				onImageUpload : function(files) {
					var data = new FormData();
					data.append("reviewImg", files[0]);

					$.ajax({
						url : "${pageContext.request.contextPath}/imgUpload.re",
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
		//별점 함수 -입력
		 function add(ths,sno){
               for (var i=1;i<=5;i++){
                   var cur=document.getElementById("star"+i)
                   cur.className="fa fa-star"
               }
               for (var i=1;i<=sno;i++){
                   var cur=document.getElementById("star"+i)
                   if(cur.className=="fa fa-star")
                   {
                       cur.className="fa fa-star checked";
                       $("#rating").val(i);
                   }
               }
           }
		
		
	</script>

</body>
</html>