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
	#content2{
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
		font-size:20px;
		text-align: right;
		float: right;
	}
	#joinbtn{
		font-size:20px;
		width: 200px;
	}
	#privacy{
		display: none;
		height: 10.25em;
		border: none;
		resize: none;
	}
	#privacy2{
		display: none;
		height: 10.25em;
		border: none;
		resize: none;
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
			<div id="content" class="col-8 mh-80" >
				개인 정보 처리 방침<span>▼</span>
			</div>
				<div id="contentshow" class="col-8">
					<textarea id="privacy" rows="80px" cols="115px" >
						<%@ include file="../User/privacy.jsp" %>
					</textarea>
				</div>
			<div id="checkbox" class="col-6 justify-content-end">
				<input id="Checkbox1" type="checkbox" value=""> 네, 동의합니다
			</div>
			
			<div id="content2" class="col-8 mh-80" >
				전자상거래 표준약관<span>▼</span>
			</div>
				<div id="contentshow2" class="col-8">
					<textarea id="privacy2" rows="80px" cols="115px" >
						<%@ include file="../User/privacy2.jsp" %>
					</textarea>
				</div>
			<div id="checkbox" class="col-6 justify-content-end">
				<input id="Checkbox2" type="checkbox" value=""> 네, 동의합니다
			</div>
		</div>
	</div> <!-- py-5 text-center 끝 -->
</div><!-- container 끝 -->
<!-- 본인인증  -->
<div class="container">
</div><!-- container 끝 -->
<div class="container">
	<div class="text-center justify-content-md-center">
	<!-- href="<%= request.getContextPath()%>/User/userJoin.do?uType=normal" -->
	<!-- href="<%= request.getContextPath()%>/User/userJoin_business.do?uType=business" -->
		<a class="btn btn-primary"  onclick="return false;">
			<input id="joinbtn" class="w-btn w-btn-indigo" type="button" value="일반 회원가입" onclick="boxChecked();">
		</a>
		<a class="btn btn-primary"  onclick="return false">
			<input id="joinbtn" class="w-btn w-btn-indigo" type="button" value="사업자 회원가입" onclick="boxChecked2();">
		</a>
	</div>
</div><!-- container 끝 -->
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
<%@ include file="../include/footer.jsp" %>