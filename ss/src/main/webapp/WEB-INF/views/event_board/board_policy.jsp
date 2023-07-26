<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<!-- 메인 내용 작성 영역 =========================================== -->
<main>
	<article>	
		<div class="content">
		<style type="text/css" title="">
				.title {
			        text-decoration: none;
			    }
			
			    .title:hover {
			        text-decoration: underline;
			    }
				 a {
		        color: black;
		        
		    	}
				.bd-sidebar {
				  position: sticky;
				  top: 4rem;
				  height: calc(100vh - 4rem);
				  background: #eee;
				  border-right: 1px solid rgba(0,0,0,.1);
				  max-width: 220px;
				  display: flex;
				  padding: 0;
				  overflow-y: hidden;
				  flex-direction: column;
				}
				.bd-sidebar-body {
				  height: 100%;
				  overflow-y: auto;
				  display: block;
				}
				.bd-sidebar-body .nav {
				  display: block;
				}
				.bd-sidebar-body .nav>li>a {
				  display: block;
				  padding: .25rem 1.5rem;
				  font-size: 90%;
				}
				.bd-sidebar-footer {
				  padding: 1rem;
				  background: #ddd;
				}
			#content_info {
				padding:20px;
			}
			#content_info p{
				line-height:150%;
				margin-bottom:0px;
				
			}
			#content_info img{
				text-align:center;
				margin:0 auto;
			}
			#content_info div{
				display:normal;
			}
		
			@media (max-width:576px){
				#content_info {
					font-size:1rem;
				}
			}
		</style>
		<div id="content_info">
			<div class="">
			<div class="container">
			<div class="row">
				<div class="col">
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><b><span lang="en-us" style="font-size:12pt;" xml:lang="en-us">[</span></b><b><span style="font-size:12pt;">개인정보취급방침<span lang="en-us" xml:lang="en-us">]</span></span></b></p><p><b></b></p><b></b>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><b>총칙<span lang="en-us" xml:lang="en-us"></span></b></p><p><b></b></p><b></b>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">전국여행다님길에서 운영하는 여기유<span lang="en-us" xml:lang="en-us">(</span>이하<span lang="en-us" xml:lang="en-us"> ‘</span>회사<span lang="en-us" xml:lang="en-us">’)</span>는 고객님의 개인정보를 중요시하며<span lang="en-us" xml:lang="en-us">, “</span>정보통신망 이용촉진 및 정보보호<span lang="en-us" xml:lang="en-us">”</span>에 관한 법률을 준수하고 있습니다<span lang="en-us" xml:lang="en-us">. </span>회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며<span lang="en-us" xml:lang="en-us">, </span>개인 정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다<span lang="en-us" xml:lang="en-us">. </span>회사는
		개인정보취급방침을 개정하는 경우 웹사이트 공지사항<span lang="en-us" xml:lang="en-us">(</span>또는 개별공지<span lang="en-us" xml:lang="en-us">)</span>를
		통하여 공지할 것입니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">1. </span>수집하는 개인정보의 항목 및 수집방법<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">2. </span>개인정보의 수집 및 이용목적<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">3. </span>개인정보 공유 및 제공<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">4. </span>개인정보의 보유 및 이용기간<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">5. </span>개인정보 파기절차 및 방법<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">6. </span>이용자 및 법정대리인의 권리와 그 행사방법<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">7. </span>개인정보 자동 수집 장치의 설치<span lang="en-us" xml:lang="en-us">/</span>운영 및 거부에 관한 사항<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">8. </span>개인정보의 기술적<span lang="en-us" xml:lang="en-us">/</span>관리적
		보호 대책<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">9. </span>개인정보관리책임자 및 담당자의 연락처<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">10. </span>기타<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">12. </span>고지의 의무<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">01. </span>수집하는 개인정보의 항목 및 수집방법<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span style="color:#000000;">가<span lang="en-us" xml:lang="en-us">. </span>수집하는 개인정보의 항목<span lang="en-us" xml:lang="en-us"></span></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt 10pt;text-indent:-10pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">첫째<span lang="en-us" xml:lang="en-us">, </span>회사는 회원가입<span lang="en-us" xml:lang="en-us">, </span>회원제 서비스 제공에
		따른 본인 식별<span lang="en-us" xml:lang="en-us">, </span>인증<span lang="en-us" xml:lang="en-us">, </span>회원자격 유지<span lang="en-us" xml:lang="en-us">,</span>관리<span lang="en-us" xml:lang="en-us">, </span>제한적본인확인제 시행에 따른 본인확인<span lang="en-us" xml:lang="en-us">, </span>원활한 고객상담<span lang="en-us" xml:lang="en-us">, </span>각종 서비스의 제공을 위해 최초 회원가입 당시
		아래와 같은 최소한의 개인정보를 필수항목으로 수집하고 있습니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">&lt;</span>일반 회원가입<span lang="en-us" xml:lang="en-us">&gt;</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>아이디<span lang="en-us" xml:lang="en-us">, </span>비밀번호<span lang="en-us" xml:lang="en-us">, </span>이름<span lang="en-us" xml:lang="en-us">, </span>닉네임<span lang="en-us" xml:lang="en-us">, E-</span>메일<span lang="en-us" style="color:#FF0000;" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">둘째<span lang="en-us" xml:lang="en-us">, </span>서비스 이용과정이나 사업처리 과정에서 아래와 같은 정보들이
		자동으로 생성되어 수집될 수 있습니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- IP Address, </span>쿠키<span lang="en-us" xml:lang="en-us">, </span>방문
		일시<span lang="en-us" xml:lang="en-us">, </span>서비스 이용 기록<span lang="en-us" xml:lang="en-us">, </span>불량 이용 기록<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">셋째<span lang="en-us" xml:lang="en-us">, </span>서비스 아이디를 이용한 부가 서비스 및 맞춤식 서비스 이용
		또는 이벤트 응모 과정에서 해당 서비스 이용자에 한해서만 추가 정보들이 수집될 수 있습니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>개인정보 추가 수집에 대해 동의를 받는 경우<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">02. </span>개인정보의 수집 및 이용목적<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">가<span lang="en-us" xml:lang="en-us">. </span>서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 <span style="color:#000000;">회원정보 시 등록한 개인정보</span><span lang="en-us" style="color:#FF0000;" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">컨텐츠 제공<span lang="en-us" xml:lang="en-us">, </span>특정 맞춤 서비스 제공<span lang="en-us" xml:lang="en-us">, </span>사업자 정보 확인<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">나<span lang="en-us" xml:lang="en-us">. </span>회원관리<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">회원제 서비스 제공<span lang="en-us" xml:lang="en-us">, </span>개인식별<span lang="en-us" xml:lang="en-us">, </span>불량회원의
		부정 이용방지와 비인가 사용방지<span lang="en-us" xml:lang="en-us">, </span>가입의사 확인<span lang="en-us" xml:lang="en-us">, </span>가입 및
		가입횟수 제한<span lang="en-us" xml:lang="en-us">, </span>분쟁 조정을 위한 기록보존<span lang="en-us" xml:lang="en-us">, </span>불만처리 등
		민원처리<span lang="en-us" xml:lang="en-us">, </span>고지사항 전달<span lang="en-us" xml:lang="en-us">, </span>회원탈퇴 의사의 확인 함<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">다<span lang="en-us" xml:lang="en-us">. </span>신규 서비스 개발 및 마케팅 광고에의 활용<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">신규 서비스 개발 및 맞춤 서비스 제공<span lang="en-us" xml:lang="en-us">, </span>통계학적 특성에 따른 서비스
		제공 및 광고 게재<span lang="en-us" xml:lang="en-us">, </span>서비스의 유효성 확인<span lang="en-us" xml:lang="en-us">, </span>이벤트 및 광고성
		정보 제공 및 참여기회 제공<span lang="en-us" xml:lang="en-us">, </span>접속빈도 파악<span lang="en-us" xml:lang="en-us">, </span>회원의 서비스이용에
		대한 통계<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">03. </span>개인정보의 공유 및 제공<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">회사는 이용자들의 개인정보를<span lang="en-us" xml:lang="en-us"> "2. </span>개인정보의 수집목적 및
		이용목적<span lang="en-us" xml:lang="en-us">"</span>에서 고지한 범위내에서 사용하며<span lang="en-us" xml:lang="en-us">, </span>이용자의
		사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 공개하지 않습니다<span lang="en-us" xml:lang="en-us">. </span>다만<span lang="en-us" xml:lang="en-us">, </span>아래의 경우에는 예외로 합니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">가<span lang="en-us" xml:lang="en-us">. </span>이용자가 사전에 동의 한 경우<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>추가개발 서비스<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>서비스 연계 서비스<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">나<span lang="en-us" xml:lang="en-us">. </span>법령의 규정에 의거하거나<span lang="en-us" xml:lang="en-us">, </span>수사
		목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">04. </span>개인정보의 보유 및 이용기간<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다<span lang="en-us" xml:lang="en-us">. </span>단<span lang="en-us" xml:lang="en-us">, </span>다음의 정보에 대해서는 아래의 이유로 명시한 기간 동안 보존합니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">가<span lang="en-us" xml:lang="en-us">. </span>회사 내부 방침에 의한 정보보유 사유<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>부정이용기록<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">보존 이유<span lang="en-us" xml:lang="en-us"> : </span>부정 이용 방지<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">보존 기간<span lang="en-us" xml:lang="en-us"> : 1</span>년<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">나<span lang="en-us" xml:lang="en-us">. </span>관련법령에 의한 정보보유 사유<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">상법<span lang="en-us" xml:lang="en-us">, </span>전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에
		의하여 보존할 필요가 있는 경우 회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다<span lang="en-us" xml:lang="en-us">. </span>이
		경우 회사는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>전자금융 거래에 관한 기록<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">보존 이유<span lang="en-us" xml:lang="en-us"> : </span>전자금융거래법<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">보존 기간<span lang="en-us" xml:lang="en-us"> : 5</span>년<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>소비자의 불만 또는 분쟁처리에 관한 기록<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">보존 이유<span lang="en-us" xml:lang="en-us"> : </span>전자상거래 등에서의 소비자보호에 관한 법률<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">보존 기간<span lang="en-us" xml:lang="en-us"> : 3</span>년 <span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>웹사이트 방문기록<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">보존 이유<span lang="en-us" xml:lang="en-us"> : </span>통신비밀보호법<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">보존 기간<span lang="en-us" xml:lang="en-us"> : 3</span>개월 <span lang="en-us" style="color:#FF0000;" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">05. </span>개인정보 파기절차 및 방법<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">이용자의 개인정보는 원칙적으로 개인정보의 수집 및 이용목적이 달성되면 지체 없이 파기합니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">회사의 개인정보 파기절차 및 방법은 다음과 같습니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">가<span lang="en-us" xml:lang="en-us">. </span>파기절차<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>이용자가 회원가입 등을 위해 입력한 정보는 목적이 달성된 후 별도의<span lang="en-us" xml:lang="en-us"> DB</span>로 옮겨져<span lang="en-us" xml:lang="en-us">(</span>종이의 경우 별도의 서류함<span lang="en-us" xml:lang="en-us">) </span>내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라<span lang="en-us" xml:lang="en-us">(</span>보유
		및 이용기간 참조<span lang="en-us" xml:lang="en-us">)</span>일정 기간 저장된 후 파기됩니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>동 개인정보는 법률에 의한 경우가 아니고서는 보유되는 이외의 다른
		목적으로 이용되지 않습니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">나<span lang="en-us" xml:lang="en-us">. </span>파기방법<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적
		방법을 사용하여 삭제합니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">06. </span>이용자 및 법정대리인의 권리와 그 행사방법<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">정보의이용자는 언제든지 등록되어 있는 자신 개인정보를 조회하거나 수정할 수 있으며<span lang="en-us" xml:lang="en-us">, </span>회사의 개인정보의 처리에 동의하지 않는 경우 동의를 거부하거나 가입해지<span lang="en-us" xml:lang="en-us">(</span>회원탈퇴<span lang="en-us" xml:lang="en-us">)</span>를 요청하실 수 있습니다<span lang="en-us" xml:lang="en-us">. </span>다만<span lang="en-us" xml:lang="en-us">, </span>그러한
		경우 서비스의 일부 또는 전부 이용이 어려울 수 있습니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>이용자의 개인정보 조회<span lang="en-us" xml:lang="en-us">, </span>수정을
		위해서는<span lang="en-us" xml:lang="en-us"> "</span>개인정보변경<span lang="en-us" xml:lang="en-us">"(</span>또는<span lang="en-us" xml:lang="en-us"> "</span>회원정보수정<span lang="en-us" xml:lang="en-us">" </span>등<span lang="en-us" xml:lang="en-us">)</span>을<span lang="en-us" xml:lang="en-us">, </span>가입해지<span lang="en-us" xml:lang="en-us">(</span>동의철회<span lang="en-us" xml:lang="en-us">)</span>를 위해서는<span lang="en-us" xml:lang="en-us"> "</span>회원탈퇴<span lang="en-us" xml:lang="en-us">"</span>를
		클릭하여 본인 확인 절차를 거치신 후 직접 열람<span lang="en-us" xml:lang="en-us">, </span>정정 또는 탈퇴가 가능합니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>혹은 개인정보관리책임자에게 서면<span lang="en-us" xml:lang="en-us">,
		</span>전화 또는 이메일로 연락하시면 지체 없이 조치하겠습니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>이용자가 개인정보의 오류에 대한 정정을 요청하신 경우에는 정정을
		완료하기 전까지 당해 개인정보를 이용 또는 제공하지 않습니다<span lang="en-us" xml:lang="en-us">. </span>또한 잘못된 개인정보를 제<span lang="en-us" xml:lang="en-us">3 </span>자에게 이미 제공한 경우에는 정정 처리결과를 제<span lang="en-us" xml:lang="en-us">3</span>자에게 지체 없이
		통지하여 정정이 이루어지도록 하겠습니다<span lang="en-us" xml:lang="en-us">.&nbsp;</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>회사는 이용자의 요청에 의해 해지 또는 삭제된 개인정보는<span lang="en-us" xml:lang="en-us"> "5. </span>개인정보의 보유 및 이용기간<span lang="en-us" xml:lang="en-us">"</span>에 명시된 바에
		따라 처리하고 그 외의 용도로 열람 또는 이용할 수 없도록 처리하고 있습니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">07. </span>개인정보 자동 수집 장치의 설치<span lang="en-us" xml:lang="en-us">/</span>운영 및 거부에 관한 사항<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">가<span lang="en-us" xml:lang="en-us">. </span>쿠키란<span lang="en-us" xml:lang="en-us">?</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>회사는 개인화되고 맞춤화된 서비스를 제공하기 위해서 이용자의 정보를
		저장하고 수시로 불러오는<span lang="en-us" xml:lang="en-us"> "</span>쿠키<span lang="en-us" xml:lang="en-us">(cookie)"</span>를
		사용합니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>쿠키는 웹사이트를 운영하는데 이용되는 서버가 이용자의 브라우저에게
		보내는 아주 작은 텍스트 파일로 이용자 컴퓨터의 하드디스크에 저장됩니다<span lang="en-us" xml:lang="en-us">. </span>이후 이용자가 웹 사이트에
		방문할 경우 웹 사이트 서버는 이용자의 하드 디스크에 저장되어 있는 쿠키의 내용을 읽어 이용자의 환경설정을 유지하고 맞춤화된 서비스를 제공하기
		위해 이용됩니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>쿠키는 개인을 식별하는 정보를 자동적<span lang="en-us" xml:lang="en-us">/</span>능동적으로 수집하지 않으며<span lang="en-us" xml:lang="en-us">, </span>이용자는 언제든지 이러한 쿠키의 저장을
		거부하거나 삭제할 수 있습니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">나<span lang="en-us" xml:lang="en-us">. </span>회사의 쿠키 사용 목적<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">이용자들이 방문한 서비스의 각 서비스와 웹 사이트들에 대한 방문 및 이용형태<span lang="en-us" xml:lang="en-us">,
		</span>보안접속 여부<span lang="en-us" xml:lang="en-us">, </span>이용자 규모 등을 파악하여 이용자에게 광고를 포함한 최적화된 맞춤형 정보를
		제공하기 위해 사용합니다<span lang="en-us" xml:lang="en-us">.&nbsp;</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">다<span lang="en-us" xml:lang="en-us">. </span>쿠키의 설치<span lang="en-us" xml:lang="en-us">/</span>운영
		및 거부<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>이용자는 쿠키 설치에 대한 선택권을 가지고 있습니다<span lang="en-us" xml:lang="en-us">. </span>따라서 이용자는 웹브라우저에서 옵션을 설정함으로써 모든 쿠키를 허용하거나<span lang="en-us" xml:lang="en-us">, </span>쿠키가
		저장될 때마다 확인을 거치거나<span lang="en-us" xml:lang="en-us">, </span>아니면 모든 쿠키의 저장을 거부할 수도 있습니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>다만<span lang="en-us" xml:lang="en-us">, </span>쿠키의 저장을
		거부할 경우에는 로그인이 필요한 서비스 일부 서비스는 이용에 어려움이 있을 수 있습니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>쿠키 설치 허용 여부를 지정하는 방법<span lang="en-us" xml:lang="en-us">(Internet Explorer</span>의 경우<span lang="en-us" xml:lang="en-us">)</span>은 다음과 같습니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">①<span lang="en-us" xml:lang="en-us"> [</span>도구<span lang="en-us" xml:lang="en-us">] </span>메뉴에서<span lang="en-us" xml:lang="en-us"> [</span>인터넷 옵션<span lang="en-us" xml:lang="en-us">]</span>을 선택합니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">②<span lang="en-us" xml:lang="en-us"> [</span>개인정보 탭<span lang="en-us" xml:lang="en-us">]</span>을 클릭합니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">③<span lang="en-us" xml:lang="en-us"> [</span>개인정보취급 수준<span lang="en-us" xml:lang="en-us">]</span>을
		설정하시면 됩니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">08. </span>개인정보의 기술적<span lang="en-us" xml:lang="en-us">/</span>관리적
		보호 대책<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">회사는 이용자들의 개인정보를 취급함에 있어 개인정보가 분실<span lang="en-us" xml:lang="en-us">, </span>도난<span lang="en-us" xml:lang="en-us">, </span>누출<span lang="en-us" xml:lang="en-us">, </span>변조 또는 훼손되지 않도록 안전성 확보를 위하여 다음과 같은
		기술적<span lang="en-us" xml:lang="en-us">/</span>관리적 대책을 강구하고 있습니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">가<span lang="en-us" xml:lang="en-us">. </span>비밀번호 암호화<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">서비스 회원 아이디<span lang="en-us" xml:lang="en-us">(ID)</span>의 비밀번호는 암호화되어 저장 및 관리되고
		있어 본인만이 알고 있으며<span lang="en-us" xml:lang="en-us">, </span>개인정보의 확인 및 변경도 비밀번호를 알고 있는 본인에 의해서만 가능합니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">나<span lang="en-us" xml:lang="en-us">. </span>해킹 등에 대비한 대책<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">회사는 해킹이나 컴퓨터 바이러스 등에 의해 회원의 개인정보가 유출되거나 훼손되는 것을 막기 위해 최선을 다하고
		있습니다<span lang="en-us" xml:lang="en-us">.&nbsp;</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">개인정보의 훼손에 대비해서 자료를 수시로 백업하고 있고<span lang="en-us" xml:lang="en-us">, </span>최신 백신프로그램을
		이용하여 이용자들의 개인정보나 자료가 누출되거나 손상되지 않도록 방지하고 있으며<span lang="en-us" xml:lang="en-us">, </span>암호화통신 등을 통하여
		네트워크상에서 개인정보를 안전하게 전송할 수 있도록 하고 있습니다<span lang="en-us" xml:lang="en-us">.&nbsp;</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">그리고 침입차단시스템을 이용하여 외부로부터의 무단 접근을 통제하고 있으며<span lang="en-us" xml:lang="en-us">, </span>기타
		시스템적으로 보안성을 확보하기 위한 가능한 모든 기술적 장치를 갖추려 노력하고 있습니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">다<span lang="en-us" xml:lang="en-us">. </span>취급 직원의 최소화 및 교육<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">회사의 개인정보관련 취급 직원은 담당자에 한정시키고 있고 이를 위한 별도의 비밀번호를 부여하여 정기적으로 갱신하고
		있으며<span lang="en-us" xml:lang="en-us">, </span>담당자에 대한 수시 교육을 통하여 서비스 개인정보취급방침의 준수를 항상 강조하고 있습니다<span lang="en-us" xml:lang="en-us">.&nbsp;</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">라<span lang="en-us" xml:lang="en-us">. </span>개인정보보호전담기구의 운영<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">개인정보보호전담기구 운영을 통하여 서비스 개인정보취급방침의 이행사항 및 담당자의 준수여부를 확인하여 문제가 발견될
		경우 즉시 수정하고 바로 잡을 수 있도록 노력하고 있습니다<span lang="en-us" xml:lang="en-us">.&nbsp;</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">단<span lang="en-us" xml:lang="en-us">, </span>이용자 본인의 부주의나 인터넷상의 문제로<span lang="en-us" xml:lang="en-us"> ID, </span>비밀번호 등 개인정보가 유출되어 발생한 문제에 대해 회사는 일체의 책임을 지지 않습니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">9. </span>개인정보관리책임자 및 담당자의 연락처<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">귀하께서는 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자 혹은 담당부서로
		신고하실 수 있습니다<span lang="en-us" xml:lang="en-us">. </span>회사는 이용자들의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">성 명<span lang="en-us" xml:lang="en-us"> : </span>양승욱<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">소 속<span lang="en-us" xml:lang="en-us"> : </span>전국여행다님길</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">전화번호<span lang="en-us" xml:lang="en-us"> : 041-358-7024</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">e-mail :&nbsp;<img src="https://xn--ok0b236bp0a.com/data/editor/1907/09b2155c2b74b8ac9468c883c34afc51_1562564977_6005.png" data-src="https://xn--ok0b236bp0a.com/data/editor/1907/09b2155c2b74b8ac9468c883c34afc51_1562564977_6005.png" title="09b2155c2b74b8ac9468c883c34afc51_1562564977_6005.png" alt="09b2155c2b74b8ac9468c883c34afc51_1562564977_6005.png" class="lazyload img-fluid"><br style="clear:both;"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>개인정보침해신고센터<span lang="en-us" xml:lang="en-us">
		(<a href="http://www.118.or.kr" rel="nofollow">www.118.or.kr</a> / </span>국번없이<span lang="en-us" xml:lang="en-us"> 118)</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>대검찰청 사이버범죄수사단<span lang="en-us" xml:lang="en-us">
		(<a href="http://www.spo.go.kr" rel="nofollow">www.spo.go.kr</a> / 02-3480-2000)&nbsp;</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>경찰청 사이버테러대응센터<span lang="en-us" xml:lang="en-us">
		(<a href="http://www.ctrc.go.kr" rel="nofollow">www.ctrc.go.kr</a> / 1566-0112)</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">10. </span>기타<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">서비스에 링크되어 있는 웹사이트들이 개인정보를 수집하는 행위에 대해서는 본<span lang="en-us" xml:lang="en-us">
		"</span>서비스 개인정보취급방침<span lang="en-us" xml:lang="en-us">"</span>이 적용되지 않음을 알려 드립니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';">또한 서비스 모바일 서비스에서의 개인정보 보호에 대한 상세한 내용은 본 정책과 동일 합니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">11. </span>고지의 의무<span lang="en-us" xml:lang="en-us"></span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us"></span></p><p>&nbsp;</p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>현 개인정보취급방침 내용 추가<span lang="en-us" xml:lang="en-us">,
		</span>삭제 및 수정이 있을 시에는 개정 최소<span lang="en-us" xml:lang="en-us"> 7</span>일전부터 홈페이지의<span lang="en-us" xml:lang="en-us"> "</span>공지사항<span lang="en-us" xml:lang="en-us">"</span>을 통해 고지할 것입니다<span lang="en-us" xml:lang="en-us">. </span>다만<span lang="en-us" xml:lang="en-us">, </span>개인정보의 수집 및 활용<span lang="en-us" xml:lang="en-us">,
		</span>제<span lang="en-us" xml:lang="en-us">3</span>자 제공 등과 같이 이용자 권리의 중요한 변경이 있을 경우에는 최소<span lang="en-us" xml:lang="en-us"> 30</span>일 전에 고지합니다<span lang="en-us" xml:lang="en-us">.</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>공고일자<span lang="en-us" xml:lang="en-us"> : 2019-07-01</span></p><p></p>
		
		<p style="margin:0cm 0cm .0001pt;text-align:justify;font-size:10pt;font-family:'맑은 고딕';"><span lang="en-us" xml:lang="en-us">- </span>시행일자<span lang="en-us" xml:lang="en-us"> : 2019-07-01</span></p><p></p><br></div>
			</div>
		</div>	</div>
			
		
		</div>
		
		
		<style type="text/css" title="">
			.footer {
				padding:0px 10px !important
			}
			.footer a {
				height: 35px;
				display:inline-block;
			}
			.footer span:not(:last-child){
				padding-right:10px;
				content : ' | ';
			   }
			#cinfo{
				transition: all 850ms ease
			}
			.footer_cont_2 , .footer_cont_2 span a {
				color:#AAB2BD;
				text-decoration:none;
				width:normal;
		
		   }
		   .footer_cont_2 span a{
				display:inline-block;
		   }
		
		</style>
	
		</div>
	<!-- 컨테이너 기본 템플릿 =============================================== -->			
	</article>	
</main>
	
		<div class="col-3 bd-sidebar" style="height: 80%; overflow-y: auto;">
			<div class="bd-sidebar-body">
				<ul class="nav">
					<li><a>Side 1</a></li>
					<li><a>Side 2</a></li>
					<li><a>Side 3</a></li>
					<li><a>Side 4</a></li>
					<li><a>Side 5</a></li>
					<li><a>Side 6</a></li>
					<li><a>Side 7</a></li>
					<li><a>Side 8</a></li>
				</ul>
				<br>
			</div>
			<div class='bd-sidebar-footer'>
				Sidebar Footer
			</div>
		</div>
		
	</div>	
</div>	

<!-- 메인 내용 작성 영역 =========================================== -->
	<p class="text-center">
			<small class="text-muted" data-datetime="2023-05-23T05:39:45.029Z" data-format="" data-localdate=""></small>
	</p>
	
<%@ include file="../include/footer.jsp" %>