<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font_style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" ></script>
<style>
	/* 비밀번호 감추기 보여주기 눈 스타일  */
	/* .input {
	position: relative;
	} */
	.modal-content
	{
	width: 700px
	}
	
	.input .eyes {
	position: absolute;
	top: 0;
	bottom: 0;
	right: 0;
	margin: auto ;
	height: 13px ;
	font-size: 25px;
	cursor: pointer;
}
</style>
<style>
body {
  height: 100%;
  text-align: center;
}

body {
  display: flex;
  align-items: center;
  padding-top: 10%;
  padding-bottom: 10%;
  background-color: #f5f5f5;
}

.form-signin {
  max-width: 400px;
  padding: 1rem;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input[type="id"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

button,main
{
	width: 100%;
	margin: auto;
}

</style>
</head>
<!-- 구버전 로그인 폼  -->
<%-- <form name="login" id="login" >
<div style=" width:20%; padding : auto; margin: auto">
ID : <input type="text" id="uId"  name="uId" style="width: 100%;"><br>
	<div class="input password">
PW : <input type="password" id="uPw"  name="uPw" style="width: 100%;">
		<div class="eyes">
			<i class="fas fa-eye"></i>
		</div>
	</div>
	<br>
<div id="msg_login"></div>
<button type="button" id="loginbtn" onclick="loginFn();">로그인</button>
<input type="button" value="취죠" onclick="location.href='<%= request.getContextPath()%>/reHome.do'">
<input type="text" placeholder="힘들다 힘들어 힘들다고!!! ">
</div >
</form> --%>

<body>
	<main class="form-signin " style="font-family: 'TheJamsil5Bold';">
		<!-- 버튼 클릭시 메인으로 이동 -->
		<a class="navbar-brand mb-5" href="<%= request.getContextPath()%>/reHome.do" title="Arcalive">
		<!-- <svg xmlns="http://www.w3.org/2000/svg" width="72" height="52" fill="currentColor" class="bi bi-google-play" viewBox="0 0 16 16">
			<path d="M14.222 9.374c1.037-.61 1.037-2.137 0-2.748L11.528 5.04 8.32 8l3.207 2.96 2.694-1.586Zm-3.595 2.116L7.583 8.68 1.03 14.73c.201 1.029 1.36 1.61 2.303 1.055l7.294-4.295ZM1 13.396V2.603L6.846 8 1 13.396ZM1.03 1.27l6.553 6.05 3.044-2.81L3.333.215C2.39-.341 1.231.24 1.03 1.27Z"/>
		</svg> -->
		<img class="text-center mb-5" src="${pageContext.request.contextPath}/resources/img/logo_test4.png" width="290px" height="80px" >
		</a>
		<!--하단 마진 3px -->
		<span id="toptitle" class="h3 mb-3 fw-normal"><img></span>
		<!-- 로그인 폼 -->
		<!--  -->	
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				 <div class="modal-dialog modal-xl modal-dialog-scrollable justify-content-center d-flex">
				   <div class="modal-content justify-content-center">
				     <div class="modal-header">
				       <h1 class="modal-title fs-5" id="exampleModalLabel">개인 정보 처리 방침</h1>
				       <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				     </div>
				     <div class="modal-body" id="privacy">
					<%@ include file="../User/privacy.jsp" %>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
			
				<div class="form-floating my-3">
					<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal">
						개인 정보 처리 방침
					</button>
					<div id="checkbox" class="col-6 justify-content-end">
						<input id="Checkbox1" type="checkbox" value=""> 네, 동의합니다
					</div>
				</div>			
				<!-- Button trigger modal -->
				<div class="modal fade" id="exampleModal1" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-xl modal-dialog-scrollable justify-content-center d-flex">
						<div class="modal-content justify-content-center">
							<div class="modal-header">
								<h1 class="modal-title fs-5" id="exampleModalLabel">전자상거래 표준약관</h1>
								<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
							</div>
							<div class="modal-body" id="privacy">
							<%@ include file="../User/privacy2.jsp" %>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
							</div>
						</div>
					</div>
				</div>
			
				<div class="form-floating">
					<button type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#exampleModal1">
						전자상거래 표준약관
					</button>
					<div id="checkbox" class="col-6 justify-content-end">
						<input id="Checkbox2" type="checkbox" value=""> 네, 동의합니다
					</div>
				</div>			
				<!--하단 마진 3px -->
				<div class="container form-floating my-4">
					<div class="container d-flex justify-content-between">
						<button class="btn btn-primary mx-1" id="joinbtn" type="button" value="일반 회원가입" onclick="boxChecked();">
							일반 회원가입
						</button>
						<button class="btn btn-primary mx-1" id="joinbtn" type="button" value="사업자 회원가입" onclick="boxChecked2();">
							사업자 회원가입
						</button>
					</div>
				</div>
	</main>

<script type="text/javascript">
	/* 내용 보여주기 숨기기  */
	window.onload = function(){
		var content = document.getElementById("content");
		var content2 = document.getElementById("content2");
		content2.onclick = getShow2;
		content.onclick = getShow;
	}
	function getShow(){
		if($("#privacy").css("display") == "none"){
		$("#privacy").css("display","block");
		}else{
			$("#privacy").css("display","none");
		}
	}
	function getShow2(){
		if($("#privacy2").css("display") == "none"){
			$("#privacy2").css("display","block");
			}else{
				$("#privacy2").css("display","none");
			}
	}
	/* 체크박스 여부  */
	/* $("#Checkbox1").click(function(){
		var checked = $('#Checkbox1').is(':checked');
		$('#Checkbox1').prop('checked',!checked);
	}); */
	
	var Checkbox1 = document.getElementById("Checkbox1");
	var Checkbox2 = document.getElementById("Checkbox2");
	
	function boxChecked()
	{
		console.log(Checkbox1);
		console.log(Checkbox2);
		if( Checkbox1.checked == false || Checkbox2.checked == false ){
			alert("이용약관(정보처리) 체크를 해주세요 ");
			return false;
		}else{
			location="<%= request.getContextPath()%>/User/userJoin.do?uType=normal";
		}
	}
	function boxChecked2()
	{
		console.log(Checkbox1);
		console.log(Checkbox2);
		if( Checkbox1.checked == false || Checkbox2.checked == false ){
			alert("이용약관(정보처리) 체크를 해주세요 ");
			return false;
		}else{
			location="<%= request.getContextPath()%>/User/userJoin_business.do?uType=business";
		}
	}
	
</script>
</body>
</html>