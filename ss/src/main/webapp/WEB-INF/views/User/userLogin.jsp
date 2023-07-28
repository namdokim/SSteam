<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
<!-- action="<%= request.getContextPath()%>/User/userLoginAction.do" -->
<form name="login" id="login">
ID : <input type="text" id="uId"  name="uId" width="70%"><br>
PW : <input type="text" id="uPw"  name="uPw" width="70%"><br>
<div id="msg_login"></div>
<button type="button" id="loginbtn" onclick="loginFn();">로그인</button>
<input type="button" value="취죠" onclick="location.href='<%= request.getContextPath()%>/reHome.do'">
<input type="text" placeholder="힘들다 힘들어 힘들다고!!! ">
</form>
<!-- 로그인 유효성 검사  -->
<script>
/* 버튼에 타입 버튼  안주면은 무조건 submit타입으로 인식해서 서브밋이 되는건가  */
//async: false,     //값을 리턴시 해당코드를 추가하여 동기로 변경 ajax에서 return 값 얻을떄 
function loginFn(){
	var uId = $("#uId");
	var uPw = $("#uPw");
	if (uId.val() == "" ){
		alert("아이디를 입력하세요");
		$("#uId").focus();
	}else if ($("#uPw").val() == ""){
		alert("비밀번호를 입력하세요");
		$("#uPw").focus();
	}else
	{
		var frm = $("#login").serialize();
		console.log("frm="+frm);
		$.ajax({
			url : "loginFn.do",
			data : frm,
			type : "POST",
			success:function(data){
				console.log(data);
				/* 설마 없는 거라서 무조건 인식 안되니까 그 후가 안되는건가   data를 왜 안 찍어주는걸까 */
				if(data.trim() == "FAIL"){
					console.log(data);
					alert("아이디 비밀번호가 틀렸습니다");
				}else if(data.trim() == "FAIL2"){
					console.log(data);
					alert("없는 회원 정보 입니다 ");
				}else if(data.trim() == "Y"){
					alert("로그인 되셧습니다 ");
					$("#login").submit();
					location.href = "<%= request.getContextPath() %>/";
				}else
				{
					alert("null 값????");
					<%-- location.href = "<%= request.getContextPath() %>/"; --%>
				}
			},
			 error: function() {
				console.log("에러 발생");
			}
		}); //에이작스 끝 
	}
	
	<%-- 
	var fm = document.frm;
	//이 경로로 데이터를 감추어서 전송한다
	 fm.action ="<%=request.getContextPath()%>/User/userLoginAction.do"; 
	fm.method = "post";
	fm.submit();   // 전송
	return;
	 --%>
}

</script>
<script type="text/javascript">
</script>
<%@ include file="../include/footer.jsp" %>