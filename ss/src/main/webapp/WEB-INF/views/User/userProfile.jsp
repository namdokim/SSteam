<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script type="text/javascript">
	window.onload(function(){
		
	});
	function profile(){
		location.href = '<%=request.getContextPath() %>/User/profile.do';
	}
	function Great(){
		location.href = '<%=request.getContextPath() %>/User/great.do';
	}
	function review(){
		location.href = '<%=request.getContextPath() %>/User/review.do';
	}
	function payment(){
		location.href = '<%=request.getContextPath() %>/rentalhome/rentalhomeReserveList.do';
	}
</script>
<style>
	.sticky-navbar {
	  position: -webkit-sticky;
	  position: sticky;
	  top: 0;
	  background-color: #fff; /* 배경색 설정 */
	  z-index: 1000; /* 다른 요소 위로 올라오게 함 */
	  border-bottom: 1px solid #ddd; /* 아래에 경계선 추가 */
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
	.nav-font{
		color:#666666;
	}
</style>
<%-- <h1>profile=<%= login.getuType()%></h1> --%>
<%-- <%= login %> --%>
<div class="container-fluid" style="font-family: 'TheJamsil5Bold';">
	<div class="row">
		<div class="d-flex flex-column flex-shrink-0 bg-body-tertiary shadow position-fixed rounded px-0 mx-0" style="width: 6.5rem; background-color: white">
		  <ul class="nav nav-pills nav-flush flex-column mb-auto text-center">
		    <li class="nav-link  border-bottom rounded-0 px-3">
		      	<div class="col" onclick="profile()">
		      	<span style="color:#4c4c4c;">
					<svg class=" mb-2" xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
					<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
					<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
					</svg>
				</span>
					<h5 class="fw-normal nav-font">프로필</h5>
				</div>
		    </li>
		    <li class="nav-link  border-bottom rounded-0">
			    <div class="col" onclick="Great()">
			    <span style="color:orange;">
					<svg class=" mb-2" xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
					<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
					</svg>
			    </span>
					<h5 class="fw-normal nav-font">좋아요</h5>
				</div>
		    </li>
		    <li class="nav-link border-bottom rounded-0 px-2">
		    	<div class="col" onclick="review()">
		    	<span style="color:#4c4c4c;">
					<svg class=" mb-2" xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
					<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
					<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
					</svg>
				</span>
					<h5 class="fw-normal nav-font">리뷰</h5>
				</div>
		    </li>
		    <li class="nav-link border-bottom rounded-0 px-1">
		      	<div class="col" onclick="payment()">
		      	<span style="color:#0d6efd;">
					<svg class=" mb-2" xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" class="bi bi-credit-card" viewBox="0 0 16 16">
					<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1H2zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V7z"/>
					<path d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1z"/>
					</svg>
				</span>
					<h5 class="fw-normal nav-font">결제내역</h5>
				</div>
		    </li>
		  </ul>
		</div>
		
		<div class="" style="height:100%;background-color: #fdfffc;">
			<div class="container custom-container d-flex justify-content-center align-items-center">
				<div class="py-5 text-center">
					 <div class="row g-5">
						 <div class="card shadow-sm"  style="width:500px">
						
						 	<div class="container col-12 mt-5">
							 	<%-- <form class="d-flex g-3" method="post" action="<%= request.getContextPath()%>/User/profileimg.do" enctype="multipart/form-data">
									<div class="profile-btn-area "  style="width:200px;">
										<label for="input-image">이미지 </label>
										<div class="mb-3" style="width:200px; height:200px">
											<img src='<c:url value="${login.uImg} "></c:url>' width="200px" height="200px">
										</div>
										<input type="file" name="myprofileimg">
										<input type="hidden" id="uId">
										
									</div>
									<input type="hidden" name="delete" id="delete" value="0">
										<div id="preview" class="mb-3 ms-3" >
											<label for="input-image" style="text-align:center;">이미지 미리보기</label>
											<img src='<c:url value="${login.uImg} "></c:url>' width="200px" height="200px">
											<div style="text-align: right;">
											<button class="btn btn-primary mt-5 " type="submit" style="width:100px; ">변경</button>
											</div>
										</div>
								</form> --%>
							</div>
							<!-- 회원가입 폼  -->
							<form name="join" id="join" method="post" action="<%= request.getContextPath()%>/User/userJoinAction.do">
								<div class="col-12">
								<div class="g-3">
									<div class="grid text-center">
									<div class="form-floating my-2">
										<input type="text" class="form-control" id="uId" placeholder="uId" name="uId">
										<label for="floatingInput" class="text-muted">ID</label>
									</div>		
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
											<div class="col-md-12 mt-1">
											<input type="button" class="btn btn-outline-secondary mb-1" value="인증하기" id="emailCheck" onclick="emailAuth();">
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
								<div class="col-12">
									<div class="input password">
									<input class="form-control" type="password" id="uPw" name="uPw" placeholder="비밀번호" required value="">
										<div class="eyes mt-2"><i class="fas fa-eye"></i></div>
									<div class="invalid-feedback eyes">
										비밀번호를 입력해 주세요
									</div>
									</div>
								</div>
								<div class="col-12">
									<div class="input password">
									<!-- <label for="email" class="form-label">비밀번호 확인 </label> -->
									<input class="form-control" type="password"  id="uPwc" name="uPwc" placeholder="비밀번호확인">
										<div class="eyes2 mt-2"><i class="fas fa-eye"></i></div>
									<div class="invalid-feedback eyes">
									비밀번호와 일치하지 않습니다
									</div>
									</div>
								</div>
									<span id="msg_pw"></span>
								<div class="col-12 my-2">
									<div class="invalid-feedback">
										이름을 입력하세요
									</div>
									<div class="form-floating my-2">
										<input type="text" class="form-control" id="uName" placeholder="이름" name="uName" required value="">
										<label for="floatingInput" class="text-muted">이름</label>
									</div>		
								</div>
								<div class="col-12">
									<div class="invalid-feedback">
										닉네임을 입력하세요
									</div>
									<div class="form-floating my-2">
										<input class="form-control" type="text" id="uNick" name="uNick" placeholder="닉네임" required value="">
										<label for="floatingInput" class="text-muted">닉네임</label>
									</div>		
								</div>
									<span id="msg_nick"></span>
								<div class="col-12 mb-2">				
									<div class="invalid-feedback">
										전화번호 입력하세요
									</div>
									<div class="form-floating my-2">
										<input class="form-control" type="text" id="uPhone" name="uPhone" placeholder="전화번호(ex= 01012345678)" required value="">
										<label for="floatingInput" class="text-muted">전화번호(ex= 01012345678)</label>
									</div>		
								</div>
								<!-- 우편번호 주소 -->
								<div class="col-12 d-flex justify-content-between align-items-center mt-2 ">
									<div class="col-md-6">
									<input  class="form-control my-2" type="text" id="uAddsPostCode"  placeholder="우편번호">
									</div>
									<input class="float-end btn btn-outline-secondary my-1" onclick="DaumPostcode();" type="button" value="우편번호찾기">
								</div>
									<div class="col-12">
									<input class="form-control my-1" type="text" id="uRoadAddress"  placeholder="도로명주소">
									</div>
									<div class="col-12">
									<input  class="form-control my-1" type="text" id="uJibunAddress"  placeholder="지번주소">            
									</div>
									
									<div class="col-12">
									<input class="form-control my-1" type="text" id="uDetailAddress" placeholder="상세주소">
									</div>	
								<!-- 회원가입 입력란 끝 -->
									<div class="d-flex justify-content-center my-4">
										<button class="btn btn-primary btn-lg" type="button" value="가입하기" onclick="DoSubmit();">회원가입</button>
										<a href="javascript:DoRewrite()">
										<input class="w-33 btn btn-primary btn-lg mx-2" type="button" value="다시쓰기">
										</a>
										<a href="<%=request.getContextPath() %>/">
										<input class="w-33 btn btn-danger btn-lg" type="button" value="취소">
										</a>
									</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
</div>
<%@ include file="../include/footer.jsp" %>