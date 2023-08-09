<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
	<!-- 메인 화면  -->
<style>
	.content
	{
	/* height: auto;
	width: auto; */
	background-color: #99ccff;
	}
	#content{
	font-size: 40px;
	text-align:center;
	height: 60px;
	background-color: #99ccff;
	/* line-height : 40px; */
	
	}
	input[type="checkbox"] {
	width: 24px; 
	height: 24px;
	}
	#checkbox
	{
		font-size:24px;
		text-align: right;
		float: right;
	}
	#joinbtn{
		font-size:20px;
		width: 200px;
	}
</style>
<style>
	/* 버튼 꾸미기  */
	button {
	margin: 20px;
	}
	.w-btn {
    position: relative;
    border: none;
    display: inline-block;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}
.w-btn-outline {
    position: relative;
    padding: 15px 30px;
    border-radius: 15px;
    font-family: "paybooc-Light", sans-serif;
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
    text-decoration: none;
    font-weight: 600;
    transition: 0.25s;
}
.w-btn-indigo {
    background-color: aliceblue;
    color: #1e6b7b;
}

.w-btn-indigo-outline {
    border: 3px solid aliceblue;
    color: #1e6b7b;
}

.w-btn-indigo-outline:hover {
    color: #1e6b7b;
    background: aliceblue;
}


.w-btn:hover {
    letter-spacing: 2px;
    transform: scale(1.2);
    cursor: pointer;
}
.w-btn:active {
    transform: scale(1.5);
}
</style>
<div class="container">
	<div class="py-5 text-center">
		<!-- 메인화면 상단 로고 이미지 -->
			<div class="mb-3"><img src="<%=request.getContextPath() %>/img/joinicon.png" style="width:320px; height: 130px;"></div>
		<div class="row justify-content-md-center" >
			<div id="content" class="col-8 mh-100">
				개인 정보 처리 방침<span>▼</span>
			</div>
			<div id="checkbox" class="col-6 justify-content-end">
				<input type="checkbox"> 네, 동의합니다
			</div>
			<div id="content" class="col-8 mh-100">
				전자상거래 표준약관<span>▼</span>
			</div>
			<div id="checkbox" class="col-6 justify-content-end">
				<input type="checkbox"> 네, 동의합니다
			</div>
		</div>
	</div> <!-- py-5 text-center 끝 -->
</div><!-- container 끝 -->
<!-- 본인인증  -->
<div class="container">
</div><!-- container 끝 -->
<div class="container">
	<div class="text-center justify-content-md-center">
		<form >
				<a class="btn btn-primary" href="<%= request.getContextPath()%>/User/userJoin.do"><input id="joinbtn" class="w-btn w-btn-indigo" type="button" value="일반 회원가입"></a>
				<a class="btn btn-primary" href="<%= request.getContextPath()%>/User/userJoin_business.do"><input id="joinbtn" class="w-btn w-btn-indigo" type="button" value="사업자 회원가입"></a>
		</form>
	</div>
</div><!-- container 끝 -->
<%@ include file="../include/footer.jsp" %>