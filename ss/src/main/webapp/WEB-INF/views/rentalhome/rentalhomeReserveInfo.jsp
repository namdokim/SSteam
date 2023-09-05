<%@page import="com.ss.demo.domain.Rentalhome_PayVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	if(session.getAttribute("login") == null){
		response.sendRedirect(request.getContextPath()+"/User/userLogin.do");
		return;
	}
	UserVO loginVO = (UserVO)session.getAttribute("login");
	Rentalhome_PayVO payVO = (Rentalhome_PayVO)request.getAttribute("payVO");
	System.out.println(payVO.getPrice());
%>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
window.onload = function() {
	const services_ = document.getElementsByName("services");
	const facilities_ = document.getElementsByName("facilities");
	const cleans_ = document.getElementsByName("cleans");
	const prices_ = document.getElementsByName("prices");
	
	services_.forEach(function(services, index) {
		services.onclick = function() {
			for(let i=0; i < services_.length; i++){
				services_[i].style.color = "#eaeaea";
			}
			for (let j = index; j >= 0; j--) {
				services_[j].style.color = "#f7d15e";
			}
			document.getElementById("service").value = index+1;
		};
	});

	facilities_.forEach(function(facilities, index) {
		facilities.onclick = function() {
			for(let i=0; i < facilities_.length; i++){
				facilities_[i].style.color = "#eaeaea";
			}
			for (let j = index; j >= 0; j--) {
				facilities_[j].style.color = "#f7d15e";
			}
			document.getElementById("facility").value = index+1;
		};
	});
	
	cleans_.forEach(function(cleans, index) {
		cleans.onclick = function() {
			for(let i=0; i < cleans_.length; i++){
				cleans_[i].style.color = "#eaeaea";
			}
			for (let j = index; j >= 0; j--) {
				cleans_[j].style.color = "#f7d15e";
			}
			document.getElementById("clean").value = index+1;
		};
	});
	
	prices_.forEach(function(prices, index) {
		prices.onclick = function() {
			for(let i=0; i < prices_.length; i++){
				prices_[i].style.color = "#eaeaea";
			}
			for (let j = index; j >= 0; j--) {
				prices_[j].style.color = "#f7d15e";
			}
			document.getElementById("price").value = index+1;
		};
	});
};
	function cancelPay(merchant_uid){
		const reserve_number = '${payVO.reserve_number}';
		if(!confirm("예약을 취소하시겠습니까?")){
			return;
		}
		$.ajax({
			url:'rentalhome_pay_cancel.do',
			method:'post',
			data:{
				merchant_uid:merchant_uid
			},
			dataType:'json'
		}).done(function(data) {
			if(data){
				alert("예약이 취소되었습니다.");
				location.replace("rentalhomeReserveInfo.do?reserve_number="+ reserve_number );
			}else{
				alert("예약된 정보와 취소할 정보가 일치하지 않습니다. 고객센터에 문의해주세요.");
			}
		});
	}
	function openReview(){
		const review_write = document.getElementById("review_write");
		if(review_write.style.display == "none"){
			review_write.style.display = "block"; 
		}else{
			review_write.style.display = "none";
		}
	}
	function validation(){
		document.getElementById("contents").value = decodeHTMLEntities(document.getElementById("contents").value);
		const contents = document.getElementById("contents").value;
		if(contents == ""){
			alert("내용을 입력해주세요.");
			return false;
		}
		if(document.getElementById("service").value == 0){
			alert("평점을 입력해주세요.");
			return false;
		}
		if(document.getElementById("facility").value == 0){
			alert("평점을 입력해주세요.");
			return false;
		}
		if(document.getElementById("clean").value == 0){
			alert("평점을 입력해주세요.");
			return false;
		}
		if(document.getElementById("price").value == 0){
			alert("평점을 입력해주세요.");
			return false;
		}
		if(!confirm("리뷰를 작성하시겠습니까?")){
			return false;
		}
		return true;
	}
	function decodeHTMLEntities (str) {
		if(str !== undefined && str !== null && str !== '') {
			str = String(str);

			str = str.replace(/<script[^>]*>([\S\s]*?)<\/script>/gmi, '');
			str = str.replace(/<\/?\w(?:[^"'>]|"[^"]*"|'[^']*')*>/gmi, '');
			var element = document.createElement('div');
			element.innerHTML = str;
			str = element.textContent;
			element.textContent = '';
		}
		return str;
	}
</script>
<style>
	.view{
		border-radius:10px;
		background-color:white;
		box-shadow:1px 1px 1px 1px #ddd;
	}
	.box-radio-input input[type="radio"]{
		display:none;
		margin:0px 10px;
	}

	.box-radio-input input[type="radio"] + span{
		display:inline-block;
		background:none;
		border:1px solid #dfdfdf;  
		padding:0px 10px;
		text-align:center;
		height:35px;
		line-height:33px;
		font-weight:500;
		cursor:pointer;
	}

	.box-radio-input input[type="radio"]:checked + span{
		border:1px solid #23a3a7;
		background:#23a3a7;
		color:#fff;
	}
</style>
<div style="width:1920px; text-align:left; background-color:#f1f7fd; padding:50px 0px; font-family: 'TheJamsil5Bold';">
	<div class="view" style="width:1224px; margin:0 auto; padding:58px; margin:20px auto; line-height:40px;">
		<div style="width:100%; position:relative;">
			<div style="text-align:center; margin:30px 0px;">
			<c:choose>
				<c:when test="${not empty payVO.refund_date}">
					<span id="title_info" style="color:#dd2a21; font-size:20pt; font-weight:bold;">취소된 예약정보입니다.</span>
				</c:when>
				<c:otherwise>
					<span id="title_info" style="font-size:20pt; font-weight:bold;">예약이 완료되었습니다.</span>
				</c:otherwise>
			</c:choose>
			</div>
			<div style="text-align:left; line-height:30px; margin-top:80px;">
				<span style="font-size:15pt; font-weight:bold;">${payVO.product}</span><br>
				<span style="color:#545454; font-size:12pt;">${payVO.product_name}</span>
			</div>
			<div style="display:inline-block; width:180px; height:30px;">
				<img src="${pageContext.request.contextPath}/resources/img/user.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">성인 ${roomVO.min_person }명 - 성인 ${roomVO.max_person }명</span>
			</div>
			<div style="display:inline-block; width:150px; height:30px;">
				<img src="${pageContext.request.contextPath}/resources/img/bed.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">${roomVO.bed_info }</span>
			</div>
			<c:if test="${roomVO.smoking eq 'N'}">
				<div style="display:inline-block; width:120px; height:30px;">
					<img src="${pageContext.request.contextPath}/resources/img/dont-smoke.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">금연객실</span>
				</div>
			</c:if>
			<c:if test="${roomVO.wifi eq 'Y'}">
				<div style="display:inline-block; width:100px; height:30px;">
					<img src="${pageContext.request.contextPath}/resources/img/wifi.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">와이파이</span>
				</div>
			</c:if>
			<div style="margin:15px 0px;">
				<div style="width:450px; height:50px; display:inline-block; text-align:left; padding:0px 10px; position:relative;" >
					<div class="row justify-content-center">
						<div class="col-md-5">
							<div style="height:20px; line-height:20px;"><span style="color:#777777; font-size:9pt; line-height:normal; position:absolute; top:5px; left:10px;">체크인</span></div>
							<div style="height:30px; line-height:30px;"><span style="font-size:11pt;width:200px; position:absolute; top:23px; left:10px; height:25px; outline:none; font-weight:bold;">${payVO.start_date}</span></div>
						</div>
						<div class="col-md-5">
							<div style="height:20px; line-height:20px;"><span style="color:#777777; font-size:9pt; line-height:normal; position:absolute; top:5px; left:50px;">체크아웃</span></div>
							<div style="height:30px; line-height:30px;"><span style="font-size:11pt;width:200px;position:absolute; top:23px; left:50px; height:25px; outline:none; font-weight:bold;">${payVO.end_date}</span></div>
						</div>
					</div>
				</div>
			</div>
			<img src="<%=request.getContextPath() %>/resources/upload/${roomVO.physical_name}" style="width:340px; height:220px; position:absolute;right:60px; top:130px;">
		</div>
		<div style="margin:50px 0px; ">
		
			<div style="display:inline-block; width:550px; vertical-align:top; margin-top:20px;">
				<div>
					<span style="font-size:15pt; font-weight:bold;">예약자 정보</span><br>
					<span style="font-size:10pt; ">입력된 이름과 번호, 이메일은 체크인에 사용됩니다.</span><br>
					<span style="font-size:10pt;">작성된 정보와 일치하지 않을 경우, 체크인에 어려움이 발생할 수 있습니다.</span>
				</div>
				<div style="background-color:#fcfcfc; width:90%; border:1px solid lightgray; border-radius:10px;">
					<div style="width:100px; text-align:right; margin:20px 20px 20px 0px; display:inline-block;">
						<span style="font-weight:bold;">이름</span>
					</div>
					<div style="display:inline-block; width:300px;">${payVO.guest_name }</div><br>
					<div style="width:100px; text-align:right; margin:20px 20px 20px 0px; display:inline-block;">
						<span style="font-weight:bold;">전화번호</span>
					</div>
					<div style="display:inline-block; font-size:15pt;width:300px;">${payVO.guest_tel}</div><br>
					<div style="width:100px; text-align:right; margin:20px 20px 20px 0px; display:inline-block;">
						<span style="font-weight:bold;">이메일</span>
					</div>
					<div style="display:inline-block; width:300px;">${payVO.guest_email}</div><br>
				</div>
					
			</div>
			<div style="display:inline-block; width:550px; background-color:#f6f6f7; border-radius:10px; padding:20px; margin-top:50px;">
				<div style="text-align:center;">
					<span style="font-size:14pt; font-weight:bold; padding:0px 20px;">결제 정보</span><br>
				</div>
				<div style="width:30%; text-align:right; margin:10px 0px; display:inline-block;">
					<span style="font-weight:bold;">객실 가격</span>
				</div>
				<div style="width:60%; text-align:right; margin:10px 0px; display:inline-block;">
					<span style="font-weight:bold;">${roomVO.weekday_price}원</span>
				</div>
				<div style="width:30%; text-align:right; margin:10px 0px; display:inline-block;">
					<span style="font-weight:bold;">이벤트 할인</span>
				</div>
				<div style="width:60%; text-align:right; margin:10px 0px; display:inline-block;">
					<span style="font-weight:bold; color:#f51818;">${payVO.discount}원</span>
				</div>
				<div style="width:30%; vertical-align:top;text-align:right; margin:10px 0px; display:inline-block;">
					<span style="font-weight:bold;">사용 포인트</span>
				</div>
				<div style="width:60%; text-align:right; margin:10px 0px; display:inline-block;">
					<span style="text-align:right; font-weight:bold; color:#f51818;">${payVO.point}원</span>
				</div>
				<div style="width:100%; height:1px; background-color:lightgray; text-align:center; margin:10px 0px; display:inline-block;">
				</div>
				<div style="width:30%; text-align:right; margin:10px 0px; display:inline-block;">
					<span style="font-size:18pt;font-weight:bold;">결제 금액</span>
				</div>
				<div style="width:60%; text-align:right; margin:10px 0px; display:inline-block;">
					<span style="font-size:18pt;font-weight:bold;">${payVO.price}원</span>
				</div>
			</div>
		</div>
		<div style="line-height:30px; margin:20px 0px;">
			<span style="font-size:14pt; font-weight:bold;">요청사항</span><br><br>
			<span style="font-size:10pt;">숙소 관리자에게 필요한 요청사항을 전달해 주세요.</span><br>
			<span style="font-size:10pt;">사정에 따라 요청사항에 대한 제공이 불가능할 수 있습니다.</span><br>
		</div>
		<div style="border:1px solid lightgray; border-radius:10px; height:100px;">
			<span>${payVO.request}</span>
		</div>
		<div style="text-align:right; margin-top:30px;">
		<jsp:useBean id="today" class="java.util.Date" />
		<fmt:formatDate value='${today}' pattern='yyyy-MM-dd' var="nowDate"/>
			<c:choose>
				<c:when test="${not empty payVO.refund_date}">
					<span  style="font-weight:bold; font-size:15pt; padding:15px 20px; color:#dd2a21;">${payVO.refund_date} 예약 취소</span>
				</c:when>
				<c:when test="${empty payVO.refund_date and nowDate >= payVO.start_date and payVO.review_yn eq 'N'}">
					<button style="width:120px; height:50px; font-weight:bold; font-size:15pt;" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">리뷰 작성</button>
				</c:when>
				<c:when test="${empty payVO.refund_date and nowDate < payVO.start_date}">
					<span onclick="cancelPay('${payVO.reserve_number}')" style="cursor:pointer; font-weight:bold; font-size:15pt; padding:15px 20px; color:#dd2a21; border-radius:10px;">예약 취소</span>
				</c:when>
				<c:otherwise>
					<span style="font-weight:bold; font-size:15pt; padding:15px 20px; color:#002ec5;">이용해주셔서 감사합니다.</span>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div style="width:1550px; text-align:right; display:inline-block;">
		<span onclick="location.href='rentalhomeReserveList.do'" style="cursor:pointer; font-weight:bold; font-size:15pt; padding:15px 20px; color:#424242; border-radius:10px;">예약 현황으로</span>
	</div>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<form action="rentalhome_review_write.do" method="post" onsubmit="return validation()">
					<input type="hidden" name="room_idx" value="${payVO.room_idx}">
					<input type="hidden" name="uNo" value="${login.uNo}">
					<input type="hidden" name="stay_date" value="${payVO.start_date}">
					<input type="hidden" name="reserve_number" value="${payVO.reserve_number}">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel"><span style="font-weight:bold;">${payVO.product}</span></h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<span>${payVO.product_name}</span><br><br>
						<textarea id="contents" name="contents" class="form-control" rows="5" style="resize:none;" placeholder="리뷰 내용을 작성해주세요."></textarea><br>
						<div style="margin:10px; color:#eaeaea; display:inline-block;">
							<span style="font-weight:bold; color:black;">서비스</span><br>
							<input type="hidden" id="service" name="service" value="0">
							<span name="services" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="services" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="services" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="services" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="services" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
						</div>
						<div style="margin:10px; color:#eaeaea; display:inline-block;">
							<span style="font-weight:bold; color:black;">시설</span><br>
							<input type="hidden" id="facility" name="facility" value="0">
							<span name="facilities" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="facilities" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="facilities" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="facilities" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="facilities" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
						</div>
						<div style="margin:10px; color:#eaeaea; display:inline-block;">
							<span style="font-weight:bold; color:black;">청결</span><br>
							<input type="hidden" id="clean" name="clean" value="0">
							<span name="cleans" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="cleans" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="cleans" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="cleans" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="cleans" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
						</div>
						<div style="margin:10px; color:#eaeaea; display:inline-block;">
							<span style="font-weight:bold; color:black;">가격</span><br>
							<input type="hidden" id="price" name="price" value="0">
							<span name="prices" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="prices" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="prices" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="prices" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
							<span name="prices" style="cursor:pointer;">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
  									<path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
								</svg>
							</span>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						<button type="submit" class="btn btn-primary">작성 완료</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>s