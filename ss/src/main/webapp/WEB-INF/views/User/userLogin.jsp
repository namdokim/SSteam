<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
/>
<!-- action="<%= request.getContextPath()%>/User/userLoginAction.do" -->

<style>
	/* 비밀번호 감추기 보여주기 눈 스타일  */
	.input {
	position: relative;
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
<!-- 로그인 폼  -->
<form name="login" id="login" >
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

</form>
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
<%@ include file="../include/footer.jsp" %>