<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<style>
	.col-lg-3 {
	margin-bottom: 1.5rem;
	text-align: center;
	cursor:pointer;
	}
</style>
<!-- main -->
<!-- <a xlink:href="<%=request.getContextPath() %>/User/profile.do" xlink:title="좋아요"> 
	</a>-->
<hr class="featurette-divider">
	<div class="container marketing"> 
		<div class="row">
			<div class="col-lg-3" onclick="profile()">
			<input type="hidden" id="social" value="<%= login.getuSocialType() %>">
				<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
				<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
				<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
				</svg>
				<h3 class="fw-normal">Profile</h3>
			</div>
			<div class="col-lg-3" onclick="Great()">
				<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
				<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
				</svg>
				<h3 class="fw-normal">Great</h3>
			</div>
			<div class="col-lg-3" onclick="review()">
				<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
				<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
				<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
				</svg>
				<h3 class="fw-normal">review</h3>
			</div>
			<div class="col-lg-3" onclick="payment()">
				<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-credit-card" viewBox="0 0 16 16">
				<path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1H2zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V7z"/>
				<path d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1v-1z"/>
				</svg>
				<h3 class="fw-normal">Payment</h3>
			</div>
			<c:choose>
			<c:when test="${ login.uType == 'admin'}">
				<div class="col-lg-3" onclick="UserList()">
					<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
					<path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5zm.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1h-4zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1h-2z"/>
					</svg>
					<h3 class="fw-normal">UserList</h3>
				</div>
				<div class="col-lg-3" onclick="UserReport()">
					<svg fill="#000000" height="120px" width="120px" version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 264 264" xmlns:xlink="http://www.w3.org/1999/xlink" enable-background="new 0 0 264 264">
					  <g>
					    <polygon points="98.805,40.486 95.941,51 101.668,51  "/>
					    <path d="M208,52.968v-10.16c0-2.668-1.332-3.808-3.529-3.808H201v18h3.471C206.668,57,208,55.636,208,52.968z"/>
					    <path d="m231,10c0-5.523-4.477-10-10-10h-178c-5.523,0-10,4.477-10,10v244c0,5.523 4.477,10 10,10h178c5.523,0 10-4.477 10-10v-244zm-36,25.393c0-0.98 0.92-1.393 2.527-1.393h6.943c5.414,0 9.529,2.06 9.529,8.808v10.16c0,6.748-4.115,9.032-9.529,9.032h-6.943c-1.607,0-2.527-0.637-2.527-1.617v-24.99zm-26,.04c0-1.256 2.131-1.433 3.465-1.433h13.967c1.295,0 1.844,1.205 1.844,2.461 0,1.451-0.668,2.539-1.844,2.539h-10.432v7h5.803c1.176,0 1.844,0.784 1.844,2.039 0,1.059-0.549,1.961-1.844,1.961h-5.803v7h10.432c1.176,0 1.844,1.088 1.844,2.539 0,1.256-0.549,2.461-1.844,2.461h-13.967c-1.334,0-3.465-0.401-3.465-1.656v-24.911zm-24.346-1.433h16.949c1.293,0 1.844,1.167 1.844,2.461 0,1.491-0.668,2.539-1.844,2.539h-5.603v21.344c0,1.255-1.471,1.883-3,1.883s-3-0.628-3-1.883v-21.344h-5.346c-1.176,0-1.844-1.048-1.844-2.539 0.001-1.294 0.551-2.461 1.844-2.461zm-28.654,1.433c0-1.295 1.738-1.884 3.267-1.884 2.197,0 2.955,0.196 4.445,3.061l6.288,12.121v-13.338c0-1.294 1.47-1.844 3.001-1.844 1.529,0 2.999,0.55 2.999,1.844v24.951c0,1.255-1.299,1.883-2.829,1.883-1.412,0-2.82-0.275-3.566-1.647l-7.605-13.575v13.339c0,1.255-1.471,1.883-3,1.883s-3-0.628-3-1.883v-24.911zm-28.494,23.851l7.297-23.931c0.432-1.373 2.197-2.04 4.002-2.04 1.805,0 3.57,0.667 4.002,2.04l7.336,23.931c0.039,0.157 0.078,0.313 0.078,0.432 0,1.451-2.236,2.511-3.924,2.511-0.98,0-1.764-0.406-2-1.23l-1.334-4.997h-8.277l-1.334,4.996c-0.234,0.824-1.02,1.184-2,1.184-1.688,0-3.924-1.036-3.924-2.487 1.42109e-14-0.119 0.039-0.252 0.078-0.409zm-38.557-23.303c0-1.334 2.197-2.433 3.963-2.433 0.941,0 1.725,0.314 1.961,1.138l5.963,20.126 3.1-13.261c0.234-1.059 1.607-1.608 2.941-1.608 1.334,0 2.707,0.55 2.943,1.608l3.1,13.261 5.963-20.126c0.234-0.823 1.02-1.138 1.961-1.138 1.766,0 3.963,1.099 3.963,2.433 0,0.196-0.041,0.393-0.08,0.51l-7.807,23.931c-0.471,1.373-2.236,2.04-4.041,2.04-1.764,0-3.648-0.667-3.961-2.04l-2.041-9.298-2.039,9.298c-0.314,1.373-2.197,2.04-3.963,2.04-1.805,0-3.609-0.667-4.041-2.04l-7.807-23.931c-0.039-0.117-0.078-0.313-0.078-0.51zm165.051,195.019h-33v-33h-24v-6.782c15-8.595 24.667-24.502 24.667-42.718 0-27.338-22.079-49.5-49.417-49.5s-49.625,22.162-49.625,49.5c0,18.216 10.375,34.123 24.375,42.718v6.782h-25v33h-33v-149h165v149z"/>
					  </g>
					</svg>
					<h3 class="fw-normal">Report</h3>
				</div>
			</c:when>
			</c:choose>
<hr class="featurette-divider">
			<c:choose>
			<c:when test="${ login.uType == 'business'}">
				<div class="col-lg-3" onclick="rental()">
					<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-building-fill" viewBox="0 0 16 16">
					  <path d="M3 0a1 1 0 0 0-1 1v14a1 1 0 0 0 1 1h3v-3.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 .5.5V16h3a1 1 0 0 0 1-1V1a1 1 0 0 0-1-1H3Zm1 2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1Zm3 0a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1Zm3.5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5ZM4 5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1ZM7.5 5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5Zm2.5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1ZM4.5 8h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5Zm2.5.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1Zm3.5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5v-1a.5.5 0 0 1 .5-.5Z"/>
					</svg>
				<h3 class="fw-normal">Rental</h3>
				</div>
				<div class="col-lg-3" onclick="food()">
					<svg version="1.1" id="_x32_" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" 
	 				width="120px" height="120px" viewBox="0 0 512 512"  xml:space="preserve">
<!-- 				<style type="text/css">
				<![CDATA[
					.st0{fill:#000000;}
				]]>
				</style> -->
					<g>
						<path class="st0" d="M83.344,19.781C37.313,19.781,0,65.844,0,117.828c0,31.641,14.875,59.547,33.063,76.906
						C49.031,210,58.828,221.75,60.781,247.25v244.969h45.109V247.25c1.953-25.5,11.766-37.25,27.734-52.516
						c18.188-17.359,33.063-45.266,33.063-76.906C166.688,65.844,129.359,19.781,83.344,19.781z"/>
						<path class="st0" d="M328.391,54.188v89c0,5.688-4.609,10.297-10.297,10.297h-2.75c-5.688,0-10.297-4.609-10.297-10.297V53.781
							c0-14.688-9.859-19.063-19.328-19.063s-19.344,4.375-19.344,19.063v89.406c0,5.688-4.609,10.297-10.281,10.297h-2.75
							c-5.688,0-10.281-4.609-10.281-10.297v-89c0-26.281-37.469-25.375-37.469,0.281c0,30.719,0,84.984,0,84.984
							c-0.156,47.219,11.109,59.453,29.75,74.172c15,11.844,27.813,18.641,27.813,48.047v230.547h45.125V261.672
							c0-29.406,12.813-36.203,27.813-48.047c18.625-14.719,29.906-26.953,29.734-74.172c0,0,0-54.266,0-84.984
							C365.828,28.813,328.391,27.906,328.391,54.188z"/>
						<path class="st0" d="M454.672,63.047c-8.172,27.297-32.75,90.063-38.891,145.344c-6.125,55.266,22.531,73.688,40.938,104.391
							l10.172,25.609v153.828h44.891H512c0-7.547,0-138.297,0-230.031c0-90.766,0-183.203,0-199.141
							C512,30.281,466.969,22.094,454.672,63.047z"/>
					</g>
					</svg>
				<h3 class="fw-normal">Food</h3>
				</div>
				<div class="col-lg-3" onclick="event()">
					<svg fill="#000000" width="120px" height="120px" viewBox="0 0 32 32" data-name="Layer 1" id="Layer_1" xmlns="http://www.w3.org/2000/svg"><title/><path d="M3,9.5h.43L6.14,14a1,1,0,0,0,1.72,0L10.57,9.5h1.86L15.14,14a1,1,0,0,0,1.72,0L19.57,9.5h1.86L24.14,14a1,1,0,0,0,1.72,0L28.57,9.5H29a1,1,0,0,0,0-2H3a1,1,0,0,0,0,2Zm4,2.06L5.77,9.5H8.23Zm9,0L14.77,9.5h2.46Zm9,0L23.77,9.5h2.46Zm4,5.94H3a1,1,0,0,0,0,2h.43L6.14,24a1,1,0,0,0,1.72,0l2.71-4.51h1.86L15.14,24a1,1,0,0,0,1.72,0l2.71-4.51h1.86L24.14,24a1,1,0,0,0,1.72,0l2.71-4.51H29a1,1,0,0,0,0-2ZM7,21.56,5.77,19.5H8.23Zm9,0L14.77,19.5h2.46Zm9,0L23.77,19.5h2.46Z"/>
					</svg>
				<h3 class="fw-normal">Event</h3>
				</div>
				
			</c:when>
			</c:choose>
		</div>
	</div>
<script type="text/javascript">

	var uSocialType = $("#social").val();
	console.log("social"+uSocialType);
	console.log("social"+$("#social").val());
	var searchType = '';
	var searchValue = '';
	function profile(){
		if( uSocialType == "social")
			{
				alert("소셜 로그인 사용자는 이용이 제한됩니다");
			}else{
		var searchType = $("#searchType").val();
		var searchValue = $("#searchValue").val();
		location.href = '<%=request.getContextPath() %>/User/profile.do?searchType='+searchType+'&searchValue='+searchValue;
				
			}
	}
	function Great(){
		location.href = '<%=request.getContextPath() %>/User/great.do';
	}
	function review(){
		location.href = '<%=request.getContextPath() %>/User/review.do';
	}
	function payment(){
		location.href = '<%=request.getContextPath() %>/User/payment.do';
	}
	function UserList(){
		location.href = '<%=request.getContextPath() %>/User/UserList.do'
	}
	function UserReport(){
		location.href = '<%=request.getContextPath() %>/User/UserReport.do'
	}
</script>


<%@ include file="../include/footer.jsp" %>