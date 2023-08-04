<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
		<title>로그인</title>
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
/>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" >
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" ></script>
<style>
	/* 비밀번호 감추기 보여주기 눈 스타일  */
	/* .input {
	position: relative;
	} */
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
  max-width: 500px;
  padding: 15px;
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
	<main class="form-signin">
		<!-- 버튼 클릭시 메인으로 이동 -->
		<a class="navbar-brand" href="<%= request.getContextPath()%>/reHome.do" title="Arcalive">
		<!-- <svg xmlns="http://www.w3.org/2000/svg" width="72" height="52" fill="currentColor" class="bi bi-google-play" viewBox="0 0 16 16">
			<path d="M14.222 9.374c1.037-.61 1.037-2.137 0-2.748L11.528 5.04 8.32 8l3.207 2.96 2.694-1.586Zm-3.595 2.116L7.583 8.68 1.03 14.73c.201 1.029 1.36 1.61 2.303 1.055l7.294-4.295ZM1 13.396V2.603L6.846 8 1 13.396ZM1.03 1.27l6.553 6.05 3.044-2.81L3.333.215C2.39-.341 1.231.24 1.03 1.27Z"/>
		</svg> -->
		<img src="<%=request.getContextPath() %>/img/loginlogo2.jpg" style="width:420px; height: 230px;"><br>
		<img src="<%=request.getContextPath() %>/img/loginicon.png" style="width:400px; height: 50px;">
		</a><br>
		<!--하단 마진 3px -->
		<span id="toptitle" class="h3 mb-3 fw-normal"><img></span>
		<!-- 로그인 폼 -->
		<!--  -->	
			<form name="login" id="login">
				<div class="form-floating">
					<input type="text" class="form-control" id="uId" placeholder="uId" name="uId">
					<label for="floatingInput" class="text-muted">ID</label>
				</div>			
				<div class="form-floating">
					<input type="password" class="form-control" id="uPw" placeholder="uPw" name="uPw">
					<label for="floatingPassword" class="text-muted">Password </label>								
				</div>
				<!-- <i class=" input password eyes fas fa-eye"></i> -->
				<!--하단 마진 3px -->
				<div class="checkbox mb-3">
					<label>
						<input type="checkbox" value="remember-me" class="text-muted"> Remember me
					</label>
				</div>
				<button class="btn btn-lg btn-primary" type="button" id="loginbtn" onclick="loginFn();">
					log in
				</button>
			</form>
			<span class="h4 mb-3 fw-normal">don't you have account?</span>
			<button class="btn btn-lg btn-secondary" onclick="window.location.href='<%= request.getContextPath() %>/User/userJoin.do'">
			    create account
			</button>
			<p></p>
			<p class="text-center text-muted">Live v0.011&nbsp;<small class="text-muted">(000000)</small>
					<span class="sep"></span>
					<a href="mailto:leghorn0897@gmail.com">contact</a>
					<span class="sep"></span>
					<a href="https://arca.live/policy?gt=1#googtrans(ko)">PRIVACY POLICY AND RULES OF USE</a>
				</p>
				<p class="text-center text-muted">operate for leghorn_
					<span class="sep"></span>
					make with &lt;3  jeonju, republic of korea
				</p>
	</main>

<script type="text/javascript">
$(function(){
	  // 눈표시 클릭 시 패스워드 보이기
	  $('.eyes').on('click',function(){
	    $('.input.password').toggleClass('active');

	    if( $('.input.password').hasClass('active') == true ){
	    	$(this).find('.fa-eye').attr('class',"fas fa-eye-slash").parents('.input').find('#uPw').attr('type','text');
	    				// i 클래스                // 텍스트 보이기 i 클래스
	    }
	    else{
	    	$(this).find('.fa-eye-slash').attr('class',"fas fa-eye").parents('.input').find('#uPw').attr('type','password');
	    }
	  });
	});
	
</script>
<!-- 로그인 유효성 검사  -->
<script>
/* 버튼에 타입 버튼  안주면은 무조건 submit타입으로 인식해서 서브밋이 되는건가  */
//async: false,     //값을 리턴시 해당코드를 추가하여 동기로 변경 ajax에서 return 값 얻을떄 
function loginFn(){
	var uId = $("#uId");
	var uPw = $("#uPw");
	if (uId.val() == "" ){
		alert("아이디를 입력하세요");
		$("#uId").focus();
	}else if ($("#uPw").val() == ""){
		alert("비밀번호를 입력하세요");
		$("#uPw").focus();
	}else
	{
		var frm = $("#login").serialize();
		console.log("frm="+frm);
		$.ajax({
			url : "loginFn.do",
			data : frm,
			type : "POST",
			success:function(data){
				console.log(data);
				/* 설마 없는 거라서 무조건 인식 안되니까 그 후가 안되는건가   data를 왜 안 찍어주는걸까 */
				if(data.trim() == "FAIL"){
					console.log(data);
					alert("아이디 비밀번호가 틀렸습니다");
				}else if(data.trim() == "FAIL2"){
					console.log(data);
					alert("없는 회원 정보 입니다 ");
				}else if(data.trim() == "Y"){
					alert("로그인 되셧습니다 ");
					$("#login").submit();
					location.href = "<%= request.getContextPath() %>/";
				}else
				{
					alert("null 값????");
					<%-- location.href = "<%= request.getContextPath() %>/"; --%>
				}
			},
			 error: function() {
				console.log("에러 발생");
			}
		}); //에이작스 끝 
	}
	<%-- 
	var fm = document.frm;
	//이 경로로 데이터를 감추어서 전송한다
	 fm.action ="<%=request.getContextPath()%>/User/userLoginAction.do"; 
	fm.method = "post";
	fm.submit();   // 전송
	return;
	 --%>
}

</script>
<script type="text/javascript">
</script>
	</body>
</html>