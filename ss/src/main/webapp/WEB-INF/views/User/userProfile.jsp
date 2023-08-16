<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
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
</style>
<h1>profile=<%= login.getuType()%></h1>
<%= login %>
<div class="container">
	<div class="py-5 text-center">
		<!-- <div class="row g-5"> -->
			<!-- <div class="col-md-7 col-lg-8"> -->
				
				<!-- 프로필 사진 ~ -->
				<form method="post" action="<%= request.getContextPath()%>/User/profileimg.do" enctype="multipart/form-data">
					<div class="profile-btn-area">
						<label for="input-image">이미지 </label>
						<div class="mb-3">
							<img src='<c:url value="${login.uImg} "></c:url>' width="200px" height="200px">
						</div>
						<input type="file" name="myprofileimg">
						<input type="hidden" id="uId">
						<button type="submit">변경하기</button>
					</div>
					<input type="hidden" name="delete" id="delete" value="0">
						<label for="input-image">이미지 미리보기</label>
						<div id="preview" class="mb-3">
							<img src='<c:url value="${login.uImg} "></c:url>' width="200px" height="200px">
						</div>
				</form>
				<!-- 회원수정 폼  -->
				<form name="join" id="join" method="post" action="<%= request.getContextPath()%>/User/userJoinAction.do">
					<input type="hidden" id="uType" name="uType" value="<%= login.getuType()%>">
					<div class="col-12">
					<div class="g-3">
					<!-- 
						<div class="grid text-center">
							<label for="ID" class="form-label">아이디</label>
							<input class="g-col-6 form-control" type="text" id="uId" name="uId"  placeholder="Email로 써주세요" required value="">
							<div class="invalid-feedback">
							이메일 이름을 써주세요
							</div>
							
							 <div class="invalid-feedback">
							도메인을 선택해주세요.
							</div>
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
							float-end py-1
							d-flex justify-content
							class="float-end btn btn-secondary mb-1"
							<div id="idbutton" class="d-flex justify-content align-items-right">
								<div class="col-md-12">
								<input type="button" class="btn btn-secondary mb-1" value="인증하기" id="emailCheck" onclick="emailAuth();">
								<input type="button" class="btn btn-primary mb-1" value="중복확인 " id="emaildomain" onclick="emailcheck();">
								</div>
								<input type="hidden" name="idchecked" id=""value="checkednot">
							</div>
						</div>
						 -->
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
</div><!-- container -->
<%@ include file="../include/footer.jsp" %>