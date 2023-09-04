<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%
	if(session.getAttribute("login") == null){
		response.sendRedirect(request.getContextPath()+"/User/userLogin.do");
		return;
	}
	UserVO loginVO = (UserVO)session.getAttribute("login");
	
	String tel1 = "";
	String tel2 = "";
	String tel3 = "";
	if( loginVO.getuPhone() != null){
		System.out.println(loginVO.getuPhone().length());
		tel1 = loginVO.getuPhone().substring(0, 3);
		tel2 = loginVO.getuPhone().substring(3, 7);
		tel3 = loginVO.getuPhone().substring(7);
	}
%>
<!-- 아임포트 SDK -->
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
window.onload = function (){
	const start_date = "${searchVO.start_date}";
	const end_date = "${searchVO.end_date}";

	const start = new Date(start_date);
	const end = new Date(end_date);
	var count_weekday = 0;
	var count_weekend = 0;
	while(start < end){
		const dayOfWeek = start.getDay();
		if(dayOfWeek == 0 || dayOfWeek == 6){
			count_weekend++;
		}else{
			count_weekday++;
		}
		start.setDate(start.getDate() + 1);
	}
	document.getElementById("price_weekday_count").innerText = count_weekday;
	document.getElementById("price_weekend_count").innerText = count_weekend;
	document.getElementById("stay_day").innerText = count_weekend+count_weekday;
	var price_ = document.getElementsByName("price");
	for (var i = 0; i < price_.length; i++) {
		var price = document.getElementsByName("price")[i];
		document.getElementsByName("price")[i].innerText = parseInt(price.innerText);
	}
	
	const weekday_price_id = document.getElementById("price_weekday").innerText;
	const weekend_price_id = document.getElementById("price_weekend").innerText;
	const discount_id = document.getElementById("discount").innerText;
	document.getElementById("pay_price").innerText = ((parseInt(weekday_price_id) - parseInt(discount_id))*parseInt(count_weekday))
													+((parseInt(weekend_price_id) - parseInt(discount_id))*parseInt(count_weekend));
	
	document.getElementById("price_weekday_total").innerText = parseInt(weekday_price_id) * parseInt(count_weekday);
	document.getElementById("price_weekend_total").innerText = parseInt(weekend_price_id) * parseInt(count_weekend);
	document.getElementById("discount_total").innerText = parseInt(discount_id)*(parseInt(count_weekday)+parseInt(count_weekend))+"원";
	
	document.getElementById("point").onblur = function(){
		let point_id = document.getElementById("point").value;
		let user_point = parseInt(document.getElementById("user_point").innerText);
		let price_weekday_count = document.getElementById("price_weekday_total").innerText;
		let price_weekend_count = document.getElementById("price_weekend_total").innerText;
		let total_pay_price = parseInt(price_weekday_count) + parseInt(price_weekend_count);
		if( point_id < 0 || point_id > user_point || total_pay_price < point){
			alert("포인트 금액이 잘못되었습니다.");
			document.getElementById("point").value = 0;
			point_id = 0;
			document.getElementById("pay_price").innerText = ((parseInt(weekday_price_id) - parseInt(discount_id))*parseInt(count_weekday))
			+((parseInt(weekend_price_id) - parseInt(discount_id))*parseInt(count_weekend))
			- parseInt(point_id);
			return;
		}
		document.getElementById("pay_price").innerText = ((parseInt(weekday_price_id) - parseInt(discount_id))*parseInt(count_weekday))
														+((parseInt(weekend_price_id) - parseInt(discount_id))*parseInt(count_weekend))
														- parseInt(point_id);
	};
	
}
// 	아임포트 객체 초기화
	IMP.init('imp63231033');
	
	function requestPay() {
		if(!validation()){
			return false;
		}
		
		var uid = "";
		var room_idx = ${roomVO.room_idx};
		var pg = "html5_inicis";
		var pay_method = "card";
		var merchant_uid = "reserve_"+ new Date().getTime();
		var name = '${name}';
		var amount = parseInt(document.getElementById("pay_price").innerText);
		var buyer_email = document.getElementById("email").value;
		var buyer_name = document.getElementById("name").value;
		
		var tel_array = document.getElementsByName("tel");
		var buyer_tel = tel_array[0].value+"-"+tel_array[1].value+"-"+tel_array[2].value;
		
		
		IMP.request_pay({
			pg: pg,
			pay_method: pay_method,
			merchant_uid: merchant_uid,
			name: name,
			amount: amount,
			buyer_email: buyer_email,
			buyer_name: buyer_name,
			buyer_tel: buyer_tel,
			},
			function (rsp) {
				if (rsp.success) {
					// 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
					uid = rsp.imp_uid;
					// 결제 시 포트원 고유 결제번호(imp_uid)로 결제 검증 AJAX
					$.ajax({
						url: "iamport_verify/"+uid+".do", 
						method: "POST"
					}).done(function (data) {
						if(amount == data.response.amount){
							// jQuery로 HTTP 요청
							// 주문정보 데이터 생성 및 테이블에 저장
							var start_date = document.getElementById("start_date").innerText;
							var end_date = document.getElementById("end_date").innerText;
							var request = document.getElementById("request").value;
							var product = '${name}';
							var product_name = '${roomVO.name}';
							
							pay_data = JSON.stringify({
								pay_idx : rsp.imp_uid,
								reserve_number : rsp.merchant_uid,
								room_idx : room_idx,
								kind : rsp.pay_method,
								bank : rsp.card_name,
								price : rsp.paid_amount,
								start_date : start_date,
								end_date : end_date,
								guest_name : rsp.status,
								guest_email : buyer_email,
								pay_status : rsp.status,
								guest_name : buyer_name,
								guest_tel : buyer_tel,
								guest_email : buyer_email,
								request : request,
								product : product,
								product_name : product_name,
								point : parseInt(document.getElementById("point").value),
								discount : parseInt(document.getElementById("discount").innerText)
							});
							
							$.ajax({
								url:"complete.do",
								method:"POST",
								dataType:"JSON",
								contentType:"application/json",
								data:pay_data
							})
							.done(function (res){
								if(res > 0){
									alert("예약이 완료되었습니다.");
									location.replace("rentalhomeReserveInfo.do?reserve_number="+rsp.merchant_uid);
								}else{
									alert("주문정보 저장 실패");
								}
							});
						}else{
							alert("요청한 금액이 맞지 않습니다.");
						}
					});
				} else {
					alert("결제에 실패하였습니다. 에러 내용: " + rsp.error_msg);
				}
			}
		);
	}
	
	function validation(){
		document.getElementById("name").value = decodeHTMLEntities(document.getElementById("name").value);
		var name = document.getElementById("name").value;
		if( name == null || name == ""){
			alert("이름을 입력해주세요.");
			return false;
		}
		
		const pattern_name = /^[A-Za-z가-힣\s]+$/;
		if(!pattern_name.test(name)){
			alert("이름을 확인해주세요.");
			return false;
		}
		
		var tel1 = document.getElementById("tel1").value;
		var tel2 = document.getElementById("tel2").value;
		var tel3 = document.getElementById("tel3").value;

		const pattern_tel1 = /^01[0-9]$/;
		if(!pattern_tel1.test(tel1)){
			alert("전화번호를 확인해주세요.");
			return false;
		}
		const pattern_tel = /^[0-9]{4}$/;
		if(!pattern_tel.test(tel2)){
			alert("전화번호를 확인해주세요.");
			return false;
		}
		if(!pattern_tel.test(tel3)){
			alert("전화번호를 확인해주세요.");
			return false;
		}
		
		var email = document.getElementById("email").value;
		const pattern_email = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
		if(!pattern_email.test(email)){
			alert("이메일 형식을 확인해주세요.");
			return false;
		}
		
		document.getElementById("request").value = decodeHTMLEntities(document.getElementById("request").value);
		var request = document.getElementById("request").value;

		var point = document.getElementById("point").value;
		var user_point = parseInt(document.getElementById("user_point").innerText);
		var price_weekday_count = document.getElementById("price_weekday_total").innerText;
		var price_weekend_count = document.getElementById("price_weekend_total").innerText;
		var total_pay_price = parseInt(price_weekday_count) + parseInt(price_weekend_count);
		if( point < 0 || point > user_point || total_pay_price < point){
			alert("포인트 금액이 잘못되었습니다.");
			return false;
		}
		
		var rule = document.getElementById("rule");
		if(!rule.checked){
			alert("약관에 동의해주세요.");
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
</style>
<div style="width:1920px; text-align:left; background-color:#dfecfb; padding:50px 0px; font-family: 'TheJamsil5Bold';">
	<div class="view" style="width:1224px; margin:0 auto; padding:30px; margin:20px auto; line-height:50px;">
		<div style="width:100%; position:relative;">
			<span style="font-size:15pt; font-weight:bold; background-color:#0863ec; color:white; padding:10px 20px; border-radius:10px;">예약 정보</span><br>
			<span style="position:absolute; left:0px; top:70px; font-size:15pt; font-weight:bold;">${name }</span><br>
			<span style="position:absolute; left:0px; top:100px; color:#545454; font-size:12pt;">${roomVO.name }</span><br>
			<div style="display:inline-block; width:180px; height:30px;">
				<img src="../img/user.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">성인${roomVO.min_person}명 - 성인 ${roomVO.max_person}명</span>
			</div>
			<c:if test="${roomVO.smoking eq 'N' }">
				<div style="display:inline-block; width:120px; height:30px;">
					<img src="../img/dont-smoke.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">금연객실</span>
				</div>
			</c:if>
			<div style="display:inline-block; width:150px; height:30px;">
				<img src="../img/bed.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">${roomVO.bed_info}</span>
			</div>
			<c:if test="${roomVO.wifi eq 'Y'}">
				<div style="display:inline-block; width:100px; height:30px;">
					<img src="../img/wifi.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">와이파이</span>
				</div>
			</c:if>
			<div style="margin:20px 0px;">
				<div style="width:450px; height:50px; display:inline-block; text-align:left; padding:0px 10px; position:relative;" >
					<div class="row justify-content-center">
						<div class="col-md-5">
							<div style="height:20px; line-height:20px;"><span style="color:#777777; font-size:9pt; line-height:normal; position:absolute; top:5px; left:10px;">체크인</span></div>
							<div style="height:30px; line-height:30px;"><span id="start_date" style="font-weight:bold;font-size:11pt;width:200px;position:absolute; top:23px; left:10px; height:25px; outline:none;">${searchVO.start_date }</span></div>
						</div>
						
						<div class="col-md-5">
							<div style="height:20px; line-height:20px;"><span style="color:#777777; font-size:9pt; line-height:normal; position:absolute; top:5px; left:240px;">체크아웃</span></div>
							<div style="height:30px; line-height:30px;"><span id="end_date" style="font-weight:bold; font-size:11pt;width:200px;position:absolute; top:23px; left:240px; height:25px; outline:none;">${searchVO.end_date}</span></div>
						</div>
					</div>
				</div>
			</div>
			<img src="<%=request.getContextPath() %>/resources/upload/${roomVO.physical_name}" style="width:340px; height:220px; position:absolute;right:30px; top:80px;">
		</div>
	</div>
	<div class="view" style="width:1224px; margin:0 auto; padding:30px;margin:20px auto; line-height:30px;">
		<div>
			<span style="font-size:15pt; font-weight:bold; padding:0px 20px;">예약자 정보</span><br>
			<span style="font-size:10pt; padding:0px 20px;">입력된 이름과 번호, 이메일은 체크인에 사용됩니다.</span><br>
			<span style="font-size:10pt; padding:0px 20px;">작성된 정보와 일치하지 않을 경우, 체크인에 어려움이 발생할 수 있습니다.</span>
		</div>
		<div style="width:200px; text-align:right; margin:20px 20px 20px 0px; display:inline-block;">
			<span style="font-weight:bold;">이름</span>
		</div>
		<input type="text"  id="name" value="<%=loginVO.getuName() != null ? loginVO.getuName() : ""%>" placeholder="이름을 입력해주세요" style="text-align:center; width:300px; border:0px; border-bottom:1px solid lightgray;"><br>
		<div style="width:200px; text-align:right; margin:20px 20px 20px 0px; display:inline-block;">
			<span style="font-weight:bold;">전화번호</span>
		</div>
		<input type="number" name="tel" id="tel1" value="<%=tel1 %>" style="text-align:center; font-size:15pt;width:200px;border:0px; border-bottom:1px solid lightgray;">-
		<input type="number" name="tel" id="tel2" value="<%=tel2 %>" style="text-align:center; font-size:15pt;width:200px;border:0px; border-bottom:1px solid lightgray;">-
		<input type="number" name="tel" id="tel3" value="<%=tel3 %>" style="text-align:center; font-size:15pt;width:200px;border:0px; border-bottom:1px solid lightgray;"><br>
		<div style="width:200px; text-align:right; margin:20px 20px 20px 0px; display:inline-block;">
			<span style="font-weight:bold;">이메일</span>
		</div>
		<input type="text"  id="email" value="<%=loginVO.getuId() != null ? loginVO.getuId() : ""%>" placeholder="ex) abcde@abc.com" style="width:500px;border:0px; border-bottom:1px solid lightgray;">
	</div>
	<div class="view" style="width:1224px; margin:0 auto; padding:30px;margin:20px auto; line-height:30px;">
		<span style="font-size:14pt; font-weight:bold; padding:0px 20px;">요청사항</span><br>
		<span style="font-size:10pt; padding:0px 20px;">숙소 관리자에게 필요한 요청사항을 전달해 주세요.</span><br>
		<span style="font-size:10pt; padding:0px 20px;">사정에 따라 요청사항에 대한 제공이 불가능할 수 있습니다.</span><br>
		<textarea id="request" placeholder="숙소 관리자에게 요청사항을 적어주세요." style="width:97%; margin:20px 20px; padding:10px 20px; height:200px; resize:none; border-radius:10px;border:1px solid lightgray;"></textarea>
	</div>
	<div class="view" style="width:1224px; margin:0 auto; padding:30px;margin:20px auto; line-height:30px; ">
		<span style="font-size:14pt; font-weight:bold; padding:0px 20px;">결제 정보</span><br>
		<div style="width:30%; height:62px; text-align:right; margin:10px 0px; vertical-align:top; display:inline-block;">
			<span style="font-weight:bold;">객실 가격</span>
		</div>
		<div style="width:40%; height:62px; text-align:right; margin:10px 0px; display:inline-block;">
			<div style="width:60%; height:62px; text-align:right; margin:10px 0px; display:inline-block;">
				주간:<span id="price_weekday" style="font-weight:bold;">${roomVO.weekday_price}</span><span style="font-weight:bold;">원 X </span><span id="price_weekday_count"></span><br>
				주말:<span id="price_weekend" style="font-weight:bold;">${roomVO.weekend_price}</span><span style="font-weight:bold;">원 X </span><span id="price_weekend_count"></span>
			</div>
			<div style="width:30%; height:62px; text-align:right; margin:10px 0px; display:inline-block;">
				<span id="price_weekday_total"></span>원<br>
				<span id="price_weekend_total"></span>원
			</div>
			<div class="mx-3"></div>
		</div>
		<div style="width:30%; text-align:right; margin:10px 0px; display:inline-block;">
			<span style="font-weight:bold;">이벤트 할인</span>
		</div>
		<div style="width:40%; text-align:right; margin:10px 0px; display:inline-block;">
			<div style="width:60%; text-align:right; margin:10px 0px; display:inline-block;">
			<span style="font-weight:bold; color:#f51818;">${roomVO.discount_reason}</span>
				<c:if test="${roomVO.discount_type eq 'fix' }">
					<span id="discount" name="price" style="font-weight:bold; color:#f51818;">${roomVO.discount_money}</span>
					<span style="font-weight:bold; color:#f51818;">원 X <span id="stay_day"></span></span>
				</c:if>
				<c:if test="${roomVO.discount_type eq 'rate' }">
					<span id="discount" name="price" style="font-weight:bold; color:#f51818;">${roomVO.weekday_price*roomVO.discount_money/100}</span>
					<span style="font-weight:bold; color:#f51818;">원 X <span id="stay_day"></span></span>
				</c:if>
			</div>
			<div style="width:30%; text-align:right; margin:10px 0px; display:inline-block;">
				 <span style="color:red;" id="discount_total"></span>
			</div>
		</div>
		<div style="width:30%; text-align:right; margin:10px 0px; display:inline-block;">
			<span style="font-weight:bold;">포인트 할인</span>
		</div>
		<div style="width:20%; text-align:right; margin:10px 0px; display:inline-block;">
			<span style="color:gray; font-size:10pt;">보유 포인트  <span id="user_point"><%=loginVO.getuPoint() %></span></span>
		</div>
		<div style="width:20%; text-align:right; margin:10px -5px; display:inline-block;">
			<input type="number" id="point"  value="0"style="width:80%; text-align:right;border:0px; border-bottom:1px solid lightgray; font-weight:bold; color:#f51818;">
			<span style="font-weight:bold; color:#f51818;">원</span>
		</div>
		<div style="width:100%; height:1px; background-color:lightgray; text-align:center; margin:10px 0px; display:inline-block;">
			
		</div>
		<div style="width:30%; text-align:right; margin:10px 0px; display:inline-block;">
			<span style="font-weight:bold;">결제 금액</span>
		</div>
		<div style="width:40%; text-align:right; margin:10px 0px; display:inline-block;">
				<span id="pay_price" name="price" style="font-weight:bold;"></span>
				<span style="font-weight:bold;">원</span>
		</div>
	</div>
	<div class="view" style="width:1224px; margin:0 auto; padding:30px;margin:20px auto; line-height:30px; ">
		<div style="height:30px; line-height:30px; margin:10px;">
			<input type="checkbox" id="rule" style="vertical-align:-2px;width:15px; height:15px;">
			<span style="font-size:10pt; padding:0px 10px;">예약 내용에 대하여 확인하였으며, 예약할 숙소의 숙박 규정에 동의합니다.</span><br>
		</div>
		<input type="button" onclick="requestPay()" value="결제하기" style="width:100%; height:50px; background-color:#0863ec; border:0px; border-radius:10px; font-size:18pt; color:white;">
	</div>
</div>
<%@ include file="../include/footer.jsp" %>