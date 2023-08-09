<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<% %>
<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
function DoRewrite()
{
	$("#uId").val("").focus();
}
</script>

<style>
	.container
	{
		text-align: center;
		align-content: center;
	}
	tr{
		text-align: center;
		padding: auto;
		width: 40%;
	}
	input::placeholder
	{
		text-align: left;
	}
	#idbutton{
		text-align: right;
		align-content: right;
	}
	.form-label
	{
		padding-top: 1%;
		padding-bottom: 1%;
		color: #2E2E2E;
		background-color:#F2F2F2;
		width:100%;
		font-family: monospace;
		font-size: 20px ;
		font-weight: bolder;
	}
	
/* 비밀번호 감추기 보여주기  */
.input {
  position: relative;
}

 .input .eyes {
  position: absolute;
  top: 0;
  bottom: 0;
  right: 10px;
  margin: auto ;
  height: 40px;
  font-size: 25px;
  cursor: pointer;
}
.input .eyes2 {
  position: absolute;
  top: 0;
  bottom: 0;
  right: 10px;
  margin: auto ;
  height: 40px;
  font-size: 25px;
  cursor: pointer;
}


</style>
<!-- 회원가입 입력 란  -->
<div class="container">
	<div class="py-5 text-center">
		<!-- <div class="row g-5"> -->
			<!-- <div class="col-md-7 col-lg-8"> -->
				<div class="mb-3"><img src="<%=request.getContextPath() %>/img/joinicon.png" style="width:420px; height: 230px;">
				</div>
				<!-- 회원가입 폼  -->
				<form name="join" id="join" method="post" action="<%= request.getContextPath()%>/User/userJoinAction.do">
					<input type="hidden" id="uType" name="uType" value="business">
					<div class="col-12">
					<div class="g-3">
						<div class="grid text-center">
							<label for="ID" class="form-label">사업용 아이디</label>
							<input class="g-col-6 form-control" type="text" id="uId" name="uId"  placeholder="Email로 써주세요" required value="">
							<div class="invalid-feedback">
							이메일 이름을 써주세요
							</div>
<!-- 							<div class="invalid-feedback">
							도메인을 선택해주세요.
							</div> -->
							<select class="form-select" id="uId_email" name="uId_email" onchange="email();">	
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
							<!-- float-end py-1 -->
							<!-- d-flex justify-content -->
							<!-- class="float-end btn btn-secondary mb-1" -->
							<div id="idbutton" class="d-flex justify-content align-items-right">
								<div class="col-md-12">
								<input type="button" class="btn btn-secondary mb-1" value="인증하기" id="emailCheck" onclick="emailAuth();">
								<input type="button" class="btn btn-primary mb-1" value="중복확인 " id="emaildomain" onclick="emailcheck();">
								</div>
								<!-- <input type="hidden" name="idchecked" id=""value="checkednot"> -->
							</div>
						</div>
					</div> <!-- g-3 -->
					</div> <!-- col-12 -->
					<input type="hidden" class="mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" maxlength="6" style="width: 70%;">
						<span id="msg_id"></span>
						<span id="msg_email"></span>
						<label for="password" class="form-label">비밀번호 </label>
					<div class="col-12">
						<div class="input password">
						<input class="form-control" type="password" id="uPw" name="uPw" placeholder="비밀번호" required value="">
							<div class="eyes"><i class="fas fa-eye"></i></div>
						<div class="invalid-feedback eyes">
							비밀번호를 입력해 주세요
						</div>
						</div>
					</div>
					<div class="col-12">
						<div class="input password">
						<!-- <label for="email" class="form-label">비밀번호 확인 </label> -->
						<input class="form-control" type="password"  id="uPwc" name="uPwc" placeholder="비밀번호확인">
							<div class="eyes2"><i class="fas fa-eye"></i></div>
						<div class="invalid-feedback eyes">
						비밀번호와 일치하지 않습니다
						</div>
						</div>
					</div>
						<span id="msg_pw"></span>
					<div class="col-12">
						<label for="Name" class="form-label">이름</label>
						<input  class="form-control" type="text" id="uName" name="uName" placeholder="이름" required value="">
						<div class="invalid-feedback">
							이름을 입력하세요
						</div>
					</div>
					<div class="col-12">
						<label for="Nick" class="form-label">닉네임</label>
						<input  class="form-control" type="text" id="uNick" name="uNick" placeholder="닉네임" required value="">
						<div class="invalid-feedback">
							닉네임을 입력하세요
						</div>
					</div>
						<span id="msg_nick"></span>
					<div class="col-12">
						<label for="Phone" class="form-label">전화번호</label>
						<input  class="form-control" type="text" id="uPhone" name="uPhone" placeholder="전화번호(ex= 01012345678)" required value="">
						<div class="invalid-feedback">
							전화번호 입력하세요
						</div>
					</div>
					<!-- 우편번호 주소 -->
						<label for="address" class="form-label">우편번호</label>
					<div class="col-12 d-flex justify-content-between align-items-center">
						<div class="col-md-6">
						<input  class="form-control" type="text" id="uAddsPostCode"  placeholder="우편번호">
						</div>
						<input class="float-end btn btn-secondary mb-1" onclick="DaumPostcode();" type="button" value="우편번호찾기">
					</div>
						<div class="col-12">
						<input class="form-control" type="text" id="uRoadAddress"  placeholder="도로명주소">
						</div>
						<div class="col-12">
						<input  class="form-control" type="text" id="uJibunAddress"  placeholder="지번주소">            
						</div>
						
						<div class="col-12">
						<input class="form-control" type="text" id="uDetailAddress" placeholder="상세주소">
						</div>	
						
						<label for="address" class="form-label">참고항목</label>
						<div class="col-md-5">
						<input class="form-control" type="text" id="sample4_extraAddress" placeholder="참고항목">
						</div>
					<!-- 회원가입 입력란 끝 -->
						<hr class="my-4">
						<div class="d-flex justify-content-center my-4">
							<button class="btn btn-primary btn-lg" type="button" value="가입하기" onclick="DoSubmit();">회원가입</button>
							<a href="javascript:DoRewrite()">
							<input class="w-33 btn btn-primary btn-lg mx-2" type="button" value="다시쓰기">
							</a>
							<a href="<%=request.getContextPath() %>/">
							<input class="w-33 btn btn-primary btn-lg" type="button" value="취소">
							</a>
						</div>
				</form>
	</div>
</div>
		<!-- </div> col-md-7 col-lg-8 -->
	<!-- </div> row g-5 끝  -->
	<%-- 
				<td>	
					<select id="uId_email" name="uId_email" style="width: 90%;" onchange="email();">	
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
					<input type="hidden" class="mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" maxlength="6" style="width: 70%;">
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
					<div class="input password">
					<input type="password" id="uPw" name="uPw" style="width:100%;" placeholder="비밀번호" required value="">
						<div class="eyes">
							<i class="fas fa-eye"></i>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div class="input password">
					<input type="password" id="uPwc" name="uPwc" style="width:100%;" placeholder="비밀번호 확인" required value="">
						<div class="eyes2">
							<i class="fas fa-eye"></i>
						</div>
					</div>
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
					<div style="text-align: left; width: 100%; display: inline-block;">
						<input type="text" id="uAddsPostCode"  placeholder="우편번호">
						<br>
						<input type="text" id="uRoadAddress" style="width: 100%;" placeholder="도로명주소">
						<input type="text" id="uJibunAddress" style="width: 100%;" placeholder="지번주소"><br>
						<!-- <span id="guide" style="color:#999;display:none"></span> -->
						<input type="text" id="uDetailAddress" style="width: 60%;" placeholder="상세주소">
						<input type="text" id="sample4_extraAddress" placeholder="참고항목">
					</div>
				</td>
				<td>
						<input type="button"  onclick="DaumPostcode()" value="우편번호 찾기">
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
	--%>
<!-- api 연동 -->
<div>
	<input value="사업자 회원가입 ">
</div>
<script type="text/javascript">
//coolsms
//비바톤
//나이스아이디
//facebook account kit
</script>

<!-- 주소 다음 api http://postcode.map.daum.net/guide -->
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function DaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('uAddsPostCode').value = data.zonecode;
                document.getElementById("uRoadAddress").value = roadAddr;
                document.getElementById("uJibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open({
        	 popupTitle: '우편번호 주소 검색'
        });
    }
</script>
<!-- 셀렉트 태그 값 바꿀시 브라우저 로그에 보여주기  -->
<script type="text/javascript">
	$("select[name=uId_email]").change(function(){
		console.log($(this).val());
	});
</script>
<!-- 비밀번호 보여주기 감추기  -->
<script type="text/javascript">
$(function(){
	  // 눈표시 클릭 시 패스워드 보이기
	  $('.eyes').on('click',function(){
	    $('.input.password').toggleClass('active');

	    if( $('.input.password').hasClass('active') == true ){
	    	$(this).find('.fa-eye').attr('class',"fas fa-eye-slash").parents('.input').find('#uPw').attr('type',"text");
	    				// i 클래스                // 텍스트 보이기 i 클래스
	    }
	    else{
	    	$(this).find('.fa-eye-slash').attr('class',"fas fa-eye").parents('.input').find('#uPw').attr('type','password');
	    }
	  });
	});
	
$(function(){
	  // 눈표시 클릭 시 패스워드 보이기
	  $('.eyes2').on('click',function(){
	    $('.input.password').toggleClass('active');

	    if( $('.input.password').hasClass('active') == true ){
	    	$(this).find('.fa-eye').attr('class',"fas fa-eye-slash").parents('.input').find('#uPwc').attr('type',"text");
	    				// i 클래스                // 텍스트 보이기 i 클래스
	    }
	    else{
	    	$(this).find('.fa-eye-slash').attr('class',"fas fa-eye").parents('.input').find('#uPwc').attr('type','password');
	    }
	  });
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
		} else if( uIdDup == false){
			
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
		}else
		{
			if( uIdDup == true && uNickDup == true && uPwDup == true)
				{
					$("form").submit();
					alert("회원가입이 완료 되였습니다");
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