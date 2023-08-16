<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<script>
	$.datepicker.setDefaults({
	  dateFormat: 'yy-mm-dd',
	  prevText: '이전 달',
	  nextText: '다음 달',
	  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	  dayNames: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesShort: ['일', '월', '화', '수', '목', '금', '토'],
	  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	  showMonthAfterYear: true,
	  yearSuffix: '년'
	});

	$(function () {
	  $('.datepicker').datepicker();
	});
</script>
<style>
	.view{
		border-radius:10px;
		background-color:white;
		box-shadow:1px 1px 1px 1px #ddd;
	}
</style>
<div style="width:1920px; text-align:left; background-color:#dfecfb; padding:50px 0px;">
	<div class="view" style="width:1224px; margin:0 auto; padding:30px; margin:20px auto; line-height:50px;">
		<div style="width:100%; position:relative;">
			<span style="font-size:15pt; font-weight:bold; background-color:#0863ec; color:white; padding:10px 20px; border-radius:10px;">예약 정보</span><br>
			<span style="position:absolute; left:0px; top:70px; font-size:15pt; font-weight:bold;">페어필드 바이 메리어트 서울 (Fairfield by Marriott Seoul)</span><br>
			<span style="position:absolute; left:0px; top:100px; color:#545454; font-size:12pt;">김진규 방</span><br>
			<div style="display:inline-block; width:180px; height:30px;">
				<img src="../img/user.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">성인2명 - 성인 5명</span>
			</div>
			<div style="display:inline-block; width:120px; height:30px;">
				<img src="../img/dont-smoke.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">금연객실</span>
			</div>
			<div style="display:inline-block; width:150px; height:30px;">
				<img src="../img/bed.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">싱글침대 2개</span>
			</div>
			<div style="display:inline-block; width:100px; height:30px;">
				<img src="../img/wifi.png" style="width:20px; height:20px;"><span style="font-size:10pt; margin-left:5px;">와이파이</span>
			</div>
			<div style="margin:20px 0px;">
				<div style="width:450px; height:50px; display:inline-block; text-align:left; padding:0px 10px; position:relative;" >
					<div class="row justify-content-center">
						<div class="col-md-5">
							<div style="height:20px; line-height:20px;"><span style="color:#777777; font-size:9pt; line-height:normal; position:absolute; top:5px; left:10px;">체크인</span></div>
							<div style="height:30px; line-height:30px;"><span style="font-size:11pt;width:200px;position:absolute; top:23px; left:10px; height:25px; outline:none;">2023-07-25</span></div>
						</div>
						-
						<div class="col-md-5">
							<div style="height:20px; line-height:20px;"><span style="color:#777777; font-size:9pt; line-height:normal; position:absolute; top:5px; left:240px;">체크아웃</span></div>
							<div style="height:30px; line-height:30px;"><span style="font-size:11pt;width:200px;position:absolute; top:23px; left:240px; height:25px; outline:none;">2023-07-28</span></div>
						</div>
					</div>
				</div>
			</div>
			<img src="../img/dulli.jpg" style="width:340px; height:220px; position:absolute;right:30px; top:80px;">
		</div>
	</div>
	<div class="view" style="width:1224px; margin:0 auto; padding:30px;margin:20px auto; line-height:30px;">
		<div>
			<span style="font-size:15pt; font-weight:bold; padding:0px 20px;">투숙객 정보</span><br>
			<span style="font-size:10pt; padding:0px 20px;">입력된 이름과 번호, 이메일은 체크인에 사용됩니다.</span><br>
			<span style="font-size:10pt; padding:0px 20px;">작성된 정보와 일치하지 않을 경우, 체크인에 어려움이 발생할 수 있습니다.</span>
		</div>
		<div style="width:200px; text-align:right; margin:20px 20px 20px 0px; display:inline-block;">
			<span style="font-weight:bold;">이름</span>
		</div>
		<input type="text" placeholder="이름을 입력해주세요" style="width:300px;border:0px; border-bottom:1px solid lightgray;"><br>
		<div style="width:200px; text-align:right; margin:20px 20px 20px 0px; display:inline-block;">
			<span style="font-weight:bold;">전화번호</span>
		</div>
		<input type="text" style="text-align:center; font-size:15pt;width:200px;border:0px; border-bottom:1px solid lightgray;">-
		<input type="text" style="text-align:center; font-size:15pt;width:200px;border:0px; border-bottom:1px solid lightgray;">-
		<input type="text" style="text-align:center; font-size:15pt;width:200px;border:0px; border-bottom:1px solid lightgray;"><br>
		<div style="width:200px; text-align:right; margin:20px 20px 20px 0px; display:inline-block;">
			<span style="font-weight:bold;">이메일</span>
		</div>
		<input type="text" placeholder="ex) abcde@abc.com" style="width:500px;border:0px; border-bottom:1px solid lightgray;">
	</div>
	<div class="view" style="width:1224px; margin:0 auto; padding:30px;margin:20px auto; line-height:30px;">
		<span style="font-size:14pt; font-weight:bold; padding:0px 20px;">요청사항</span><br>
		<span style="font-size:10pt; padding:0px 20px;">숙소 관리자에게 필요한 요청사항을 전달해 주세요.</span><br>
		<span style="font-size:10pt; padding:0px 20px;">사정에 따라 요청사항에 대한 제공이 불가능할 수 있습니다.</span><br>
		<textarea placeholder="숙소 관리자에게 요청사항을 적어주세요." style="width:97%; margin:20px 20px; padding:10px 20px; height:200px; resize:none; border-radius:10px;border:1px solid lightgray;"></textarea>
	</div>
	<div class="view" style="width:1224px; margin:0 auto; padding:30px;margin:20px auto; line-height:30px; ">
		<span style="font-size:14pt; font-weight:bold; padding:0px 20px;">결제 정보</span><br>
		<div style="width:30%; text-align:right; margin:10px 0px; display:inline-block;">
			<span style="font-weight:bold;">객실 가격</span>
		</div>
		<div style="width:40%; text-align:right; margin:10px 0px; display:inline-block;">
			<span style="font-weight:bold;">21,000원</span>
		</div>
		<div style="width:30%; text-align:right; margin:10px 0px; display:inline-block;">
			<span style="font-weight:bold;">이벤트 할인</span>
		</div>
		<div style="width:40%; text-align:right; margin:10px 0px; display:inline-block;">
			<span style="font-weight:bold; color:#f51818;">6,000원</span>
		</div>
		<div style="width:100%; height:1px; background-color:lightgray; text-align:center; margin:10px 0px; display:inline-block;">
			
		</div>
		<div style="width:30%; text-align:right; margin:10px 0px; display:inline-block;">
			<span style="font-weight:bold;">결제 금액</span>
		</div>
		<div style="width:40%; text-align:right; margin:10px 0px; display:inline-block;">
			<span style="font-weight:bold;">15,000원</span>
		</div>
	</div>
	<div class="view" style="width:1224px; margin:0 auto; padding:30px;margin:20px auto; line-height:30px; ">
		<div style="height:30px; line-height:30px; margin:10px;">
			<input type="checkbox" value="parking" style="vertical-align:-2px;width:15px; height:15px;">
			<span style="font-size:10pt; padding:0px 10px;">예약 내용에 대하여 확인하였으며, 예약할 숙소의 숙박 규정에 동의합니다.</span><br>
		</div>
		<input type="button" value="결제하기" style="width:100%; height:50px; background-color:#0863ec; border:0px; border-radius:10px; font-size:18pt; color:white;">
	</div>
</div>
<%@ include file="../include/footer.jsp" %>