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
		location.href = '<%=request.getContextPath() %>/User/payment.do';
	}
</script>
<!-- main -->
<!-- <a xlink:href="<%=request.getContextPath() %>/User/profile.do" xlink:title="좋아요"> 
	</a>-->
<hr class="featurette-divider">
	<div class="container marketing"> 
		<div class="row">
			<div class="col-lg-3" onclick="profile()">
				<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
				<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
				<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
				</svg>
				<h3 class="fw-normal">Profile</h3>
			</div>
			<div class="col-lg-3" onclick="Great()">
				<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-suit-heart-fill" viewBox="0 0 16 16">
  				<path d="M4 1c2.21 0 4 1.755 4 3.92C8 2.755 9.79 1 12 1s4 1.755 4 3.92c0 3.263-3.234 4.414-7.608 9.608a.513.513 0 0 1-.784 0C3.234 9.334 0 8.183 0 4.92 0 2.755 1.79 1 4 1z"/>
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
		</div>
	</div>

<%@ include file="../include/footer.jsp" %>