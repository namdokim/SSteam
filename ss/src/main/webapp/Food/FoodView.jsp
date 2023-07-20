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
    }
    .restaurant-item {
      border: none; /* 회색 선 제거 */
      margin-bottom: 20px;
      padding: 20px;
      display: flex;
      border-bottom: 1px solid #ddd; /* 바닥선만 추가 */
      flex: 1 1 50%; /* 추가 */
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
    .user-info {
      display: flex;
      align-items: center;
      margin-bottom: 10px;
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

    /* 왼쪽 사이드바 */
    .sidebar {
      flex: 0 0 300px;
      background-color: #f5f5f5;
      padding: 20px;
    }

    /* 지역별 검색조건 */
    .region-filter {
      margin-bottom: 20px;
    }

    /* 오른쪽 지도 */
    .map {
      flex: 1 1 auto;
      height: 400px; /* 지도의 높이 설정 */
    }
  </style>
<!-- ======================= 스타일E =========================-->
</head>

<!-- ======================= 바디S ========================= -->
<body>
  <div class="header">
    <div>
      <img src="https://mp-seoul-image-production-s3.mangoplate.com/281547/753280_1550146766591_11966?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" alt="음식 사진 1" width="300" height="340">
      <img src="https://mp-seoul-image-production-s3.mangoplate.com/549779_1688722095256513.jpg?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" alt="음식 사진 2" width="300" height="340">
      <img src="https://mp-seoul-image-production-s3.mangoplate.com/549779_1688722097838776.jpg?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" alt="음식 사진 3" width="300" height="340">
      <img src="https://mp-seoul-image-production-s3.mangoplate.com/549779_1688722099215636.jpg?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" alt="음식 사진 4" width="300" height="340">
      <img src="https://mp-seoul-image-production-s3.mangoplate.com/549779_1688722100253838.jpg?fit=around|512:512&crop=512:512;*,*&output-format=jpg&output-quality=80" alt="음식 사진 5" width="300" height="340">
    </div>
  </div>
  <!-- ===================================== 상단의 이미지 사진 5개 ================================== -->
  </div>

  <div class="container">
    <div class="sidebar">
      <h3>지역별 검색</h3>
      <div class="region-filter">
        <input type="radio" id="all" name="region" value="all" checked>
        <label for="all">전체</label>
        <input type="radio" id="seoul" name="region" value="seoul">
        <label for="seoul">서울</label>
        <input type="radio" id="busan" name="region" value="busan">
        <label for="busan">부산</label>
        <!-- 다른 지역에 대한 라디오 버튼을 추가할 수 있습니다 -->
      </div>
      <!-- 다른 검색 조건을 추가할 수 있습니다 -->
    </div>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <div class="restaurant-item">
      <div>
        <h2 style="color: black;">미라이 <span style="color: orange;">4.8</span></h2>
        <button>리뷰쓰기</button>
        <button>가고싶다</button>
        <p>536,345 132 10,632</p>
        <p><strong>주소</strong> 서울특별시 강남구 논현로153길 24 끌레르빌 1F</p>
        <p><strong>지번</strong> 서울시 강남구 신사동 557-25 끌레르빌 1F</p>
        <p><strong>전화번호</strong> 02-540-0934</p>
        <p><strong>음식 종류</strong> 이자카야 / 오뎅 / 꼬치</p>
        <p><strong>가격대</strong> 3만원-4만원</p>
        <p><strong>주차</strong> 주차공간없음</p>
        <p><strong>영업시간</strong> 18:00 - 01:00</p>
        <p><strong>휴일</strong> 일</p>
        <p><strong>웹 사이트</strong> <a href="식당 홈페이지 링크">식당 홈페이지로 가기</a></p>
        <h3>메뉴</h3>
        <ul>
          <li>사시미8종 (2인) - 41,000원</li>
          <li>마구로치즈아에 - 19,000원</li>
          <li>양갈비 스미비 야끼 - 23,000원</li>
          <li>노도구로 시오 야끼 - 35,000원</li>
          <li>규 스테이크 - 41,000원</li>
        </ul>
        <div class="menu-photos">
          <img src="https://mp-seoul-image-production-s3.mangoplate.com/112634_1551905615639113.jpg?fit=around|63:63&crop=63:63;*,*&output-format=jpg&output-quality=80" alt="메뉴 사진 1">
          <img src="https://mp-seoul-image-production-s3.mangoplate.com/112634_1551905615921726.jpg?fit=around|63:63&crop=63:63;*,*&output-format=jpg&output-quality=80" alt="메뉴 사진 2">
          <img src="https://mp-seoul-image-production-s3.mangoplate.com/112634_1551905616194724.jpg?fit=around|63:63&crop=63:63;*,*&output-format=jpg&output-quality=80" alt="메뉴 사진 3">
          <img src="https://mp-seoul-image-production-s3.mangoplate.com/112634_1551905616451296.jpg?fit=around|63:63&crop=63:63;*,*&output-format=jpg&output-quality=80" alt="메뉴 사진 4">
        </div>
      </div>
    </div>
    <!-- 나머지 맛집 아이템들도 동일한 방식으로 추가 -->
  </div>

  <div class="map">
    <!-- 지도 API를 표시하는 부분을 추가해주세요 -->
  </div>

</body>
</html>

