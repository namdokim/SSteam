<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<%
// 로그인 정보를 세션에서 확인한 후
// 1. 로그인 정보가 없으면, 메인으로 돌려보냄
// 2. 로그인 정보가 있으면, 이 페이지를 사용자에게 노출시킴
/* if( loginVo == null )
{
//	response.sendRedirect("index.jsp");		// 메인으로 돌려보냄
	response.sendRedirect("login.jsp");		// 로그인 화면으로 보냄
	return;
} */
// 파라메타를 통해 사용자가 글을 작성하려는 게시판이 어느것인지 판단하기 위해,
// 'type'이름으로 데이터를 받는다

%>


<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>이벤트 메인</title>

<style>
.inner-star::before{color: #FF9600;}
.outer-star {position: relative;display: inline-block;color: #CCCCCC;}
.inner-star {position: absolute;left: 0;top: 0;width: 0%;overflow: hidden;white-space: nowrap;}
.outer-star::before, .inner-star::before {content: '\f005 \f005 \f005 \f005 \f005';font-family: 'Font Awesome 5 free';font-weight: 900;}
</style>
</head>
<body>
	<div class="container-fluid border-top">
		<div class="row flex-nowrap" >
			<main class="col-6 offset-3 py-md-1 pl-md-5 bd-content board-article border-end border-start" style="height: 100vh;" role="main">
				<article class="container-fluid" >
					<form name="write" method="post" action="eventReviewWriteAction.do" onsubmit="return DoSubmit();">
					 	<input type="hidden" name="uNo" id="uNo" value="<%-- <%= loginVo.getuNo() %> --%>">
						<input type="hidden" name="_csrf" value="eFh1x7ys-xhz993OI0d6HV2qcgTWvXkgFkBI">
						<input type="hidden" name="token" value="e3ce53cf453f3eaa">
						<input type="hidden" name="contentType" value="html">
						<div class="write-head border-top border-bottom py-md-1">
							글쓰기 | 작성자<%--  <%= loginVo.getuName() %> --%> <input type="hidden" name="uNo" id="uNo" value="<%-- <%= loginVo.getuNo() %> --%>">
						</div>
						<div class="sub-row py-md-1">
						<span>${vo.event_title}</span>
						</div>
						<div class="sub-row" id="formAgreePreventDelete" style="display:none;">
							<label>
							
							
							선택하신 카테고리는 글 작성 후 수정/삭제가 불가능합니다. 동의하십니까?
							
							
							<input type="checkbox" name="agreePreventDelete">
							</label>
						</div>
						<div class="row">
							<div class="form-group col-12">
								<div class="input-group input-group-sm">
									<div class="input-group-prepend">
										<span class="input-group-text">리뷰 제목</span>
									</div>
									<input type="text" name="comment_title" class="form-control form-control-sm " id="title" maxlength="256" required="">
								</div>
							</div>
							<div class="pt-1">
							<textarea id="summernote" name="comment_content"></textarea>
							</div>    
						</div>
						
						<div class="hidden-preview-checkbox">
							<div class='RatingStar'>
							    <div class='RatingScore'>
							        <div class='outer-star'><div class='inner-star'></div></div>
							    </div>
							</div>							
							<script>
							  /*<![CDATA[*/
							  ratings = { RatingScore: 5.5 };
							  totalRating = 5;
							  table = document.querySelector('.RatingStar');
							
							  function rateIt() {
							    for (let rating in ratings) {
							      ratingPercentage = ratings[rating] / totalRating * 100;
							      ratingRounded = Math.round(ratingPercentage / 10) * 10 + '%';
							      star = table.querySelector(`.${rating} .inner-star`);
							      numberRating = table.querySelector(`.${rating} .numberRating`);
							      star.style.width = ratingRounded;
							      numberRating.innerText = ratings[rating];
							    }
							  }
							
							  rateIt();
							  /*]]>*/
							</script>
							<input type="checkbox" name="hidden_preview" id="hidden_preview">
							<label for="hidden_preview">미디어 미리보기를 숨기시겠습니까?</label>
							<span class="ion-help-circled" data-toggle="tooltip" data-placement="top" title="" data-original-title="채널 목록에서 이미지 미리보기가 표시되지 않습니다."></span>
						</div>		
		        		<div class="pt-1 d-flex justify-content-end float-right">
		            		<button class="btn btn-light mx-1" type="submit" style="width:10%; padding:5px;" onclick="DoSubmit();">제출</button>	
		        		</div>
					</form>
				</article>	
			</main>
		</div>	
	</div>		
<%@ include file="../include/footer.jsp" %>