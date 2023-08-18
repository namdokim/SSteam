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
	Rentalhome_PayVO payVO = (Rentalhome_PayVO)request.getAttribute("payVO");
	System.out.println(payVO.getPrice());
%>
<script>
	function cancelPay(merchant_uid){
		var reserve_number = '${payVO.reserve_number}';
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
</script>
<style>
	.view{
		border-radius:10px;
		background-color:white;
		box-shadow:1px 1px 1px 1px #ddd;
	}
</style>
<div style="width:1920px; text-align:left; background-color:#dfecfb; padding:50px 0px;">
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
				<img src="../img/user.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">성인 ${roomVO.min_person }명 - 성인 ${roomVO.max_person }명</span>
			</div>
			<div style="display:inline-block; width:150px; height:30px;">
				<img src="../img/bed.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">${roomVO.bed_info }</span>
			</div>
			<c:if test="${roomVO.smoking eq 'N'}">
				<div style="display:inline-block; width:120px; height:30px;">
					<img src="../img/dont-smoke.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">금연객실</span>
				</div>
			</c:if>
			<c:if test="${roomVO.wifi eq 'Y'}">
				<div style="display:inline-block; width:100px; height:30px;">
					<img src="../img/wifi.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">와이파이</span>
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
							<div style="height:20px; line-height:20px;"><span style="color:#777777; font-size:9pt; line-height:normal; position:absolute; top:5px; left:240px;">체크아웃</span></div>
							<div style="height:30px; line-height:30px;"><span style="font-size:11pt;width:200px;position:absolute; top:23px; left:240px; height:25px; outline:none; font-weight:bold;">${payVO.end_date}</span></div>
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
			<span style="font-size:14pt; font-weight:bold;">요청사항</span><br>
			<span style="font-size:10pt;">숙소 관리자에게 필요한 요청사항을 전달해 주세요.</span><br>
			<span style="font-size:10pt;">사정에 따라 요청사항에 대한 제공이 불가능할 수 있습니다.</span><br>
		</div>
		<div style="border:1px solid lightgray; border-radius:20px; height:100px;">
			<span>${payVO.request}</span>
		</div>
		<div style="text-align:right; margin-top:30px;">
			<c:choose>
				<c:when test="${not empty payVO.refund_date}">
					<span id="cancel" style="font-weight:bold; font-size:15pt; padding:15px 20px; color:#dd2a21; border-radius:10px;">${payVO.refund_date} 예약 취소</span>
				</c:when>
				<c:otherwise>
					<span id="cancel" onclick="cancelPay('${payVO.reserve_number}')" style="cursor:pointer; font-weight:bold; font-size:15pt; padding:15px 20px; color:#dd2a21; border-radius:10px;">예약 취소</span>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<div style="width:1550px; text-align:right; display:inline-block;">
		<span onclick="location.href='rentalhomeReserveList.do'" style="cursor:pointer; font-weight:bold; font-size:15pt; padding:15px 20px; color:#424242; border-radius:10px;">예약 현황으로</span>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>