
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<style>
	.form-label
	{
		border-top-left-radius: 0.5em;
		border-top-right-radius: 0.5em;
		margin-bottom: 0;
		color: #2E2E2E;
		background-color:#F2F2F2;
		width:100%;
		font-size: 20px ;
		font-weight: bolder;
		
	}
	.form-control{
		cursor: default;
	}
	#Profilecon{
		
	}

</style>
<div class="container">
	<div class="py-5 text-center">
		<!-- <div class="row g-5"> -->
			<!-- <div class="col-md-7 col-lg-8"> -->
			<svg xmlns="http://www.w3.org/2000/svg" width="120" height="120" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
				<path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
				<path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
			</svg>
				<h3 class="fw-normal">Profile</h3>
				<!-- 프로필 사진 ~ -->
				<!-- action="<%-- <%= request.getContextPath()%> --%>/User/profileimg.do" -->
				<form method="post" action="<%= request.getContextPath()%>/User/profileimg.do" id="imgform" enctype="multipart/form-data">
					<div class="row d-flex justify-content-center">
						<div class="col-2 col-md-3 profile-btn-area">
							<label for="input-image">이미지 </label>
							<div class="mb-3">
								<img id="img1" src='<c:url value="${login.uImg} "></c:url>' width="200px" height="200px">
								<img id="img1" src="${ standname}" width="200px" height="200px">
							</div>
						</div>
						<div class="col-2 col-md-3 profile-show">
							<input type="hidden" name="delete" id="delete" value="0">
							<label for="input-image">이미지 미리보기</label>
							<div id="preview" class="mb-3">
								<img id="img1" src='<c:url value="${login.uImg} "></c:url>' width="200px" height="200px">
							</div>
						</div>
					</div>
					<div style="margin-bottom: 0.5em; margin-top: 0;">
						<input type="file" name="myprofileimg" id="myprofileimg">
						<input type="hidden" id="uId">
						<button type="submit" >변경하기</button>
						<!-- <button id="btn_submit" onclick="javascript:fn_submit()">변경하기</button> -->
					</div>
				</form>
				<!-- 회원수정 폼  -->
				<form name="join" id="join" method="post" action="<%= request.getContextPath()%>/User/userJoinAction.do">
					<input type="hidden" id="uType" name="uType" value="<%= login.getuType()%>">
				<div class="d-grid gap-2">
					<div id="Profilecon" class="col-12">
						<label for="Name" class="form-label">이름</label>
						<input  class="form-control" type="text" id="uName" name="uName" placeholder="<%= login.getuName() %>" readonly="readonly" required value="">
					</div>
					<div id="Profilecon" class="col-12">
						<label for="Nick" class="form-label">닉네임</label>
						<input  class="form-control" type="text" id="uNick" name="uNick" placeholder="<%= login.getuNick() %>" readonly="readonly" required value="">
					</div>
						<span id="msg_nick"></span>
					<div id="Profilecon" class="col-12">
						<label for="Phone" class="form-label">전화번호</label>
						<input  class="form-control" type="text" id="uPhone" name="uPhone" placeholder="<%= login.getuPhone() %>" readonly="readonly" required value="">
					</div>
					<!-- 우편번호 주소 -->
						<label for="address" class="form-label">우편번호</label>
					<div class="col-12 d-flex justify-content-between align-items-center">
						<div class="col-md-6">
						<input  class="form-control" type="text" id="uAddsPostCode"  placeholder="우편번호" readonly="readonly" >
						</div>
						<!-- <input class="float-end btn btn-secondary mb-1" onclick="DaumPostcode();" type="button" value="우편번호찾기"> -->
					</div>
						<div class="col-12">
							<input class="form-control" type="text" id="uRoadAddress" readonly="readonly" placeholder="도로명주소">
						</div>
						<div class="col-12">
							<input  class="form-control" type="text" id="uJibunAddress" readonly="readonly" placeholder="지번주소">            
						</div>
						<div class="col-12">
							<input class="form-control" type="text" id="uDetailAddress" readonly="readonly" placeholder="상세주소">
						</div>	
							<label for="address" class="form-label">참고항목</label>
								<div class="col-md-5">
									<input class="form-control" type="text" readonly="readonly" id="sample4_extraAddress" placeholder="참고항목">
								</div>
					<!-- 회원가입 입력란 끝 -->
						<hr class="my-4">
						<div class="d-flex justify-content-center my-4">
							<a href="<%=request.getContextPath()%>/User/UserModify.do">
								<input class="w-33 btn btn-primary btn-lg mx-2" type="button" value="회원 정보 변경">
							</a>
							<a href="<%=request.getContextPath()%>/User/">
								<input class="w-33 btn btn-primary btn-lg mx-2" type="button" value="비밀번호 변경">
							</a>
							<a href="<%=request.getContextPath() %>/User/mypage.do">
								<input class="w-33 btn btn-primary btn-lg mx-2" type="button" value="돌아가기">
							</a>
							<a href="<%=request.getContextPath() %>/">
								<input class="w-33 btn btn-primary btn-lg mx-2" type="button" value="HOME">
							</a>
						</div>
				</div>
				</form>
	</div>
</div><!-- container -->
<script type="text/javascript">
    //이미지 미리보기
    var sel_file;
 
    $(document).ready(function() {
        $("#file1").on("change", handleImgFileSelect);
    });
 
    function handleImgFileSelect(e) {
        var files = e.target.files;
        console.log("files"+files)
        /* var filesArr = Array.prototype.slice.call(files); */
 
        var reg = /(.*?)\/(jpg|jpeg|png|bmp)$/;
 
        filesArr.forEach(function(f) {
            if (!f.type.match(reg)) {
                alert("확장자는 이미지 확장자만 가능합니다.");
                return;
            }
 
            sel_file = f;
 
            var reader = new FileReader();
            reader.onload = function(e) {
                $("#img1").attr("src", e.target.result);
            }
            reader.readAsDataURL(f);
        });
    }
</script>
<script type="text/javascript">
function fn_submit(){
	var form = new FormData();
	var imgfile =$("input[name='myprofileimg']");
	var files = imgfile[0].files;
	console.log("from="+files);
	/* form.append("file1",$("#myprofileimg")[0].files[0]); */
	for(var i =0; i<files.length; i++){
		form.append("myprofileimg",files[i]);
	}
	console.log("from="+form);
	console.log("$('#myprofileimg')[0].files[0]"+$("#myprofileimg")[0].files[0])
	$.ajax({
        url : "profileimg.do"
      , type : "POST"
      , processData : false
      , contentType : false
      , data : form
      , success:function(response) {
    	  
          alert("성공하였습니다.");
          console.log(response);
      }
      ,error: function () 
      {
    	  alert("오류 발생");
          /* alert(jqXHR.responseText);  */
      }
  });
}
</script>
<script type="text/javascript">

</script>
<%@ include file="../include/footer.jsp" %>