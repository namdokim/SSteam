<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
function DoRewrite()
{
	$("#uId").val("").focus();
}
</script>


<style>
	tr{
		text-align: center;
		padding: auto;
		width: 40%;
	}
	input::placeholder
	{
		text-align: center;
		color: 
	}
</style>
<!-- 회원가입 입력 란  -->
	<form name="join" id="join" method="post" action="<%= request.getContextPath()%>/User/userJoinAction.do">
		<table border="1" style="align-content: center; width:50%; padding : auto; margin: auto">
			<tr id="loginid" name="loginid">
				<td style="width:60%;">
					<input type="text" id="uId" name="uId" style="width:100%" placeholder="Email로 써주세요" required value="">
					
				</td>
				<td>	
					@<select id="uId_email" name="uId_email" style="width: 90%;" onchange="email();">	
						<option value="">도메인을 선택해주세요</option>
						<option value="@naver.com">naver.com</option>
						<option value="@daum.net">daum.net</option>
						<option value="@hanmail.net">hanmail.net</option>
						<option value="@gmail.com">gmail.com</option>
						<option value="@kakao.com">kakao.com</option>
						<option value="@nate.com">nate.com</option>
						<option value="@outlook.com">outlook.com</option>
						<option value="@hotmail.com">hotmail.com</option>
					</select>
				</td>
				<td>
					<!-- <input type="button" value="중복확인" id="userIdCheck" onclick="idCheck();"> -->
					<input type="button" value="인증하기" id="emailCheck" onclick="emailAuth();">
					<input type="button" value="중복확인" id="emaildomain" onclick="emailcheck();">
					<input type="hidden" name="idchecked" value="checkednot">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="hidden" class="mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" maxlength="6">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<span id="msg_id"></span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<span id="msg_email"></span>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" id="uPw" name="uPw" style="width:100%;" placeholder="비밀번호" required value="">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" id="uPwc" name="uPwc" style="width:100%;" placeholder="비밀번호 확인"required value="">
					<span id="msg_pw"></span>
				</td >
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" id="uName" name="uName" style="width:100%;" placeholder="이름" required value="">
				</td>
				<td >
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" id="uNick" name="uNick" style="width:100%;" placeholder="닉네임" required value="">
					<div><input type="hidden" ></div>
					<span id="msg_nick"></span>
				</td>
				<td>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" id="uPhone" name="uPhone" style="width:100%;" placeholder="전화번호(ex= 01012345678)" required value="">
					<input type="button" id="Auth" name="Auth" onclick="Authentication();" value="Auth"> 
				</td>
				
			</tr>
			<tr>
				<td colspan="2">
					<div>
						<input type="text" id="" name="" style="width:100%;" placeholder="우편번호">
					</div>
				</td>
				<td>
						<input type="button" value="우편번호찾기">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div>
						<input type="text" id="uAdds" name="uAdds" style="width:100%;" placeholder="주소입력 란">
						<input type="text" id="uAdds_sub" name="uAdds_sub" style="width:100%;" placeholder="우편번호를 찾아주세요">
					</div>
				</td>
			</tr>
			<tr >
				<td id="jbar" colspan="3" style="text-align:center;">
					<!-- <a href="javascript:DoSubmit();" onclick="javascript:document.join.DoSubmit()" id="check" class="btn sfn">가입하기</a> -->
					<!-- <input type="submit" value="가입하기" onclick="false DoSubmit();"> -->
					<button type="button" value="가입하기" onclick="DoSubmit();">회원가입</button>
					<a href="javascript:DoRewrite()"><input type="button" value="다시쓰기"></a>
					<a href="<%=request.getContextPath() %>/index.jsp"><input type="button" value="취소"></a> 
				</td>
			</tr>
		</table>
		
	</form>
<!-- api 연동 -->
<script type="text/javascript">
//coolsms
//비바톤
//나이스아이디
//facebook account kit
</script>
<script type="text/javascript">
	$("select[name=uId_email]").change(function(){
		console.log($(this).val());
	});
</script>
<!-- 이메일 인증  -->
<script type="text/javascript">
	function emailAuth()
	{
		$(".mail-check-input").prop("type","text");
		var frontuId = $("#uId").val();
		var uId_email =$("#uId_email").val();
		var	checkinput = $(".mail-check-input") //인증번호 입력 창 
		if( frontuId.trim() == "")
		{
			$("#msg_id").text("이메일 이름을 써주세요");
			$("#msg_id").css("color","#FE642E");
			$("#uId").focus();
		}else if( uId_email.trim() == "")
		{
			$("#msg_id").text("도메인을 선택해주세요");
			$("#msg_id").css("color","#FE642E");
			$("#uId_email").focus();
		}else{
			var uId = frontuId+uId_email;
			uId.trim();
			console.log("emailAuth="+uId);
			$.ajax({
				url: "<%= request.getContextPath()%>/User/emailAuth.do",
				type : "POST",
				data : {"uId": uId},
				success :function(data){
					//히든 값 변경으로 인증번호 쓰기 
					console.log("emailAuth="+data);
					code = data;
				},
				error : function(){
					alert("요청실패");
				}
			});
		}
	}
	
	$('.mail-check-input').blur(function () {
		var inputCode = $(this).val();
		const $resultMsg = $('#msg_email');
		
		if(inputCode === code){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			$('#mail-Check-Btn').attr('disabled',true);
			$('#userEamil1').attr('readonly',true);
			$('#userEamil2').attr('readonly',true);
			$('#userEmail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
	         $('#userEmail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color','red');
		}
	});
	
</script>
<!-- 포트원 연결  -->
<script type="text/javascript">

	function Authentication()
	{
		const IMP = window.IMP;      // 생략 가능
		IMP.init("imp28316721"); // 예: imp00000000
		
		// IMP.certification(param, callback) 호출
		  IMP.certification({ // param
		    // 주문 번호
		    pg:'A010002002',//본인인증 설정이 2개이상 되어 있는 경우 필
		    //merchant_uid : 'merchant_' + new Date().getTime(),
		    // 모바일환경에서 popup:false(기본값) 인 경우 필수
		    m_redirect_url : "https://api.iamport.kr/certifications/otp/request", 
		    // PC환경에서는 popup 파라미터가 무시되고 항상 true 로 적용됨
		    popup : true
		    
		  }, function (rsp) { // callback
		    if (rsp.success) {
		      // 인증 성공 시 로직,
		    	 console.log(rsp.imp_uid);
		         console.log(rsp.merchant_uid);
		         
		         $.ajax({
		 				type : 'POST',
		 				url : '/certifications/confirm',
		 				dataType : 'json',
		 				data : {
		 					imp_uid : rsp.imp_uid
		 				}
		 		 }).done(function(rsp) {
		 		 		// 이후 Business Logic 처리하시면 됩니다.
		 		 });
		    } else {
		      console.log("222");
		      // 인증 실패 시 로직,
		      
		    }
		  });
	}// 인증 함수 끝
</script>
	
	<!-- 최종 서브밋  -->
<script type="text/javascript">
	//중복체크및 일치 확인 여부 
		var uNickDup	= false;
		var uIdDup		= false;
		var uPwDup		= false;
		var uIdemailDup	= false;
	//id 중복체크
	function emailcheck(){
		var frontuId = $("#uId").val();
		var uId_email =$("#uId_email").val();
		if( frontuId.trim() == "")
		{
			$("#msg_id").text("이메일 이름을 써주세요");
			$("#msg_id").css("color","#FE642E");
			$("#uId").focus();
		}else if( uId_email.trim() == "")
		{
			$("#msg_id").text("도메인을 선택해주세요");
			$("#msg_id").css("color","#FE642E");
			$("#uId_email").focus();
		}else
		{
			$("#msg_id").text("둘 다 완료 됫을떄 "+frontuId+uId_email);
			var uId = frontuId+uId_email;
			console.log(uId);
			$.ajax({
				url : "<%= request.getContextPath()%>/User/uIdCheck.do",
				type : "POST",
				data : {"uId": uId},
				dataType : "JSON",
				success :function(data){
					if(data.uId == 1 || data.uId >= 2){
						
						$("#msg_id").text("이미 사용중입니다");
						$("#msg_id").css("color","#dc3545");
						uIdDup = false;
						uIdemailDup = false;
						console.log(uIdDup);
						console.log();
						
					}else{
						$("#msg_id").text("사용 가능합니다");
						$("#msg_id").css("color","#2E2EFE");
						uIdDup = true;
						uIdemailDup = true;
						console.log("uIdDup ajax1="+uIdDup);
					}
				},
				error : function(){
					alert("요청실패");
				}
				}); //ajax 끝 
			uIdDup = false;
			console.log("uIdDup ajax2="+uIdDup);
		}
	}
	<%-- 
	$("#uId").on("propertychange change keyup paste input",function(){
		var uId = $("#uId").val();
		var uId_email =$("#uId_email").val();
		$.ajax({
			url : "<%= request.getContextPath()%>/User/uIdCheck.do",
			type : "POST",
			data : {"uId": uId},
			dataType : "JSON",
			success :function(data){
				if(data.uId == 1 || data.uId >= 2){
					
					$("#msg_id").text("이미 사용중입니다");
					$("#msg_id").css("color","#dc3545");
					uIdDup = false;
					console.log(uIdDup);
					console.log();
					
				}else{
					$("#msg_id").text("사용 가능합니다");
					$("#msg_id").css("color","#2E2EFE");
					uIdDup = true;
					console.log(uIdDup);
				}
			},
			error : function(){
				alert("요청실패");
			}
			}); //ajax 끝 
		
	});
	 --%>
	// 닉네임 중복 체크 
		$("#uNick").keyup(function(){
			var uNick = $("#uNick").val();
				
			$.ajax({
				url : "<%= request.getContextPath()%>/User/uNickCheck.do",
				type : "POST",
				data : {"uNick": uNick},
				dataType : "JSON",
				success :function(data){
					console.log(data.uNick);
					if(data.uNick == 1 || data.uNick >= 2){
						console.log("실행 되남???");
						$("#msg_nick").text("이미 사용중입니다");
						$("#msg_nick").css("color","#dc3545");
						uNickDup = false;
						var check = data.uNick;
						
					}else{
						$("#msg_nick").text("사용 가능합니다");
						$("#msg_nick").css("color","#2E2EFE");
						uNickDup = true;
					}
				},
				error : function(){
					alert("요청실패");
				}
			});
			//return;
		});

	//비밀번호 확인 절차
		$("#uPwc").keyup(function(){
			var uPw		= $("#uPw").val();
			var uPwc	= $("#uPwc").val();
			
			if(uPw == uPwc)
			{
				$("#msg_pw").text("비밀번호가 일치합니다");
				$("#msg_pw").css("color","#2E2EFE");
				uPwDup = true;
			}else
			{
				$("#msg_pw").text("비밀번호가 불일치합니다");
				$("#msg_pw").css("color","#dc3545");
				uPwDup = false;
			}
		});
	
	// 최종 유효성 검사 
	function DoSubmit()
	{
		// submit시 최종 유효성검사 submit막기
		console.log("uIdDup ajax3="+uIdDup);
		var uId		= $("#uId").val();
		var uPw		= $("#uPw").val();
		var uPwc	= $("#uPwc").val();
		var uName	= $("#uName").val();
		var uId_email = $("#uId_email").val();
		if(join.uId.value.length == 0 || $("#uId").val() == "")
		{
			alert("아이디를 써주세요");
			join.uId.focus();
			return false;
			
		}else if(uId.length <= 2)
		{
			alert("3글자 이상 써주세요")
			$("#uId").focus();
			return false;
		}else if(uId_email == "" || uId_email == null )
		{
			alert("도메인을 선택해주세요");
			return false;
		}else if( uIdemailDup == false){
			
			alert("중복 체크를 해주세요");
			console.log("uIdemailDup = "+uIdemailDup);
			$("#uId").val("").focus();
			return false;
		}else if( uIdDup == false){
			
			alert("아이디가 중복됩니다");
			console.log("uIdDup="+uIdDup);
			$("#uId").val("").focus();
			return false;
			
		}else if(uPw != uPwc )
		{
			alert("비밀번호가 일치 하지 않습니다");
			$("#uPw").val("").focus();
			return false;
		}else if(uName == null || $("#uName").val() == "")
		{
			alert("이름을 써주세요");

			$("#uName").val("").focus();
			return false;
			
		}else if (uNick == null || $("#uNick").val() == "")
		{
			alert("닉네임을 써주세요");
			$("#uNick").val("").focus();
			return false;
		}else if (uNickDup == false)
		{
			alert("닉네임이 중복 됩니다 고쳐주세요");
			console.log(uNickDup);
			$("#uNcik").val("").focus();
			return false;
		}else if( uAdds == null || $("#uAdds").val() == "")
		{
			alert("주소를 써주세요");
			$("#uAdds").val("").focus();
			return false;
		}else
		{
			if( uIdDup == true && uNickDup == true && uPwDup == true)
				{
					$("form").submit();
				}
			else
				{
					alert("잘 못 된 입 력 값 이 있 습 니 다 ");
					$("#uId").focus();
				}
			return false;
		}
		
	}
</script>
	
<%@ include file="../include/footer.jsp" %>