<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<style>
  html,
  body {
    height: 100%;
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
    z-index: 999; /* 푸터가 다른 요소 위에 표시되도록 z-index 설정 */
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
        z-index: 2;
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
		<footer class="footer mt-auto py-3 bg-light sticky-bottom navbar-wrapper root-container" style="position: relative; z-index: 999;">
			<div class="container">
				<p class="text-center text-muted">Live v0.011&nbsp;<small class="text-muted">(000000)</small>
					<span class="sep"></span>
					<a href="mailto:leghorn0897@gmail.com">contact</a>
					<span class="sep"></span>
					<a href="https://arca.live/policy?gt=1#googtrans(ko)">PRIVACY POLICY AND RULES OF USE</a>					
				</p>
				<p class="text-center text-muted">dev for team SADARI 
					<span class="sep"></span>
					make with &lt;3  jeonju, republic of korea
				</p>
				<p class="footer-current-users text-center text-muted">
					<span class="ion-ios-people"></span>&nbsp;
					<span id="arcalive-current-users">000000</span>명
				</p>
			</div>
		</footer>
	</body>
</html>
<%
	// DBMS로부터 연결을 종료한다
//	stmt.close();
//	conn.close();
%>