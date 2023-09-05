<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
html,
  body {
    height: auto;
  }
	
  .content {
    flex: 1;
    margin-bottom: 50px; /* 푸터의 높이만큼 여백 추가 */
  }

  .footer {
    background-color: #f8f9fa;
    padding: 20px 0;
    text-align: center;
    color: #6c757d;
    position: fixed;
    left: 0;
    bottom: 0;
    width: 100%;
    margin-top: auto;
    height: 300px;
    z-index: -1; /* 푸터가 다른 요소 위에 표시되도록 z-index 설정 */
  }
   .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        /* position: relative; */
        z-index: 1;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
</style>
	<!-- 하단 우측  스크롤 위로 올리기  -->
<div id="bottomClick" class="position-fixed bottom-0 end-0 md-3 my-4 mx-3 bd-mode-toggle">
	<button class="btn btn-bd-primary py-2 d-flex align-items-center" type="button" onclick="topClick();" style="z-index:999;">
		<svg xmlns="http://www.w3.org/2000/svg" width="36" height="36" fill="currentColor" class="bi bi-triangle-fill" viewBox="0 0 16 16">
			<path fill-rule="evenodd" d="M7.022 1.566a1.13 1.13 0 0 1 1.96 0l6.857 11.667c.457.778-.092 1.767-.98 1.767H1.144c-.889 0-1.437-.99-.98-1.767L7.022 1.566z"/>
		</svg>
	</button>
</div>
<div class="root-container mt-auto py-3 navbar-wrapper sticky-bottom root-container shadow-sm" style="position:relative; background-color:#f8f9fa; font-family: 'TheJamsil5Bold';">
	<div class="container">
		<footer class="row row-cols-1 row-cols-sm-2 row-cols-md-5 py-2">
			<div class="col mb-3 px-0" style="width:30%;">
				<a class="navbar-brand" href="<%=request.getContextPath() %>/" title="Arcalive" style="padding: 0px; ">
					<img src="${pageContext.request.contextPath}/resources/img/logo_test4.png" width="250px" height="80px">
				</a>
				<div style="margin:20px 0px;"></div>
				<div class="text-body-secondary text-muted">주소 : 전북 전주시 덕진구 금암동 123-4</div>
				<div class="text-body-secondary text-muted">대표 : 김진규(ezen@gmail.com)</div>
				<div class="text-body-secondary text-muted">사업자번호 : 313-03-798521</div>
				<div class="text-body-secondary text-muted">개인정보담당자 : 홍세정(ezen@naver.com)</div>
			</div>
			<div class="col mx-3 py-5" style="width:20%;">
			</div>
			<div class="col mx-3" style="width:45%; padding-top:30px;">
				<h3>프로젝트 명</h3>
				<h5 class="text-muted ps-5 mt-3">AWESOME TRIP</h5><br>
				<h3>조원</h3>
				<h5 class="text-muted ps-5 mt-3">김남도 설무리 홍세정 김진규</h5>
			</div>
		</footer>
	</div>
</div>	
<!-- 스크롤 이벤트 보여주기 안 보여주기  -->
<script type="text/javascript">
	
</script>
<script type="text/javascript">
	function topClick()
	{
		window.scrollTo(0,0);
	}
</script>
	</body>
</html>
<%
	// DBMS로부터 연결을 종료한다
//	stmt.close();
//	conn.close();
%>