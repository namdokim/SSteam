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
<script>
window.onload = function(){
	
}
</script>
<div style="width:1920px; text-align:center; background-color:#f0f7fe; padding:20px 0px;">
	<div class="view" style="width:1224px; margin:0 auto; padding:30px;  line-height:50px; ">
		<div style="width:100%; padding:10px; margin:10px 0px;"><span style="font-size:20pt; font-weight:bold;">숙소 등록하기</span></div>
		<div style="width:100%; padding:10px; margin:10px 0px; text-align:left;">
			<form name="frm" action="rentalhomeModify.do" method="post" >
			<input type="hidden" name="rentalhome_idx" value="${rentalhomeVO.rentalhome_idx	}">
				<div style="margin:10px 0px;">
					<div style="display:inline-block; width:200px; text-align:right; margin-right:30px;">
						<span style="font-weight:bold;">숙박 시설 이름</span>
					</div>
					<div style="display:inline-block; width:800px;">
						<input type="text" name="name" value="${rentalhomeVO.name}" placeholder="숙박 시설의 상호 명을 입력해주세요" style="width:100%;padding:0px 5px;border:0px; border-bottom:1px solid gray;">
					</div>
				</div>
				<div style="margin:10px 0px 30px 0px;">
					<div style="display:inline-block; width:200px; text-align:right; margin-right:30px;">
						<span style="font-weight:bold;">주소</span>
					</div>
					<div style="display:inline-block; width:800px;">
						<input type="text" name="address" value="${rentalhomeVO.address}" placeholder="숙박 시설의 주소를 입력해주세요" style="width:100%;padding:0px 5px;border:0px; border-bottom:1px solid gray;">
					</div>
				</div>
				<div style="margin:10px 0px;">
					<div style="display:inline-block; width:200px; text-align:right; margin-right:30px; vertical-align:top;">
						<span style="font-weight:bold;">숙소 소개글</span>
					</div>
					<div style="display:inline-block; width:800px;">
						<textarea placeholder="숙소의 소개글을 입력해주세요." name="info" style="width:100%; padding:0px 5px; height:200px; resize:none;">${rentalhomeVO.info}</textarea>
					</div>
				</div>
				<div style="margin:10px 0px;">
					<div style="display:inline-block; width:200px; text-align:right; margin-right:30px;">
						<span style="font-weight:bold;">숙소 종류</span>
					</div>
					<div style="display:inline-block; width:800px;">
						<select name="type" style="width:300px; padding:10px; border:0px; border-bottom:1px solid gray; font-size:11pt;">
							<option selected>등록할 숙소의 종류를 선택해주세요</option>
							<option value="motel" <c:if test="${rentalhomeVO.type == 'motel'}">selected</c:if>>모텔</option>
							<option value="hotel" <c:if test="${rentalhomeVO.type == 'hotel'}">selected</c:if>>호텔</option>
							<option value="resort" <c:if test="${rentalhomeVO.type == 'resort'}">selected</c:if>>리조트</option>
							<option value="pension" <c:if test="${rentalhomeVO.type == 'pension'}">selected</c:if>>펜션</option>
							<option value="guesthouse" <c:if test="${rentalhomeVO.type == 'guesthouse'}">selected</c:if>>게스트 하우스</option>
							<option value="camping" <c:if test="${rentalhomeVO.type == 'camping'}">selected</c:if>>캠핑  & 글램핑</option>
						</select>
					</div>
				</div>
				<div style="margin:10px 0px;">
					<div style="display:inline-block; width:200px;  height:100px; text-align:right; margin-right:30px; vertical-align:top;">
						<span style="font-weight:bold;">호텔 내 시설 체크</span>
					</div>
					<div style="display:inline-block; width:800px; height:100px; vertical-align:top;">
						<div style="display:inline-block; width:150px;">
							<input type="checkbox" <c:if test="${rentalhomeVO.inPool_yn == 'Y'}">checked</c:if> class="facility" name="inPool_yn" value="Y" style="width:15px; height:15px;"><span style="margin-left:10px;font-size:11pt; color:#0f294d;">내부 수영장</span>
						</div>
						<div style="display:inline-block; width:150px;">
							<input type="checkbox" <c:if test="${rentalhomeVO.outPool_yn == 'Y'}">checked</c:if> class="facility" name="outPool_yn" value="Y" style="width:15px; height:15px;"><span style="margin-left:10px;font-size:11pt; color:#0f294d;">야외 수영장</span>
						</div>
						<div style="display:inline-block; width:150px;">
							<input type="checkbox" <c:if test="${rentalhomeVO.parking_yn == 'Y'}">checked</c:if> class="facility" name="parking_yn" value="Y" style="width:15px; height:15px;"><span style="margin-left:10px;font-size:11pt; color:#0f294d;">주차장</span>
						</div>
						<div style="display:inline-block; width:150px;">
							<input type="checkbox" <c:if test="${rentalhomeVO.pickup_yn == 'Y'}">checked</c:if> class="facility" name="pickup_yn" value="Y" style="width:15px; height:15px;"><span style="margin-left:10px;font-size:11pt; color:#0f294d;">픽업</span>
						</div>
						<div style="display:inline-block; width:150px;">
							<input type="checkbox" <c:if test="${rentalhomeVO.wifi_yn == 'Y'}">checked</c:if> class="facility" name="wifi_yn" value="Y" style="width:15px; height:15px;"><span style="margin-left:10px;font-size:11pt; color:#0f294d;">와이파이</span>
						</div>
						<div style="display:inline-block; width:150px;">
							<input type="checkbox" <c:if test="${rentalhomeVO.beach_yn == 'Y'}">checked</c:if> class="facility" name="beach_yn" value="Y" style="width:15px; height:15px;"><span style="margin-left:10px;font-size:11pt; color:#0f294d;">인근해변</span>
						</div>
						<div style="display:inline-block; width:150px;">
							<input type="checkbox" <c:if test="${rentalhomeVO.bbq_yn == 'Y'}">checked</c:if> class="facility" name="bbq_yn" value="Y" style="width:15px; height:15px;"><span style="margin-left:10px;font-size:11pt; color:#0f294d;">바베큐</span>
						</div>
						<div style="display:inline-block; width:150px;">
							<input type="checkbox" <c:if test="${rentalhomeVO.breakfast_yn == 'Y'}">checked</c:if> class="facility" name="breakfast_yn" value="Y" style="width:15px; height:15px;"><span style="margin-left:10px;font-size:11pt; color:#0f294d;">조식</span>
						</div>
						<div style="display:inline-block; width:150px;">
							<input type="checkbox" <c:if test="${rentalhomeVO.animal_yn == 'Y'}">checked</c:if> class="facility" name="animal_yn" value="Y" style="width:15px; height:15px;"><span style="margin-left:10px;font-size:11pt; color:#0f294d;">반려동물</span>
						</div>
					</div>
				</div>
				<div style="margin:10px 0px;">
					<div style="display:inline-block; width:200px; text-align:right; margin-right:30px; vertical-align:top;">
						<span style="font-weight:bold;">숙소 규정</span>
					</div>
					<div style="display:inline-block; width:800px;">
						<div style="margin-bottom:20px;">
							<span style="font-weight:bold;">체크인 & 체크아웃</span><br>
							<span style="font-size:11pt; margin:0px 20px;">체크인 시간</span><input type="text" name="checkIn" value="${rentalhomeVO.checkIn}" style="height:30px; width:200px;padding:0px 5px;border:0px; border-bottom:1px solid gray;">
							<span style="font-size:11pt; margin:0px 20px;">체크아웃 시간</span><input type="text" name="checkOut" value="${rentalhomeVO.checkOut}"style="height:30px; width:200px;padding:0px 5px;border:0px; border-bottom:1px solid gray;">
						</div>
						<div style="margin-bottom:20px;">
							<span style="font-weight:bold;">체크인 방법</span><br>
							<input type="text" value="${rentalhomeVO.checkIn_info}" name="checkIn_info"style="width:800px; height:30px;padding:0px 5px;border:0px; border-bottom:1px solid gray;">
						</div>
						<div style="margin-bottom:20px;">
							<span style="font-weight:bold;">조식</span><br>
							<div style="display:inline-block; width:120px; text-align:right; margin-right:30px; vertical-align:top;">
								<span style="font-size:11pt; margin:0px 20px;">요금 / 1인</span>
							</div>
							<input type="text" value="${rentalhomeVO.breakfast_price}" name="breakfast_price" style="height:30px; width:200px;padding:0px 5px;border:0px; border-bottom:1px solid gray;">
							<br>
							<div style="display:inline-block; width:120px; text-align:right; margin-right:30px; vertical-align:top;">
								<span style="font-size:11pt; margin:0px 20px;">영업시간</span>
							</div>
							<input type="text" value="${rentalhomeVO.breakfast_open}"name="breakfast_open" style="height:30px; width:100px;padding:0px 5px;border:0px; border-bottom:1px solid gray;">
							~
							<input type="text" value="${rentalhomeVO.breakfast_close}" name="breakfast_close"style="height:30px; width:100px;padding:0px 5px;border:0px; border-bottom:1px solid gray;"><br>
							<div style="display:inline-block; width:120px; text-align:right; margin-right:30px; vertical-align:top;">
								<span style="font-size:11pt; margin:0px 20px;">영업일</span>
							</div>
							<input type="checkbox" name="breakfast_day" value="월요일" style="width:15px; height:15px;"><span style="margin:0px 10px;font-size:11pt; color:#0f294d;">월요일</span>
							<input type="checkbox" name="breakfast_day" value="화요일" style="width:15px; height:15px;"><span style="margin:0px 10px;font-size:11pt; color:#0f294d;">화요일</span>
							<input type="checkbox" name="breakfast_day" value="수요일" style="width:15px; height:15px;"><span style="margin:0px 10px;font-size:11pt; color:#0f294d;">수요일</span>
							<input type="checkbox" name="breakfast_day" value="목요일" style="width:15px; height:15px;"><span style="margin:0px 10px;font-size:11pt; color:#0f294d;">목요일</span>
							<input type="checkbox" name="breakfast_day" value="금요일" style="width:15px; height:15px;"><span style="margin:0px 10px;font-size:11pt; color:#0f294d;">금요일</span>
							<input type="checkbox" name="breakfast_day" value="토요일" style="width:15px; height:15px;"><span style="margin:0px 10px;font-size:11pt; color:#0f294d;">토요일</span>
							<input type="checkbox" name="breakfast_day" value="일요일" style="width:15px; height:15px;"><span style="margin:0px 10px;font-size:11pt; color:#0f294d;">일요일</span>
						</div>
					</div>
				</div>
				<div style="margin:30px 0px; text-align:right; width:1050px;">
					<button style="width:100px; border:0px; color:white; background-color:#0863ec; border-radius:10px; font-weight:bold; font-size:11pt; cursor:pointer;">숙소 등록</button>
				</div>
			</form>
		</div>
	</div>
</div>	
<%@ include file="../include/footer.jsp" %>