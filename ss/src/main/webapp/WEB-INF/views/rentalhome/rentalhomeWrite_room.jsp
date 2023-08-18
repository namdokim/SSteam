<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
	.view{
		border-radius:10px;
		background-color:white;
		box-shadow:1px 1px 1px 1px #ddd;
	}
</style>
<div style="width:1920px; text-align:center; background-color:#dfecfb; padding:20px 0px;">
	<div class="view" style="width:1224px; margin:0 auto; padding:30px;  line-height:50px;">
		<div style="width:100%; padding:10px; margin:10px 0px;"><span style="font-size:20pt; font-weight:bold;">객실 등록하기</span></div>
		<form name="frm" action="rentalhomeWrite_room.do" method="post" enctype="multipart/form-data">
			<input type="hidden" name="rentalhome_idx" value="${rentalhomeVO.rentalhome_idx}">
			<div style="width:100%; padding:10px; margin:10px 0px; text-align:left;">
				<div style="margin:10px 0px;">
					<div style="width:100%; margin-right:30px;">
						<span style="font-size:20px; font-weight:bold;">${rentalhomeVO.name}</span>
					</div>
				</div>
			</div>
			<div style="margin:10px 0px;">
				<div style="display:inline-block; width:200px; text-align:right; margin-right:30px; vertical-align:top;">
					<span style="font-weight:bold;">객실 이미지 업로드</span>
				</div>
				<div style="display:inline-block; width:800px;">
					<input type="file" name="multiFile" multiple required style="width:100%;padding:0px 5px;border:0px;">
					<div id="preview" style="text-align:left;"></div>
				</div>
			</div>
			<div style="margin:10px 0px;">
				<div style="display:inline-block; width:200px; text-align:right; margin-right:30px;">
					<span style="font-weight:bold;">객실 이름</span>
				</div>
				<div style="display:inline-block; width:800px;">
					<input type="text" name="name" placeholder="객실 이름을 입력해주세요" style="width:100%;padding:0px 5px;border:0px; border-bottom:1px solid gray;">
				</div>
			</div>
			<div style="margin:10px 0px;">
				<div style="display:inline-block; width:200px; text-align:right; margin-right:30px;">
					<span style="font-weight:bold;">객실 허용 인원 수</span>
				</div>
				<div style="display:inline-block; width:800px;">
					<div style="text-align:left;">
							<span style="font-size:11pt; margin-right:20px;">최소 인원 수</span>
							<select class="search" name="min_person" style="text-align:center;font-weight:bold; font-size:11pt;width:100px; height:25px; outline:none; border:0px; border-bottom:1px solid gray;">
								<option selected ></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10+</option>
							</select>
							<span style="font-size:11pt; margin:0px 20px;">최대 인원  수</span>
							<select class="search" name="max_person" style="text-align:center;font-weight:bold; font-size:11pt;width:100px; height:25px; outline:none; border:0px; border-bottom:1px solid gray;">
								<option selected ></option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
								<option value="10">10+</option>
							</select>
					</div>
				</div>
			</div>
			<div style="margin:10px 0px;">
				<div style="display:inline-block; width:200px; text-align:right; margin-right:30px;">
					<span style="font-weight:bold;">객실 내 흡연 가능 여부</span>
				</div>
				<div style="display:inline-block; width:800px; text-align:left;">
					<input type="radio" name="smoking" value="Y" style="width:15px; height:15px; margin:0px 10px;"><span style="font-size:12pt; color:#0f294d;">가능</span>
					<input type="radio" name="smoking" value="N" style="width:15px; height:15px; margin:0px 10px;"><span style="font-size:12pt; color:#0f294d;">불가능</span>
				</div>
			</div>
			<div style="margin:10px 0px;">
				<div style="display:inline-block; width:200px; text-align:right; margin-right:30px;">
					<span style="font-weight:bold;">와이파이</span>
				</div>
				<div style="display:inline-block; width:800px; text-align:left;">
					<input type="radio" name="wifi" value="Y" style="width:15px; height:15px; margin:0px 10px;"><span style="font-size:12pt; color:#0f294d;">설치</span>
					<input type="radio" name="wifi" value="N" style="width:15px; height:15px; margin:0px 10px;"><span style="font-size:12pt; color:#0f294d;">미설치</span>
				</div>
			</div>
			<div style="margin:10px 0px;">
				<div style="display:inline-block; width:200px; text-align:right; margin-right:30px;">
					<span style="font-weight:bold;">침대정보</span>
				</div>
				<div style="display:inline-block; width:800px;">
					<input type="text" name="bed_info" placeholder="객실 내 침대 종류 및 갯수를 입력해주세요" style="width:100%;padding:0px 5px;border:0px; border-bottom:1px solid gray;">
				</div>
			</div>
			<div style="margin:10px 0px;">
				<div style="display:inline-block; width:200px; text-align:right; margin-right:30px;">
					<span style="font-weight:bold;">가격</span>
				</div>
				<div style="display:inline-block; width:800px; text-align:left;">
					<div style="margin-bottom:20px;">
						<span style="font-size:11pt;font-weight:bold; margin-right:20px;">상시가</span><input type="text" name="weekday_price" style="height:30px; width:200px;padding:0px 5px;border:0px; border-bottom:1px solid gray;">
						<span style="font-size:11pt;font-weight:bold; margin:0px 20px;">주말가</span><input type="text" name="weekend_price" style="height:30px; width:200px;padding:0px 5px;border:0px; border-bottom:1px solid gray;">
					</div>
				</div>
			</div>
			<div style="margin:10px 0px;">
				<div style="display:inline-block; width:200px; text-align:right; margin-right:30px;  vertical-align:top;">
					<span style="font-weight:bold;">할인</span>
				</div>
				<div style="display:inline-block; width:800px; text-align:left;">
					<div style="margin-bottom:20px;">
						<span style="font-size:11pt;font-weight:bold; margin-right:20px;">이유</span><input type="text" name="discount_reason" style="height:30px; width:600px;padding:0px 5px;border:0px; border-bottom:1px solid gray;"><br>
						<span style="font-size:11pt;font-weight:bold; margin-right:20px;">할인 종류</span><br>
						<select name="discount_type" style="border:0px; font-size:11pt; font-weight:bold; margin-right:20px; width:100px; height:30px; text-align:left;">
							<option value="default">할인 없음</option>
							<option value="rate">비율 할인</option>
							<option value="fix">고정 할인</option>
						</select>
						<input type="number" name="discount_money" name="discount_money" value="0" style="height:30px; width:200px;padding:0px 5px; border:0px; border-bottom:1px solid gray;">
					</div>
				</div>
			</div>
			<div style="margin:30px 0px; text-align:right; width:1110px;">
					<button style="width:100px; border:0px; color:white; background-color:#0863ec; border-radius:10px; font-weight:bold; font-size:11pt; cursor:pointer;">객실 등록</button>
			</div>
		</form>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>