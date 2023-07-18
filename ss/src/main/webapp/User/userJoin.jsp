<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
<script>
function DoRewrite()
{
	alert("잘되누?");
	$("#uId").val("").focus();
}
function check()
{
	if(join.uId.value.length == 0 || $("#uId").val() == "")
	{
		alert("아이디가 없어요");
		join.id.focus();
		return false;
	}else if(join.uIdCheck.value != "Y")
	{
		alert(" 중복 체크 해라 유효성 검사를 해주세요")
		join.id.focus();
		return true;
	}
}
</script>

<style>
	tr
	{
	text-align: center;
	padding: auto;
	
	width: 40%;
	}
</style>
회원가입 페이지
	<form name="join" method="post" action="<%= request.getContextPath()%>/User/userJoinAction.do">
		<table border="1" style="width:90%; padding : auto; margin: auto">
			<tr>
				<td id="jbar">
					<p id="join bar"> 아이디 <span style="color: red">(*)</span> </p>
				</td>
				<td >
					<input type="text" id="uId" name="uId" style="width:97%; " required value="">
				</td>
				<td >
					<input type="button" value="중복확인" id="userIdCheck" onclick="idCheck();">
					<input type="button" value="인증하기" id="emailCheck" >
					<input type="hidden" name="idchecked" id=""value="checkednot">
				</td>
			</tr>
			<tr>
				<td width="100px"><span style="visibility:hidden;">MSG</span></td>
				<td>
					<span id="msg_id"></span>
				</td>
			</tr>
			<tr>
				<td id="jbar">
					<p id="join bar"> 비밀번호 <span style="color: red">(*)</span> </p>
				</td>
				<td >
					<input type="text" id="uPw" name="uPw" style="width:97%;" required value="">
				</td>
			</tr>
			<tr>
				<td id="jbar">
					<p id="join bar"> 비밀번호확인 <span style="color: red">(*)</span> </p>
				</td>
				<td >
					<input type="text" id="uPwc" name="uPwc" style="width:97%;" required value="">
				</td >
			</tr>
			<tr>
				<td width="100px"><span style="visibility:hidden;">MSG</span></td>
				<td>
					<span id="msg_pw"></span>
				</td>
			</tr>
			<!-- 비밀번호 확인 안내문자  -->
			<tr>
				<td>
				</td>
				<td>
					<div id="pwmsg"></div>
				</td>
			</tr>
			<!--
			<tr>
				<td id="jbar">
					<p id="join bar"> 주민등록번호 <span style="color: red">(*)</span> </p>
				</td>
				<td >
					<input type="text" id="uidNo" name="uidNo" style="width:40%; ">-
					<input type="text" id="uidNo" name="uidNo" style="width:40%; ">
				</td>
			</tr>
			 -->
			
			<tr>
				<td id="jbar">
					<p id="join bar"> 이름 <span style="color: red">(*)</span> </p>
				</td>
				<td>
					<input type="text" id="uName" name="uName" style="width:97%;" required value="">
				</td>
			</tr>
			<tr>
				<td id="jbar">
					<p id="join bar"> 닉네임 <span style="color: red">(*)</span> </p>
					<div><input type="hidden" ></div>
				</td>
				<td>
					<input type="text" id="uNick" name="uNick" style="width:97%;" required value="">
				</td>
				<td>
<!-- 					<input type="button" value="중복확인" id="nickcheck" onclick="uNickCheck()"> -->
				</td>
			</tr>
			<!-- 닉네임 중복 체크 안내 문자  -->
			<tr>
				<td>
				</td>
				<td>
					<div id="nickCheck" style="font-family: sans-serif; font-size:24px"></div>
				</td>
			</tr>
			<tr>
				<td width="100px"><span style="visibility:hidden;">MSG</span></td>
				<td>
					<span id="msg_nick"></span>
				</td>
			</tr>
			<tr>
				<td id="jbar">
					<p id="join bar"> 전화번호 </p>
					<span style="text-align: center"> -없이 작성해주세요 </span>
				</td>
				<td>
					<input type="text" id="uPhone" name="uPhone" style="width:97%;" required value="">
				</td>
			</tr>
			<tr>
				<td id="jbar">
					<p></p>
					<p id="join bar"> 주소 </p>
				</td>
				<td>
					<div>
						<input type="text" id="" name="">
						<input type="button" value="우편번호찾기">
					</div>	
					<div>
						<input type="text" id="uAdds" name="uAdds" style="width:97%;">
						<input type="text" id="uAdds_sub" name="uAdds_sub" style="width:97%;">
					</div>
				</td>
			</tr>
			<tr>
				<td id="jbar" colspan="3" style="text-align:center;">
					<!-- 
					<a href="javascript:document.join.submit()"  onclick="check();" class="btn sfn">가입하기test</a>
					<a href="javascript:DoSubmitPlus();" class="btn sfn">가입하기test2</a>
					 -->
					<a href="javascript:DoSubmit();" onclick="javascript:document.join.submit()" id="check" class="btn sfn">가입하기</a>
					<input type="submit" value="가입하기">
					<a href="javascript:DoRewrite()">다시쓰기</a>
					<a href="javascript:DoRewrite()">취소</a> 
					
					<!-- 
					<input type="submit" value="가입하기" class="btn2"> 
					<input type="reset" value="다시쓰기" class="btn2" onclick="DoRewrite();">
					<input type="button" value="취소" class="btn2" onclick="location.href='index.jsp'">
					 -->
					
					<!-- 별도의 메소드가  없어서 우선은 안됨 -->
					<!-- <a href="javascript:Dosubmit();" class="btn sfn">등록</a>
					<a href="index.jsp" class="btn sfnr">돌아가기</a> -->
					
				</td>
			</tr>
		</table>
		
	</form>
	<!-- 닉네임 중복 체크 -->
	<script type="text/javascript">

		$("#uNick").keyup(function(){
			var uNick = $("#uNick").val();
				
			$.ajax({
				url : "<%= request.getContextPath()%>/User/uNickCheck.do",
				type : "POST",
				data : {"uNick": uNick},
				dataType : "JSON",
				success :function(data){
					console.log(data.uNick);
					if(data.uNick == 1){
						console.log("실행 되남???");
						$("#nickCheck").text("이미 사용중입니다");
						$("#nickCheck").css("color","#dc3545");
						var check = data.uNick;
					}else{
						$("#nickCheck").text("사용 가능합니다");
						$("#nickCheck").css("color","#2E2EFE");
					}
				},
				error : function(){
					alert("요청실패");
				}
			});
			//return;
		});
	
	</script>
	<!-- 비밀번호 확인 절차  -->
	<script type="text/javascript">
		${"#uPwc"}.keyup(function(){
			var uPw		= $("#uPw").val();
			var uPwc	= $("#uPwc").val();
			
			
			if()
				{
				
				}
			$.ajax({
				
			});
		});
	</script>
	
<%@ include file="/include/footer.jsp" %>