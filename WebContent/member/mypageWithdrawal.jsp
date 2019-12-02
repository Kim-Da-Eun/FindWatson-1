<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <title>찾아줘 왓슨!</title>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		
		<link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="../resources/css/mainStyle.css">
     
</head>
<body>

<div class="container">
            <jsp:include page="../standard/headerMember.jsp" />  
            <!--            -->
 <div class= row>
                        <div class= col-12>
                            <h2>회원 탈퇴</h2>
                            <hr>
                            <br>
                        </div>
                    </div>
                    <div class=row>
                        <div class=col-12>
                            비밀번호 재입력
                            <input type="text" id=pw><br>
                            비밀번호 확인
                            <input type="text" id=pwRe><br>
                            <form action="${pageContext.request.contextPath}/mypageWithdrawal.member" method="post" id=frm>
                            <div id=pwCheck></div>
                            <button id=withdrawal>탈퇴하기</button>
                            </form>
                        </div>
                    </div>

            <!--            -->
            <jsp:include page="../standard/footer.jsp" />
        </div>
        <script type="text/javascript">
        $("#logout").on("click",function(){
        	location.href="../index.jsp"
        })
            $("#pwRe").on("keyup",function(){
                var pw = $("#pw").val();
                var pwRe = $("#pwRe").val();

                if(pw != pwRe){
                    $("#pwCheck").html("두 비밀번호가 일치하지 않습니다.");
                }else{
                     $("#pwCheck").html("");
                }
            })
            $("#pw").on("keyup",function(){
                var pw = $("#pw").val();
                var pwRe = $("#pwRe").val();

                if(pw != pwRe){
                    $("#pwCheck").html("두 비밀번호가 일치하지 않습니다.");
                }else{
                     $("#pwCheck").html("");
                }
            })
            $("#withdrawal").on("click",function(){
                if( $("#pwCheck").html() != ""){
                    alert("입력하신 두 비밀번호가 일치하지 않습니다. 다시 확인 부탁드립니다.");
                }else{
                    if(result){
                        $.ajax({
                            url :"pwCheck.",
                            type:"post",
                            data:{
                                pw:$("#pw").val()
                            },
                            dataType:"json"
                        }).done(function(){
                           //result받아서 true면 confirm으로 한번더 확인 false면 alert으로 비밀번호 불일치 알림
                        }).fail(function(){
                            location.href="error.jsp";
                        })
                    }
                }

            })
        </script>
</body>
</html>