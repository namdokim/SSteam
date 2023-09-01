<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
window.onload = function(){
	const discount_type = document.getElementById("discount_type");
	const discount_money_div1 = document.getElementById("discount_money_div1");
	const discount_money_div2 = document.getElementById("discount_money_div2");
	const discount_money = document.getElementById("discount_money");
	const weekday_price = document.getElementById("weekday_price");
	const weekend_price = document.getElementById("weekend_price");
	const discount_reason = document.getElementById("discount_reason");
	const weekday_discount_price = document.getElementById("weekday_discount_price");
	const weekend_discount_price = document.getElementById("weekend_discount_price");
	
	if(discount_type.value == "default"){
		discount_money_div1.style.display = "none";
		discount_money_div2.style.display = "none";
	}else{
		discount_money_div1.style.display = "block";
		discount_money_div2.style.display = "block";
	}
	
	discount_type.onchange = function(){
		discount_money.value = 0;
		if(discount_type.value == "default"){
			discount_money_div1.style.display = "none";
			discount_money_div2.style.display = "none";
			
			discount_reason.value = "";
		}else{
			discount_money_div1.style.display = "block";
			discount_money_div2.style.display = "block";
		}
		cal_discount()
	};
	
	weekday_price.addEventListener('blur', cal_discount);
	weekend_price.addEventListener('blur', cal_discount);
	weekend_price.addEventListener('blur', cal_discount);
	discount_money.addEventListener('blur', cal_discount);
	
};

function cal_discount(){
	const discount_type = document.getElementById("discount_type");
	const weekday_price = document.getElementById("weekday_price");
	const weekend_price = document.getElementById("weekend_price");
	const weekday_discount_price = document.getElementById("weekday_discount_price");
	const weekend_discount_price = document.getElementById("weekend_discount_price");
	const discount_money = document.getElementById("discount_money");
	const discount_reason = document.getElementById("discount_reason");
	
	if(discount_type.value == 'default'){
		document.getElementById("weekday_discount_price").value = weekday_price.value; 
		document.getElementById("weekend_discount_price").value = weekend_price.value; 
	}else if(discount_type.value == 'fix'){
		document.getElementById("weekday_discount_price").value = weekday_price.value - discount_money.value; 
		document.getElementById("weekend_discount_price").value = weekend_price.value - discount_money.value;
	}else{
		document.getElementById("weekday_discount_price").value = weekday_price.value*((100-discount_money.value)/100); 
		document.getElementById("weekend_discount_price").value = weekend_price.value*((100-discount_money.value)/100);
	}
	
	if(weekday_discount_price.value <=0 || weekend_discount_price.value <=0 ){
		weekday_discount_price.value = 0;
		weekend_discount_price.value = 0;
	}
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
<!-- CSS ================================================================= -->
<style>

.form-signin .scrollable-x {
  overflow-x: auto;
  white-space: nowrap;
}

.form-signin {
  max-width: 700px;
  padding: 15px;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input {
  margin-bottom: 1px;


}
.masthead:before {
    content: "";
    position: absolute;
    background-color: #1c375e;
    height: 100%;
    width: 100%;
    top: 0;
    left: 0;
    opacity: 0.5;
}		
.masthead {
    position: relative;
    background: url(../img/homeback.jpg) no-repeat center center;
    background-size: cover;
    height:400px
}	
</style>

<div class="masthead text-center pt-5" style="height:170%; font-family: 'TheJamsil5Bold'; ">
	<div class="form-signin card shadow-sm w-100 m-auto" >
		<!-- 모달 -->
		<div class="modal fade" id="rentalhome_room_attach" tabindex="-1" aria-labelledby="rentalhome_room_attachLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered modal-xl">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="rentalhome_room_attachLabel">숙소에 등록된 이미지</h5>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div style="margin:24px; text-align:left;">
							<c:forEach items="${attach}" var="attach" varStatus="status">
								<div name="attach_img" style="display:inline-block; margin:20px 0px;">
									<img src="<%=request.getContextPath()%>/resources/upload/${attach.physical_name}" style="width:350px; height:230px; border-radius:5px; display:inline-block;"><br>
									<input type="hidden" name="attach_idx" value="${attach.attach_idx}">
									<input type="hidden" name="room_idx" value="${attach.room_idx}">
									<button onclick="room_thumbnail(${status.index})" style="border:0px; background-color:transparent; border-radius:5px; padding:10px; height:50px; line-height:25px;font-weight:bold;">썸네일 등록</button>
									<button onclick="room_attach_delete(${status.index})" style="border:0px; background-color:transparent; border-radius:5px; padding:10px; height:50px; line-height:25px;font-weight:bold;">등록 이미지 삭제</button>
								</div>
							</c:forEach>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-primary" data-bs-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
		<form name="frm" action="rentalhomeModify_room.do" method="post" style="text-align: center;" enctype="multipart/form-data">
			<input type="hidden" name="rentalhome_idx" value="${rentalhomeVO.rentalhome_idx}">
			<input type="hidden" name="room_idx" value="${roomVO.room_idx}">
			<a class="navbar-brand" href="<%=request.getContextPath()%>/rentalhome/rentalhomeMain.do" title="Arcalive">
			<svg xmlns="http://www.w3.org/2000/svg" style="color:#0863ec" width="72" height="60" fill="currentColor" class="bi bi-house-gear" viewBox="0 0 16 16">
			  <path d="M7.293 1.5a1 1 0 0 1 1.414 0L11 3.793V2.5a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v3.293l2.354 2.353a.5.5 0 0 1-.708.708L8 2.207l-5 5V13.5a.5.5 0 0 0 .5.5h4a.5.5 0 0 1 0 1h-4A1.5 1.5 0 0 1 2 13.5V8.207l-.646.647a.5.5 0 1 1-.708-.708L7.293 1.5Z"/>
			  <path d="M11.886 9.46c.18-.613 1.048-.613 1.229 0l.043.148a.64.64 0 0 0 .921.382l.136-.074c.561-.306 1.175.308.87.869l-.075.136a.64.64 0 0 0 .382.92l.149.045c.612.18.612 1.048 0 1.229l-.15.043a.64.64 0 0 0-.38.921l.074.136c.305.561-.309 1.175-.87.87l-.136-.075a.64.64 0 0 0-.92.382l-.045.149c-.18.612-1.048.612-1.229 0l-.043-.15a.64.64 0 0 0-.921-.38l-.136.074c-.561.305-1.175-.309-.87-.87l.075-.136a.64.64 0 0 0-.382-.92l-.148-.044c-.613-.181-.613-1.049 0-1.23l.148-.043a.64.64 0 0 0 .382-.921l-.074-.136c-.306-.561.308-1.175.869-.87l.136.075a.64.64 0 0 0 .92-.382l.045-.148ZM14 12.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0Z"/>
			</svg>
			</a>
			<h1 class="h3 mb-3 fw-normal" style="color:#0863ec">객실 수정하기</h1>
	
			<div class="form-floating">
				
				<h5 style=" font-weight:bold;">${rentalhomeVO.name}</h5>
			</div>
			
			<div class="form-floating mb-3">
				<input type="text" class="form-control" placeholder="객실 이름" id="name" name="name" value="${roomVO.name}">
  				<label for="name" class="text-muted">객실 이름</label>
			</div>
			
			<div class="card mb-2">
				<span class="text-muted ms-2" style="text-align: left">객실 인원 수</span>
				<div class="row mx-1 my-1">
					<div class="form-floating col ms-1 my-1">
						<select class="form-select ms-1" name="min_person" aria-label="Default select example">
							<option selected>최소 인원을 선택해주세요</option>
							<option value="1" <c:if test="${roomVO.min_person == 1}">selected</c:if>>1</option>
							<option value="2" <c:if test="${roomVO.min_person == 2}">selected</c:if>>2</option>
							<option value="3" <c:if test="${roomVO.min_person == 3}">selected</c:if>>3</option>
							<option value="4" <c:if test="${roomVO.min_person == 4}">selected</c:if>>4</option>
							<option value="5" <c:if test="${roomVO.min_person == 5}">selected</c:if>>5</option>
							<option value="6" <c:if test="${roomVO.min_person == 6}">selected</c:if>>6</option>
							<option value="7" <c:if test="${roomVO.min_person == 7}">selected</c:if>>7</option>
							<option value="8" <c:if test="${roomVO.min_person == 8}">selected</c:if>>8</option>
							<option value="9" <c:if test="${roomVO.min_person == 9}">selected</c:if>>9</option>
							<option value="10" <c:if test="${roomVO.min_person >= 10}">selected</c:if>>10+</option>
						</select>
						<label for="min_person" class="form-label text-muted ms-3">최소 인원 수</label>
					</div>
					<div class="form-floating col ms-1 my-1">	
						<select class="form-select ms-1" name="max_person" aria-label="Default select example">
							<option selected>최대 인원을 선택해주세요</option>
							<option value="1" <c:if test="${roomVO.max_person == 1}">selected</c:if>>1</option>
							<option value="2" <c:if test="${roomVO.max_person == 2}">selected</c:if>>2</option>
							<option value="3" <c:if test="${roomVO.max_person == 3}">selected</c:if>>3</option>
							<option value="4" <c:if test="${roomVO.max_person == 4}">selected</c:if>>4</option>
							<option value="5" <c:if test="${roomVO.max_person == 5}">selected</c:if>>5</option>
							<option value="6" <c:if test="${roomVO.max_person == 6}">selected</c:if>>6</option>
							<option value="7" <c:if test="${roomVO.max_person == 7}">selected</c:if>>7</option>
							<option value="8" <c:if test="${roomVO.max_person == 8}">selected</c:if>>8</option>
							<option value="9" <c:if test="${roomVO.max_person == 9}">selected</c:if>>9</option>
							<option value="10" <c:if test="${roomVO.max_person == 10}">selected</c:if>>10+</option>
						</select>
						<label for="max_person" class="form-label text-muted ms-3">최대 인원 수</label>
					</div>
				</div>
			</div>	
			<div class="card mb-2">
				<span class="text-muted ms-2" style="text-align: left">흡연 가능 여부</span>
				<div class="d-flex my-2">
					<div class="form-check form-check-inline mx-2">
						<input class="form-check-input"  type="radio" name="smoking" value="Y" id="smoking" <c:if test="${roomVO.smoking eq 'Y'}">checked</c:if>>
						<label class="form-check-label" for="smoking">
							가능
						</label>
					</div>
					<div class="form-check form-check-inline mx-2">
						<input class="form-check-input" type="radio" name="smoking" value="N" id="smoking" <c:if test="${roomVO.smoking eq 'N'}">checked</c:if>>
						<label class="form-check-label ms-0" for="smoking">
							 불가능
						</label>
					</div>
				</div>	
			
				<span class="text-muted ms-2" style="text-align: left">와이파이</span>
				<div class="d-flex my-2">
					<div class="form-check mx-2">
						<input class="form-check-input" type="radio" name="wifi" value="Y" id="wifi" <c:if test="${roomVO.wifi eq 'Y'}">checked</c:if>>
						<label class="form-check-label" for="wifi">
							설치
						</label>
					</div>
					<div class="form-check mx-2">
						<input class="form-check-input" type="radio" name="wifi" value="N" id="wifi" <c:if test="${roomVO.wifi eq 'N'}">checked</c:if>>
						<label class="form-check-label ms-0" for="wifi">
							 미설치
						</label>
					</div>
				</div>	
			</div>
			
			<div class="d-flex" >
				<span class="ms-2" style="text-align: left">침대정보</span>
			</div>
			<div class="form-floating">
				<input type="text" value="${roomVO.bed_info}" id="bed_info" class="form-control" id="bed_info" placeholder="객실 내 침대 종류 및 갯수를 입력해주세요" name="bed_info">
				<label for="bed_info" class="text-muted">객실 내 침대 종류 및 갯수를 입력해주세요</label>
			</div>
			<div class="d-flex">
				<span class="text-left ms-2 mt-1">가격</span>
			</div>
			<div class="card px-2 py-2">
				<div class="d-flex">
					<div class="form-floating col mx-1 my-1">
						<input type="text" value="${roomVO.weekday_price }"  class="form-control px-3" name="weekday_price" id="weekday_price" placeholder="상시가">
						<label for="weekday_price" class="text-muted mx-1">상시가</label>
					</div>
					<div class="form-floating col mx-1 my-1">
						<input type="text" value="${roomVO.weekend_price }" class="form-control px-3" name="weekend_price" id="weekend_price" placeholder="주말가">
						<label for="weekend_price" class="text-muted mx-1">주말가</label>
					</div>
				</div>	
				<div class="d-flex">
				<span class=" text-left ms-2">할인</span>
				</div>
				
				<div class="d-flex mb-2 mx-1">
					<div class="form-floating mx-1 my-1">
						<select name="discount_type" id="discount_type" class="form-select" aria-label="Default select example">
							<option value="default" <c:if test="${roomVO.discount_type eq 'default' }">selected</c:if>>할인없음</option>
							<option value="rate" <c:if test="${roomVO.discount_type eq 'rate' }">selected</c:if>>비율 할인</option>
							<option value="fix" <c:if test="${roomVO.discount_type eq 'fix' }">selected</c:if>>고정 할인</option>
						</select>
						<label for="discount_money" class="form-label">할인 종류</label>
					</div>
					<div id="discount_money_div2" class="form-floating  mx-1 my-1" style="display:none; width:30%;">
						<input type="number" name="discount_money" value="${roomVO.discount_money}" class="form-control" id="discount_money" placeholder="할인 수치">
						<label for="discount_money" class="text-muted" style="font-size:10pt;">비율 할인: % / 고정 할인: 원</label>
					</div>
					<div id="discount_money_div1" class="form-floating col mx-1 my-1" style="display:none;">
						<input type="text" value="${roomVO.discount_reason}" class="form-control" name="discount_reason"  id="discount_reason" placeholder="할인 이유를 적어주세요">
						<label for="discount_reason" class="text-muted">할인 이유</label>
					</div>
				</div>
				<div class="d-flex mb-2 mx-1">
					<div class="form-floating col mx-1 my-1" >
						<input type="number" value="${roomVO.weekday_discount_price}" name="weekday_discount_price" readonly class="form-control" id="weekday_discount_price" placeholder="할인 수치">
						<label for="weekday_discount_price" class="text-muted">상시가 최종(할인가)</label>
					</div>
					<div class="form-floating col mx-1 my-1" >
						<input type="number" value="${roomVO.weekend_discount_price}" name="weekend_discount_price" readonly class="form-control" id="weekend_discount_price" placeholder="할인 수치">
						<label for="weekend_discount_price" class="text-muted">주말가 최종(할인가)</label>
					</div>
				</div>
			</div>
		
			<div class="d-flex ms-2 align-items-center">
				<h1 class="h5 my-3 fw-normal text-muted me-3">객실 이미지 업로드</h1>
				<button type="button" class="btn btn-primary w-20 h-50 my-3" data-bs-toggle="modal" data-bs-target="#rentalhome_room_attach">
					등록된 이미지 보기
				</button>
			</div>	
		
			<div class="card">
				<div class="d-flex">
					<label class="btn btn-primary float-left ms-2 my-2" >
					이미지 선택			
					<input type="file" name="multiFile" multiple style="display: none;">
					</label>
				</div>	
				<div class="ms-4" id="preview" style="overflow-y: auto; max-height: 400px; text-align: left;"></div>
			</div>	
			<br>
			<button class="w-100 btn btn-lg btn-primary" >
				등록
			</button>
		</form>
	</div>
</div>
<%@ include file="../include/footer.jsp" %> 