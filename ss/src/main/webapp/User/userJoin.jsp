<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
<script>
function DoRewrite()
{
	$("#uId").val("").focus();
}
</script>
<style>
	tr{
		text-align: center;
		padding: auto;
		width: 40%;
	}
	input::placeholder
	{
		text-align: center;
		color: 
	}
</style>
<!-- 회원가입 입력 란  -->
	<form name="join" method="post" action="<%= request.getContextPath()%>/User/userJoinAction.do" onsubmit="return false;">
		<table border="1" style="align-content: center; width:50%; padding : auto; margin: auto">
			<tr>
				<td style="width:60%;">
					<input type="text" id="uId" name="uId" style="width:100%" placeholder="Email를 써주세요" required value="">
					
				</td>
				<td>	
					@<select id="uId_email" name="uId_email" style="width: 90%;" onchange="this.value">	
						<option value="">도메인을 선택해주세요</option>
						<option value="@naver.com">naver.com</option>
						<option value="@daum.net">daum.net</option>
						<option value="@hanmail.net">hanmail.net</option>
						<option value="@gmail.com">gmail.com</option>
						<option value="@kakao.com">kakao.com</option>
						<option value="@nate.com">nate.com</option>
						<option value="@outlook.com">outlook.com</option>
						<option value="@hotmail.com">hotmail.com</option>
					</select>
				</td>
				<td>
					<!-- <input type="button" value="중복확인" id="userIdCheck" onclick="idCheck();"> -->
					<input type="button" value="인증하기" id="emailCheck" >
					<input type="hidden" name="idchecked" id=""value="checkednot">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<span id="msg_id"></span>
				</td>
			</tr>
<!-- 			<tr>
				<td width="100px"><span style="visibility:hidden;">MSG</span></td>
				<td>
					
				</td>
			</tr> -->
			<tr>
				<td colspan="2">
					<input type="text" id="uPw" name="uPw" style="width:100%;" placeholder="비밀번호" required value="">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" id="uPwc" name="uPwc" style="width:100%;" placeholder="비밀번호 확인"required value="">
					<span id="msg_pw"></span>
				</td >
			</tr>
			<!-- 비밀번호 확인 안내문자  -->
			<!-- <tr>
				<td width="100px"><span style="visibility:hidden;">MSG</span></td>
				<td>
					
				</td>
			</tr> -->
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
				<td colspan="2">
					<input type="text" id="uName" name="uName" style="width:100%;" placeholder="이름" required value="">
				</td>
				<td >
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="text" id="uNick" name="uNick" style="width:100%;" placeholder="닉네임" required value="">
					<div><input type="hidden" ></div>
					<span id="msg_nick"></span>
				</td>
				<td>
				<!--<input type="button" value="중복확인" id="nickcheck" onclick="uNickCheck()"> -->
				</td>
			</tr>
			<!-- 닉네임 중복 체크 안내 문자  -->
			<!-- <tr>
				<td width="100px"><span style="visibility:hidden;">MSG</span></td>
				<td>
				</td>
			</tr> -->
			<tr>
				<td colspan="2">
					<input type="text" id="uPhone" name="uPhone" style="width:100%;" placeholder="전화번호(ex= 01012345678)" required value="">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div>
						<input type="text" id="" name="" style="width:100%;" placeholder="우편번호">
					</div>
				</td>
				<td>
						<input type="button" value="우편번호찾기">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<div>
						<input type="text" id="uAdds" name="uAdds" style="width:100%;" placeholder="주소입력 란">
						<input type="text" id="uAdds_sub" name="uAdds_sub" style="width:100%;" placeholder="우편번호를 찾아주세요">
					</div>
				</td>
			</tr>
			<tr >
				<td id="jbar" colspan="3" style="text-align:center;">
					<!-- <a href="javascript:DoSubmit();" onclick="javascript:document.join.DoSubmit()" id="check" class="btn sfn">가입하기</a> -->
					<!-- <input type="submit" value="가입하기" onclick="false DoSubmit();"> -->
					<button value="가입하기2" onclick="DoSubmit();">회원가입</button>
					<a href="javascript:DoRewrite()"><input type="button" value="다시쓰기"></a>
					<a href="<%=request.getContextPath() %>/index.jsp"><input type="button" value="취소"></a> 
				</td>
			</tr>
		</table>
		
	</form>

	<!-- 최종 서브밋  -->
<script type="text/javascript">
	//중복체크및 일치 확인 여부 
		<!-- id 중복체크 -->
		var uIdDup		= false;
		var uPwDup		= false;
	$("#uId").on("propertychange change keyup paste input",function(){
		var uId = $("#uId").val();
		$.ajax({
			url : "<%= request.getContextPath()%>/User/uIdCheck.do",
			type : "POST",
			data : {"uId": uId},
			dataType : "JSON",
			success :function(data){
				if(data.uId == 1 || data.uId >= 2){
					$("#msg_id").text("이미 사용중입니다");
					$("#msg_id").css("color","#dc3545");
					uIdDup = false;
					console.log(uIdDup);
					console.log();
					
				}else{
					$("#msg_id").text("사용 가능합니다");
					$("#msg_id").css("color","#2E2EFE");
					uIdDup = true;
					
					console.log(uIdDup);
					
				}
			},
			error : function(){
				alert("요청실패");
			}
			}); //ajax 끝 
		
	});
	console.log("결과값 변경 : " +uIdDup);
	/*
	$("#uId").keyup(function(){
		console.log("밖에 : " + uIdDup);
		return true;
	});
	*/
	// 닉네임 중복 체크 
		var uNickDup	= false;
		$("#uNick").keyup(function(){
			var uNick = $("#uNick").val();
				
			$.ajax({
				url : "<%= request.getContextPath()%>/User/uNickCheck.do",
				type : "POST",
				data : {"uNick": uNick},
				dataType : "JSON",
				success :function(data){
					console.log(data.uNick);
					if(data.uNick == 1 || data.uNick >= 2){
						console.log("실행 되남???");
						$("#msg_nick").text("이미 사용중입니다");
						$("#msg_nick").css("color","#dc3545");
						uNickDup = false;
						var check = data.uNick;
						
					}else{
						$("#msg_nick").text("사용 가능합니다");
						$("#msg_nick").css("color","#2E2EFE");
						uNickDup = true;
					}
				},
				error : function(){
					alert("요청실패");
				}
			});
			//return;
		});

	<!-- 비밀번호 확인 절차  -->

		$("#uPwc").keyup(function(){
			var uPw		= $("#uPw").val();
			var uPwc	= $("#uPwc").val();
			
			if(uPw == uPwc)
			{
				$("#msg_pw").text("비밀번호가 일치합니다");
				$("#msg_pw").css("color","#2E2EFE");
				uPwDup = true;
			}else
			{
				$("#msg_pw").text("비밀번호가 불일치합니다");
				$("#msg_pw").css("color","#dc3545");
				uPwDup = false;
			}
		});
	
	// 최종 유효성 검사 
	function DoSubmit()
	{
		// submit시 최종 유효성검사 submit막기
		console.log("밖에 : " + uIdDup);
		var uPw		= $("#uPw").val();
		var uPwc	= $("#uPwc").val();
		var uName	= $("#uName").val();
		
		if(join.uId.value.length == 0 || $("#uId").val() == "")
		{
			alert("아이디를 써주세요");
			join.id.focus();
			return false;
			
		}else if( uIdDup == false){
			alert("아이디가 중복됩니다");
			$("#uId").val("").focus();
			return false;
			
		}else if(uPw != uPwc )
		{
			alert("비밀번호가 일치 하지 않습니다");
			$("#uPw").val("").focus();
			uPwDup = true;
			return true;
		}else if(uName == null || $("#uName").val() == "")
		{
			alert("이름을 써주세요");

			$("#uName").val("").focus();
			return false;
			
		}else if (uNick == null || $("#uNick").val() == "")
		{
			alert("닉네임을 써주세요");
			$("#uNick").val("").focus();
			return false;
		}else if( uAdds == null || $("#uAdds").val() == "")
		{
			alert("주소를 써주세요");
			$("#uAdds").val("").focus();
			return false;
		}else if (uNickDup == false)
		{
			alert("닉네임이 중복 됩니다 고쳐주세요");
			$("#uNcik").focus();
			return false;
		}
		
		return true;
	}
</script>
	
<%@ include file="/include/footer.jsp" %>