<%@page import="com.ss.demo.domain.Rentalhome_PayVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%
	if(session.getAttribute("login") == null){
		response.sendRedirect(request.getContextPath()+"/User/userLogin.do");
		return;
	}
	UserVO loginVO = (UserVO)session.getAttribute("login");
%>
<script>

// function insert_review(){
// 	const contents = document.getElementById("contents").value;
// 	const service = document.getElementById("service").value;
// 	const facility = document.getElementById("facility").value;
// 	const clean = document.getElementById("clean").value;
// 	const price = document.getElementById("price").value;
// 	const stay_date = document.getElementById("stay_date").value;
// 	const room_idx = document.getElementById("room_idx").value;
// 	$.ajax({
// 			url:"insert_review.do",
// 			type:"post",
// 			data:{
// 				  contents: contents,
// 		            service: service,
// 		            facility: facility,
// 		            clean: clean,
// 		            price: price,
// 		            room_idx: room_idx
// 			},
// 			success:function(){
// 					alert("성공");
// 			},
// 			error:function(){
// 				alert("예외발생");
// 			}
// 		});
// }

</script>
<style>
	.view{
		border-radius:10px;
		background-color:white;
/* 		box-shadow:1px 1px 1px 1px #ddd; */
	}
</style>
<div style="width:1920px; text-align:left; background-color:#dfecfb; padding:50px 0px;">
	<div class="view" style="width:1600px; margin:0 auto; padding:30px; margin:20px auto; line-height:50px;">
		<div style="margin:20px 0px;"><span style="font-weight:bold; padding:15px 20px; background-color:#0863ec; color:white; border-radius:10px;">MY 예약 리스트</span></div>
		<div style="margin:10px 0px;">
			<div style="display:inline-block; width:10%; margin:0px 10px;"><span style="font-weight:bold;">예약 번호</span></div>
			<div style="display:inline-block; width:5%; margin:0px 10px;"><span style="font-weight:bold;">예약자</span></div>
			<div style="display:inline-block; width:15%; margin:0px 10px;"><span style="font-weight:bold;">숙소 이름</span></div>
			<div style="display:inline-block; width:6%; margin:0px 10px;"><span style="font-weight:bold;">방 이름</span></div>
			<div style="display:inline-block; width:6%; margin:0px 10px;"><span style="font-weight:bold;">체크인</span></div>
			<div style="display:inline-block; width:6%; margin:0px 10px;"><span style="font-weight:bold;">체크아웃</span></div>
			<div style="display:inline-block; width:6%; margin:0px 10px;"><span style="font-weight:bold;">결제 금액</span></div>
			<div style="display:inline-block; width:10%; margin:0px 10px;"><span style="font-weight:bold;">결제일</span></div>
			<div style="display:inline-block; width:7%; margin:0px 10px;"><span style="font-weight:bold;">결제상태</span></div>
		</div>
		<div style="margin:10px 0px; background-color:black; height:2px;"></div>
		<c:forEach items="${list}" var="payVO">
			<div style="margin:10px 0px;">
				<div style="display:inline-block; width:10%; margin:0px 10px;"><span style="font-size:10pt;">${payVO.reserve_number}</span></div>
				<div style="display:inline-block; width:5%; margin:0px 10px;"><span style="font--size:10pt;">${payVO.guest_name }</span></div>
				<div onclick="location.href='rentalhomeReserveInfo.do?reserve_number=${payVO.reserve_number}'" style="cursor:pointer; display:inline-block; width:15%; margin:0px 10px;"><span style="font-size:10pt;">${payVO.product}</span></div>
				<div style="display:inline-block; width:6%; margin:0px 10px;"><span style="font-size:10pt;">${payVO.product_name}</span></div>
				<div style="display:inline-block; width:6%; margin:0px 10px;"><span style="font-size:10pt;">${payVO.start_date}</span></div>
				<div style="display:inline-block; width:6%; margin:0px 10px;"><span style="font-size:10pt;">${payVO.end_date}</span></div>
				<div style="display:inline-block; width:6%; margin:0px 10px;"><span style="font-size:10pt;">${payVO.price}</span></div>
				<div style="display:inline-block; width:10%; margin:0px 10px;"><span style="font-size:10pt;">${payVO.pay_date}</span></div>
				<div style="display:inline-block; width:7%; margin:0px 10px;"><span style="font-size:10pt;">${payVO.bank} <c:if test="${payVO.pay_status eq 'refund'}"><span style="color:#dd2a21;">취소됨</span></c:if><c:if test="${payVO.pay_status eq 'paid'}"><span style="color:#0255c9;">결제</span></c:if></span></div>
				<div style="display:inline-block; width:5%; margin:0px 10px; text-align:right;">
					<span onclick="location.href='rentalhomeReserveInfo.do?reserve_number=${payVO.reserve_number}'" style="cursor:pointer; font-size:11pt; padding:10px 12px; font-weight:bold; color:#0255c9; border-radius:3px; ">자세히</span>
				</div>
				<div style="display:inline-block; width:6%; margin:0px 10px; text-align:right;">
					<span style="cursor:pointer; font-size:11pt; padding:10px 12px; font-weight:bold; color:#0255c9; border-radius:3px; ">리뷰작성</span>
				</div>
			</div>
			<div style="margin:5px 0px; background-color:lightgray; height:1px;"></div>
	</c:forEach>
		
		<div style="text-align:right; margin-top:30px;"><span onclick="location.href='rentalhomeMain.do'" style="cursor:pointer; font-weight:bold;padding:15px 20px; background-color:#0863ec; color:white; border-radius:10px;">메인 화면으로</span></div>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>