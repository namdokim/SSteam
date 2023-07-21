<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맛집 리스트</title>
<!-- ======================= 스타일S =========================-->
<style>
    /* CSS 스타일 */
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
    }
    .header {
      background-color: whitesmoke;
      color: #000;
      padding: 20px;
      text-align: center;
    }
    .container {
      margin: 20px 80px;
      max-width: 90%;
      padding: 20px;
      display: flex; /* 추가 */
      align-items: center; /* 가운데 정렬 추가 */
      justify-content: space-between; /* 지도와 아이템 사이에 공간 추가 */
    }
    .restaurant-item {
      border: none; /* 회색 선 제거 */
      margin-bottom: 20px;
      padding: 20px;
      display: flex;
      border-bottom: 0px solid #ddd; /* 바닥선만 추가 */
      flex: 1 1 50%; /* 추가 */
     /*  border-top: 1px solid #ddd; /* 탑선만 추가 */ */
    }

    .restaurant-thumbnail {
      flex: 0 0 auto;
      margin-right: 20px;
    }
    .restaurant-thumbnail img {
      width: 250px;
      height: 250px;
      object-fit: cover;
    }
    .restaurant-info {
      flex: 1 1 auto;
    }
    .restaurant-title {
      font-size: 24px;
      font-weight: bold;
      margin-bottom: 10px;
      color: black; /* 검정색으로 변경 */
    }
    .restaurant-rating {
      font-size: 16px;
      margin-bottom: 10px;
      color: orange; /* 오렌지색으로 변경 */
    }
    .restaurant-address {
      font-size: 10pt;
      color: silver;
    }
    .restaurant-description {
      font-size: 16px;
      line-height: 1.5;
      max-height: 4.5em;
      overflow: hidden;
      position: relative;
      margin-left: 150%; /* 1.5배 오른쪽으로 이동 */
      text-align: center; /* 가운데 정렬 추가 */
    }
    .restaurant-description::after {
      content: "";
      position: absolute;
      bottom: 0;
      right: 0;
      background: linear-gradient(to right, rgba(255, 255, 255, 0), rgba(255, 255, 255, 1) 70%);
      width: 100%;
      height: 1.5em;
    }
    .restaurant-more {
      color: #ff7f00;
      cursor: pointer;
      position: absolute;
      bottom: 0;
      right: 0;
      margin: 0;
      padding: 0;
      background: none;
      border: none;
      font-size: 16px;
      line-height: 1;
    }
    /* .user-info {
      display: flex;
      align-items: center;
      margin-bottom: 10px;
    } */
	.user-info {
	  height: 200px; /* 세로 높이 조정 */
	  width: 60px; /* 가로 간격 조정 */
	  padding: 10px; /* 가로 간격 조정 */
	}
    .user-thumbnail {
      width: 40px;
      height: 40px;
      margin-right: 10px;
      border-radius: 50%;
      overflow: hidden;
    }
    .user-thumbnail img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
    .user-nickname {
      font-size: 14px;
      font-weight: bold;
    }
	.restaurant-item2 {
    width:100%; /* 필요한 가로 간격으로 조정하세요 */
  	}
  	
    <style> 
  .restaurant-item2 {
    display: flex;
    justify-content: space-between;
    align-items: center;
  }

  .restaurant-item2 button {
    margin-left: 10px;
  }
    .header-images {
    display: flex;
    justify-content: center;
    overflow-x: auto;
    white-space: nowrap;
    width:100%;
    /* 추가된 부분: 가로 스크롤 가능하도록 설정 */
  }

  .header-images img {
    width: 250px;
    height: 250px;
    object-fit: cover;
    margin-right: 10px;
    /* 추가된 부분: 이미지 사이 간격 설정 */
  }

  .restaurant-item2 button.like.clicked {
    color: orange;
  }
   /* 컨테이너의 최대 너비를 설정하고 중앙 정렬 */
  .container {
    margin: 20px auto;
    max-width: 1380px; /* 원하는 최대 너비 값 설정 (여기서는 1200px로 설정) */
  }
   /* 1. 가고싶다, 리뷰쓰기 버튼의 모양 제거 */
    .restaurant-item2 button {
        background: none;
        border: none;
        cursor: pointer;
        font-size: 35px; /* 아이콘 크기를 24px로 설정 */
        color: silver; /* 변경된 부분: 기본 색상을 회색으로 설정 */
    }

    /* 2. 리뷰쓰기 버튼에 hover 효과 추가 */
    .restaurant-item2 button:hover {
        color: orange;
    }

    /* 3. 가고싶다 버튼 클릭시 오렌지색으로 변경 */
    .restaurant-item2 button.like.clicked {
        color: orange;
    }
    /* 가고싶다 버튼 모양 설정 */
	.restaurant-item2 button.like {
	  /* 기본 스타일: 빈 별 모양 (예: ☆) */
	  content: "☆";
	}
	
	/* 가고싶다 버튼 클릭시 오렌지색으로 변경 */
  .restaurant-item2 button.like.clicked {
    /* Use the filled star (★) when clicked */
    content: "★";
    color: orange;
  }
      
</style>
<!-- ======================= 스타일E =========================-->
<!-- JavaScript 코드 추가 -->
<script>
  // 화면 크기에 따라 컨텐츠의 크기를 설정하는 함수
  function adjustContentSize() {
    const container = document.querySelector('.container');
    const containerWidth = container.offsetWidth;
    const aspectRatio = 1; // 컨텐츠의 가로:세로 비율 (1:1로 설정)
    const contentHeight = containerWidth / aspectRatio;

    container.style.height = `${contentHeight}px`;
  }

  // 페이지 로드 시 컨텐츠 크기를 설정
  window.addEventListener('load', adjustContentSize);
  // 화면 크기가 변경될 때마다 컨텐츠 크기를 다시 설정
  window.addEventListener('resize', adjustContentSize);

  // 가고싶다 버튼 클릭 이벤트 처리
  const likeButton = document.querySelector('.restaurant-item2 button.like');
  likeButton.addEventListener('click', () => {
    likeButton.classList.toggle('clicked');

    // Add or remove the "clicked" class based on the button state
    if (likeButton.classList.contains('clicked')) {
      likeButton.textContent = '★\n가고싶다';
    } else {
      likeButton.textContent = '☆\n가고싶다';
    }
  });
</script>

</head>

<!-- ======================= 바디S ========================= -->
<body>
  <div class="header-images">
    <div>
      <img src="https://mp-seoul-image-production-s3.mangoplate.com/281547/753280_1550146766591_11966?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" alt="음식 사진 1" width="250" height="250">
      <img src="https://mp-seoul-image-production-s3.mangoplate.com/549779_1688722095256513.jpg?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" alt="음식 사진 2" width="250" height="250">
      <img src="https://mp-seoul-image-production-s3.mangoplate.com/549779_1688722097838776.jpg?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" alt="음식 사진 3" width="250" height="250">
      <img src="https://mp-seoul-image-production-s3.mangoplate.com/549779_1688722099215636.jpg?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" alt="음식 사진 4" width="250" height="250">
      <img src="https://mp-seoul-image-production-s3.mangoplate.com/549779_1688722100253838.jpg?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" alt="음식 사진 5" width="250" height="250">
    </div>
  </div>
  <!-- ===================================== 상단의 이미지 사진 5개 ================================== -->
  </div>

<!-- =========================================== 상세 공간 =================================================================== -->
  <div class="container">
    <div class="restaurant-item">
      <div class="restaurant-item2" style="float: left; width:70%;"> <!-- ========== 70% -->
       <div>
        <div style="width: 100%;">
          <h2>
            <span>
              <span style="color: black;">미라이</span>
              <span style="color: orange;">&nbsp;4.8</span>
            </span>
              <button style="float: right;">★<br>가고싶다 </button>
              <button style="float: right;">✎<br>리뷰쓰기 </button>
          </h2>
        </div>
      </div><br>
   		<p>
			<span style="margin-right: 5px;">👁️</span>536,345 	&nbsp;
			<span style="margin-right: 5px;">✏️</span>132		&nbsp;
			<span style="margin-right: 5px;">⭐</span>10,632	&nbsp;
		</p>
        <hr><br><br>
        <p><strong>주소</strong> 서울특별시 강남구 논현로153길 24 끌레르빌 1F</p>
        <p><strong>지번</strong> 서울시 강남구 신사동 557-25 끌레르빌 1F</p>
        <p><strong>전화번호</strong> 02-540-0934</p>
        <p><strong>음식 종류</strong> 이자카야 / 오뎅 / 꼬치</p>
        <p><strong>가격대</strong> 3만원-4만원</p>
        <p><strong>주차</strong> 주차공간없음</p>
        <p><strong>영업시간</strong> 18:00 - 01:00</p>
        <p><strong>휴일</strong> 일</p>
        <p><strong>웹 사이트</strong> <a href="식당 홈페이지 링크">식당 홈페이지로 가기</a></p><br><br>
        <h3>메뉴</h3>
        <ul>
          <li>사시미8종 (2인) - 41,000원</li>
          <li>마구로치즈아에 - 19,000원</li>
          <li>양갈비 스미비 야끼 - 23,000원</li>
          <li>노도구로 시오 야끼 - 35,000원</li>
          <li>규 스테이크 - 41,000원</li>
        </ul>
        <br><br>
        <div class="menu-photos">
          <img src="https://mp-seoul-image-production-s3.mangoplate.com/112634_1551905615639113.jpg?fit=around|63:63&crop=63:63;*,*&output-format=jpg&output-quality=80" alt="메뉴 사진 1">
          <img src="https://mp-seoul-image-production-s3.mangoplate.com/112634_1551905615921726.jpg?fit=around|63:63&crop=63:63;*,*&output-format=jpg&output-quality=80" alt="메뉴 사진 2">
          <img src="https://mp-seoul-image-production-s3.mangoplate.com/112634_1551905616194724.jpg?fit=around|63:63&crop=63:63;*,*&output-format=jpg&output-quality=80" alt="메뉴 사진 3">
          <img src="https://mp-seoul-image-production-s3.mangoplate.com/112634_1551905616451296.jpg?fit=around|63:63&crop=63:63;*,*&output-format=jpg&output-quality=80" alt="메뉴 사진 4">
		  <br><br>
		  <hr>
        </div>
      </div>
      <div class="restaurant-item3" style="float: right; width:5%; border:0px solid silver;" > 
      </div>
      
      <div class="restaurant-item4" style="float: right; width:25%; border:0px solid silver; background-color:#e9e9e9;"> 
      <img src="../img/map.jpg" alt="지도사진"  style="width: 100%;">
      </div>
    </div>
  </div>
  
<!-- ===========================================  리뷰 공간 =================================================================== -->

	<div class="container">
		<div class="restaurant-item">
			<div class="restaurant-item2" style="float: left; width:70%;">
				<div>
	       			<h2 style="color: black;">리뷰 (29)
	       			<span style="color:silver; float:right;">
		       			전체(29)&nbsp;&nbsp;|&nbsp;
		       			맛있다(9)&nbsp;&nbsp;|&nbsp;
		       			괜찮다(19)&nbsp;&nbsp;|&nbsp;
		       			별로(1)&nbsp;&nbsp;
	       			</span>
	       			</h2>
		        </div>
       			<br>
       			<!-- Review Input Form -->
          
         
				<div>
					<div>
				        <div class="user-thumbnail">
				          <img src="https://slp-statics.astockcdn.net/static_assets/staging/23summer/home/kr/featured-contributors/card-3.jpg?width=580&format=webp" alt="사용자 썸네일">
				        </div>
			       		<div class="user-nickname">세이콩</div>
		       		</div>
		       		
		       		
		       		<div>
			            <label for="review-content"></label>
			            합정 쪽에서 우연히 고미태를 지나칠 때 보면 닫아있을 때가 많아 잠시 잊고 있었는데 언젠가부터 일본식 쑥국수로 오픈했다길래 들러보고 싶었는데 주아팍님의 리뷰에서 끝났다고 해서 순간 헐했었음.
		
						고미태 인스타 피드를 체크하니 다행히 아직 마지막 주여서 일본식 쑥국수를 맛볼 수 있는지 체크 후 들르기로 하고 긴기라기니에서 기대보단 못했던 니코미함박을 먹고 나와 근처인 여기 고미태로 향함.
						
						점심시간이 좀 지난 시간이었는데도 웨이팅하는 커플 손님 한 팀이 있었고 웨이팅 리스트에 이름을 적고 기다리는데 다 먹은 손님이 나오는가 싶더니 셰프분이 나와 웨이팅 리스트를 확인하고 나도 들어와도 된다고 안내를 하셔서 들어가 입구 근처에 있는 키오스크에서 잔술(안동소주22도) 3,000원 말곤 단일 메뉴인 계절 국수 메뉴 9,000원을 선택 후 카운터석으로만 이루어진 자리에 앉음.
						
						자리엔 늘 그렇듯이 물이 든 피처가 세팅되어 있는데 참외가 든 참외물인가 했는데 맛을 보니 레몬의 향긋함 뿜뿜이어서 자세히 보니 레몬물이었음.
						
						셰프분은 타이머를 세팅하시고 면을 삶는 중에 뭔가를 가시길래 뭔지 자세히 보니 가츠오부시 대패 위에 가츠오부시 블럭을 올려 가시는 거여서 진짜 음식에 진심이시구나 함.
						 
						젓가락을 세팅해 주시면서 왼손잡이시면 말씀해 주세요 하시고 드디어 일본식 쌀국수가 나왔는데 먼저 국물을 맛을 보니 아까 대패로 신선하게 가신 가츠오부시와 같은 가츠오부시로 국물을 우리신 건지 신선하면서 은은한 달달함과 감칠맛이 뿜뿜이어서 좋네 함.
						
						이번엔 면을 맛을 보니 워낙 가츠오부시 국물이 좋아선지 쑥의 향긋함은 상대적으로 존재감이 덜 느껴져 오히려 좋은 소바를 먹는 느낌에 가까움.
						
						꼭 주연은 아니더라도 쑥이 메인 테마인데 향긋한 가츠오부시 국물에 더 관심이 쏠리고 고명으로 올라간 쑥은 끝물이어선지 살짝 질깃해서 기대엔 못 미치는 느낌이고 꽃 모양의 노란 고명은 맛을 보니 레몬 껍질이었어서 상큼함을 더해줌.
						
						쑥국수를 먹는 중간에 반찬 느낌으로 같이 드시라고 내어주신 신선하게 간 가츠오부시가 올라간 다시마조림을 맛을 보니 순간 고급 스시집으로 순간이동한 느낌으로 은은히 간장의 짭짤달달한 맛이 밴 다시마의 향긋한 바닷 향과 신선향긋한 가츠오부시와의 조합이 찰떡이어서 차라리 쑥국수보다 더 좋게 느껴져 밥 위에 올려 덮밥으로 내면 이걸 먹으러 오고 싶은 기분임.
						
						국물이 워낙 좋아 안 남기고 다 마신 후 가겔 나와 걷는데 뱃속이 출렁거리는 느낌이고 배가 너무 불러 계획했던 소림커피와 율곡커피로스터스 방문은 다음으로 미룸.
						
						전체적으로 봄 느낌 뿜뿜일 것 같은 일본식 쑥국수를 맛봤는데 가츠오부시가 워낙 좋았어선지 쑥국수란 음식으로보단 국물 맛이나 가츠오부시가 뿌려진 다시마조림이 더 낫게 느껴졌고 쑥과의 어우러짐은 최근 동네 강정이 넘치는 집에서 시즌한정 메뉴로 맛봤던 쑥구리단자나 예전 여수에선가 맛봤었던 도다리쑥국이 더 낫게 느껴졌지만 가츠오부시가 워낙 좋았어서 맛있다로..
						
						맨 마지막 사진은 목소리도 너무 디즈니 느낌이면서 미모도 그렇고 디즈니 인어공주의 할리 베일리양보다 더 인어공주 같이 느껴졌던 한국판 인어공주 주인공인 걸그룹 뉴진스의 다니엘양(한국 이름 모지혜)이고 신선한 가츠오부시가 뿌려진 다시마조림을 먹었을 때를 생각하면 다니엘양이 웃거나 진짜 궁금한 듯 눈을 찡긋하며 '난 알고 싶어 세상 모든 걸 궁금한 모든 걸 묻고 싶어' 하는 인어공주 OST의 하이라이트 부분 느낌이었음.
		       		</div>
		        </div>
		        
		        <br><br>
   				<div>
					<div>
				        <div class="user-thumbnail">
				          <img src="https://slp-statics.astockcdn.net/static_assets/staging/23summer/home/kr/featured-contributors/card-3.jpg?width=580&format=webp" alt="사용자 썸네일">
				        </div>
			       		<div class="user-nickname">세이콩</div>
		       		</div>
		       		
		       		
		       		<div>
			            <label for="review-content"></label>
			            합정 쪽에서 우연히 고미태를 지나칠 때 보면 닫아있을 때가 많아 잠시 잊고 있었는데 언젠가부터 일본식 쑥국수로 오픈했다길래 들러보고 싶었는데 주아팍님의 리뷰에서 끝났다고 해서 순간 헐했었음.
		
						고미태 인스타 피드를 체크하니 다행히 아직 마지막 주여서 일본식 쑥국수를 맛볼 수 있는지 체크 후 들르기로 하고 긴기라기니에서 기대보단 못했던 니코미함박을 먹고 나와 근처인 여기 고미태로 향함.
						
						점심시간이 좀 지난 시간이었는데도 웨이팅하는 커플 손님 한 팀이 있었고 웨이팅 리스트에 이름을 적고 기다리는데 다 먹은 손님이 나오는가 싶더니 셰프분이 나와 웨이팅 리스트를 확인하고 나도 들어와도 된다고 안내를 하셔서 들어가 입구 근처에 있는 키오스크에서 잔술(안동소주22도) 3,000원 말곤 단일 메뉴인 계절 국수 메뉴 9,000원을 선택 후 카운터석으로만 이루어진 자리에 앉음.
						
						자리엔 늘 그렇듯이 물이 든 피처가 세팅되어 있는데 참외가 든 참외물인가 했는데 맛을 보니 레몬의 향긋함 뿜뿜이어서 자세히 보니 레몬물이었음.
						
						셰프분은 타이머를 세팅하시고 면을 삶는 중에 뭔가를 가시길래 뭔지 자세히 보니 가츠오부시 대패 위에 가츠오부시 블럭을 올려 가시는 거여서 진짜 음식에 진심이시구나 함.
						 
						젓가락을 세팅해 주시면서 왼손잡이시면 말씀해 주세요 하시고 드디어 일본식 쌀국수가 나왔는데 먼저 국물을 맛을 보니 아까 대패로 신선하게 가신 가츠오부시와 같은 가츠오부시로 국물을 우리신 건지 신선하면서 은은한 달달함과 감칠맛이 뿜뿜이어서 좋네 함.
						
						이번엔 면을 맛을 보니 워낙 가츠오부시 국물이 좋아선지 쑥의 향긋함은 상대적으로 존재감이 덜 느껴져 오히려 좋은 소바를 먹는 느낌에 가까움.
						
						꼭 주연은 아니더라도 쑥이 메인 테마인데 향긋한 가츠오부시 국물에 더 관심이 쏠리고 고명으로 올라간 쑥은 끝물이어선지 살짝 질깃해서 기대엔 못 미치는 느낌이고 꽃 모양의 노란 고명은 맛을 보니 레몬 껍질이었어서 상큼함을 더해줌.
						
						쑥국수를 먹는 중간에 반찬 느낌으로 같이 드시라고 내어주신 신선하게 간 가츠오부시가 올라간 다시마조림을 맛을 보니 순간 고급 스시집으로 순간이동한 느낌으로 은은히 간장의 짭짤달달한 맛이 밴 다시마의 향긋한 바닷 향과 신선향긋한 가츠오부시와의 조합이 찰떡이어서 차라리 쑥국수보다 더 좋게 느껴져 밥 위에 올려 덮밥으로 내면 이걸 먹으러 오고 싶은 기분임.
						
						국물이 워낙 좋아 안 남기고 다 마신 후 가겔 나와 걷는데 뱃속이 출렁거리는 느낌이고 배가 너무 불러 계획했던 소림커피와 율곡커피로스터스 방문은 다음으로 미룸.
						
						전체적으로 봄 느낌 뿜뿜일 것 같은 일본식 쑥국수를 맛봤는데 가츠오부시가 워낙 좋았어선지 쑥국수란 음식으로보단 국물 맛이나 가츠오부시가 뿌려진 다시마조림이 더 낫게 느껴졌고 쑥과의 어우러짐은 최근 동네 강정이 넘치는 집에서 시즌한정 메뉴로 맛봤던 쑥구리단자나 예전 여수에선가 맛봤었던 도다리쑥국이 더 낫게 느껴졌지만 가츠오부시가 워낙 좋았어서 맛있다로..
						
						맨 마지막 사진은 목소리도 너무 디즈니 느낌이면서 미모도 그렇고 디즈니 인어공주의 할리 베일리양보다 더 인어공주 같이 느껴졌던 한국판 인어공주 주인공인 걸그룹 뉴진스의 다니엘양(한국 이름 모지혜)이고 신선한 가츠오부시가 뿌려진 다시마조림을 먹었을 때를 생각하면 다니엘양이 웃거나 진짜 궁금한 듯 눈을 찡긋하며 '난 알고 싶어 세상 모든 걸 궁금한 모든 걸 묻고 싶어' 하는 인어공주 OST의 하이라이트 부분 느낌이었음.
		       		</div>
		        </div>
		        
		    </div>
	  	</div>
	</div>
</body>
</html>
<%@ include file="../include/footer.jsp" %>

