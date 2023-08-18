<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script>
window.onload = function(){
	const openButton = document.getElementById("open-gallery-button");
	const modal = document.getElementById("gallery-modal");
	const closeButton = document.getElementById("close-button");

	openButton.addEventListener("click", () => {
	  modal.style.display = "block";
	  document.body.style.overflow = "hidden";
	});

	closeButton.addEventListener("click", () => {
	  modal.style.display = "none";
	  document.body.style.overflow = "auto";
	});

	window.addEventListener("click", (event) => {
	  if (event.target === modal) {
	    modal.style.display = "none";
	    document.body.style.overflow = "auto";
	  }
	});
	  
}
function room_thumbnail(index){
	var attach_idx = document.getElementsByName("attach_idx")[index].value;
	var room_idx = document.getElementsByName("room_idx")[index].value;
	$.ajax({
		url:"room_thumbnail.do",
		type:"post",
		data:{
			attach_idx:attach_idx,
			room_idx:room_idx
		},
		success:function(){
			alert("썸네일을 등록하셨습니다.");
		},
		error:function(error){
			console.log('ERROR: ', error);
		}
	});
}	

function room_attach_delete(index){
	var attach_idx = document.getElementsByName("attach_idx")[index];
	var attach_img = document.getElementsByName("attach_img")[index];
	$.ajax({
		url:"room_attach_delete.do",
		type:"post",
		data:{
			attach_idx:attach_idx.value
		},
		success:function(){
			alert("등록된 이미지를 삭제하셨습니다.");
			attach_img.style.display = "none";
		},
		error:function(error){
			console.log('ERROR: ', error);
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
		/* 갤러리 모달 스타일 */
	.gallery-modal {
	  display: none;
	  position: fixed;
	  z-index: 1000;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  background-color: rgba(0, 0, 0, 0.5);
	  overflow: auto;
	}
	
	.gallery-content {
	  display: flex;
	  flex-wrap: wrap;
	  justify-content: center;
	  padding: 20px;
	}
	
	.gallery-content img {
	  max-width: 100%;
	  height: auto;
	  margin:2px 0px;
	}
	
	.close-button {
	  color: white;
	  font-size: 30px;
	  position: absolute;
	  top: 10px;
	  right: 20px;
	  cursor: pointer;
	}	
</style>
<div style="width:1920px; text-align:center; background-color:#dfecfb; padding:20px 0px;">
	<div class="view" style="width:1224px; margin:0 auto; padding:30px;  line-height:50px;">
		<div class="gallery-modal" id="gallery-modal">
		    <div class="gallery-content">
		    	<div class="close-button" id="close-button" style="display:inline-block;">&times;</div>
			    <div class="view" style="width:1224px; padding:20px;">
				    <div style="text-align:left; margin:20px;">
					    <span style="font-weight:bold; font-size:15pt;">숙소 제공 객실 이미지</span>
				    </div>
				    <div style="margin:20px; width:1144px; height:1px; background-color:lightgray;"></div>
				    <div style="margin:20px; text-align:left;">
					    <c:forEach items="${attach}" var="attach" varStatus="status">
						    <div name="attach_img" style="display:inline-block; margin:20px 0px;">
						   		<img src="<%=request.getContextPath()%>/resources/upload/${attach.physical_name}" style="width:370px; height:250px; border-radius:5px; display:inline-block;"><br>
							    	<input type="hidden" name="attach_idx" value="${attach.attach_idx}">
							    	<input type="hidden" name="room_idx" value="${attach.room_idx}">
							   		<button onclick="room_thumbnail(${status.index})" style="border:0px; background-color:transparent; border-radius:5px; padding:10px; height:50px; line-height:25px;font-weight:bold;">썸네일 등록</button>
							   		<button onclick="room_attach_delete(${status.index})" style="border:0px; background-color:transparent; border-radius:5px; padding:10px; height:50px; line-height:25px;font-weight:bold;">등록 이미지 삭제</button>
						    </div>
					    </c:forEach>
				    </div>
			    </div>
		    </div>
		</div>	
		<div style="width:100%; padding:10px; margin:10px 0px;"><span style="font-size:20pt; font-weight:bold;">객실 정보 수정하기</span></div>
		<div style="width:100%; padding:10px; margin:10px 0px; text-align:left;">
			<form name="frm" action="rentalhomeModify_room.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="rentalhome_idx" value="${rentalhomeVO.rentalhome_idx}">
				<input type="hidden" name="room_idx" value="${roomVO.room_idx}">
					<div style="margin:10px 0px;">
						<div style="display:inline-block; width:200px; text-align:right; margin-right:30px; vertical-align:top;">
							<span style="font-weight:bold;">객실 등록 이미지 관리</span>
						</div>
						<div id="open-gallery-button" style="display:inline-block; cursor:pointer;">등록된 이미지 보기</div>
					</div>
				<div style="margin:10px 0px;">
					<div style="display:inline-block; width:200px; text-align:right; margin-right:30px; vertical-align:top;">
						<span style="font-weight:bold;">객실 이미지 추가 업로드</span>
					</div>
					<div style="display:inline-block; width:800px;">
						<input type="file" name="multiFile" multiple style="padding:0px 5px;border:0px;">
						<div id="preview" style="text-align:left;"></div>
					</div>
				</div>
				<div style="margin:10px 0px;">
					<div style="display:inline-block; width:200px; text-align:right; margin-right:30px;">
						<span style="font-weight:bold;">객실 이름</span>
					</div>
					<div style="display:inline-block; width:800px;">
						<input type="text" name="name" value="${roomVO.name}" style="width:100%;padding:0px 5px;border:0px; border-bottom:1px solid gray;">
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
									<option value="1" <c:if test="${roomVO.min_person == 1}">selected</c:if>>1</option>
									<option value="2" <c:if test="${roomVO.min_person == 2}">selected</c:if>>2</option>
									<option value="3" <c:if test="${roomVO.min_person == 3}">selected</c:if>>3</option>
									<option value="4" <c:if test="${roomVO.min_person == 4}">selected</c:if>>4</option>
									<option value="5" <c:if test="${roomVO.min_person == 5}">selected</c:if>>5</option>
									<option value="6" <c:if test="${roomVO.min_person == 6}">selected</c:if>>6</option>
									<option value="7" <c:if test="${roomVO.min_person == 7}">selected</c:if>>7</option>
									<option value="8" <c:if test="${roomVO.min_person == 8}">selected</c:if>>8</option>
									<option value="9" <c:if test="${roomVO.min_person == 9}">selected</c:if>>9</option>
									<option value="10"<c:if test="${roomVO.min_person > 10}">selected</c:if>>10+</option>
								</select>
								<span style="font-size:11pt; margin:0px 20px;">최대 인원  수</span>
								<select class="search" name="max_person" style="text-align:center;font-weight:bold; font-size:11pt;width:100px; height:25px; outline:none; border:0px; border-bottom:1px solid gray;">
									<option selected ></option>
									<option value="1" <c:if test="${roomVO.max_person == 1}">selected</c:if>>1</option>
									<option value="2" <c:if test="${roomVO.max_person == 2}">selected</c:if>>2</option>
									<option value="3" <c:if test="${roomVO.max_person == 3}">selected</c:if>>3</option>
									<option value="4" <c:if test="${roomVO.max_person == 4}">selected</c:if>>4</option>
									<option value="5" <c:if test="${roomVO.max_person == 5}">selected</c:if>>5</option>
									<option value="6" <c:if test="${roomVO.max_person == 6}">selected</c:if>>6</option>
									<option value="7" <c:if test="${roomVO.max_person == 7}">selected</c:if>>7</option>
									<option value="8" <c:if test="${roomVO.max_person == 8}">selected</c:if>>8</option>
									<option value="9" <c:if test="${roomVO.max_person == 9}">selected</c:if>>9</option>
									<option value="10"<c:if test="${roomVO.max_person > 10}">selected</c:if>>10+</option>
								</select>
						</div>
					</div>
				</div>
				<div style="margin:10px 0px;">
					<div style="display:inline-block; width:200px; text-align:right; margin-right:30px;">
						<span style="font-weight:bold;">객실 내 흡연 가능 여부</span>
					</div>
					<div style="display:inline-block; width:800px; text-align:left;">
						<input type="radio" name="smoking" value="Y" <c:if test="${roomVO.smoking eq 'Y'}">checked</c:if> style="width:15px; height:15px; margin:0px 10px;"><span style="font-size:12pt; color:#0f294d;">가능</span>
						<input type="radio" name="smoking" value="N" <c:if test="${roomVO.smoking eq 'N'}">checked</c:if> style="width:15px; height:15px; margin:0px 10px;"><span style="font-size:12pt; color:#0f294d;">불가능</span>
					</div>
				</div>
				<div style="margin:10px 0px;">
					<div style="display:inline-block; width:200px; text-align:right; margin-right:30px;">
						<span style="font-weight:bold;">와이파이</span>
					</div>
					<div style="display:inline-block; width:800px; text-align:left;">
						<input type="radio" name="wifi" value="Y" <c:if test="${roomVO.wifi eq 'Y'}">checked</c:if> style="width:15px; height:15px; margin:0px 10px;"><span style="font-size:12pt; color:#0f294d;">설치</span>
						<input type="radio" name="wifi" value="N" <c:if test="${roomVO.wifi eq 'N'}">checked</c:if> style="width:15px; height:15px; margin:0px 10px;"><span style="font-size:12pt; color:#0f294d;">미설치</span>
					</div>
				</div>
				<div style="margin:10px 0px;">
					<div style="display:inline-block; width:200px; text-align:right; margin-right:30px;">
						<span style="font-weight:bold;">침대정보</span>
					</div>
					<div style="display:inline-block; width:800px;">
						<input type="text" name="bed_info" value="${roomVO.bed_info}" style="width:100%;padding:0px 5px;border:0px; border-bottom:1px solid gray;">
					</div>
				</div>
				<div style="margin:10px 0px;">
					<div style="display:inline-block; width:200px; text-align:right; margin-right:30px;">
						<span style="font-weight:bold;">가격</span>
					</div>
					<div style="display:inline-block; width:800px; text-align:left;">
						<div style="margin-bottom:20px;">
							<span style="font-size:11pt;font-weight:bold; margin-right:20px;">상시가</span><input type="text" value="${roomVO.weekday_price }" name="weekday_price" style="height:30px; width:200px;padding:0px 5px;border:0px; border-bottom:1px solid gray;">
							<span style="font-size:11pt;font-weight:bold; margin:0px 20px;">주말가</span><input type="text" value="${roomVO.weekend_price }" name="weekend_price" style="height:30px; width:200px;padding:0px 5px;border:0px; border-bottom:1px solid gray;">
						</div>
					</div>
				</div>
				<div style="margin:10px 0px;">
					<div style="display:inline-block; width:200px; text-align:right; margin-right:30px;  vertical-align:top;">
						<span style="font-weight:bold;">할인</span>
					</div>
					<div style="display:inline-block; width:800px; text-align:left;">
						<div style="margin-bottom:20px;">
							<span style="font-size:11pt;font-weight:bold; margin-right:20px;">이유</span><input type="text" name="discount_reason" value="${roomVO.discount_reason}" style="height:30px; width:600px;padding:0px 5px;border:0px; border-bottom:1px solid gray;"><br>
							<span style="font-size:11pt;font-weight:bold; margin-right:20px;">할인 종류</span><br>
							<select name="discount_type" style="border:0px; font-size:11pt; font-weight:bold; margin-right:20px; width:100px; height:30px; text-align:left;">
								<option value="default" <c:if test="${roomVO.discount_type eq 'default' }">selected</c:if>>할인 없음</option>
								<option value="rate" <c:if test="${roomVO.discount_type eq 'rate' }">selected</c:if>>비율 할인</option>
								<option value="fix" <c:if test="${roomVO.discount_type eq 'fix' }">selected</c:if>>고정 할인</option>
							</select>
							<input type="number" name="discount_money" value="${roomVO.discount_money}" style="height:30px; width:200px;padding:0px 5px;border:0px; border-bottom:1px solid gray;">
						</div>
					</div>
				</div>
				<div style="margin:30px 0px; text-align:right; width:1110px;">
						<input type="button" onclick="location.href='rentalhomeView.do?rentalhome_idx=${rentalhomeVO.rentalhome_idx}'" style="width:120px; border:0px; color:white; background-color:#0863ec; border-radius:10px; font-weight:bold; font-size:11pt; cursor:pointer;" value="이전 페이지로">
						<button style="width:100px; border:0px; color:white; background-color:#0863ec; border-radius:10px; font-weight:bold; font-size:11pt; cursor:pointer;">객실 등록</button>
				</div>
			</form>
		</div>
	</div>
</div>
<%@ include file="../include/footer.jsp" %>