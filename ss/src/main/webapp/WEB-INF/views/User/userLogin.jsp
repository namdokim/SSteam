<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>

<form name="login" id="login" method="post" action="<%= request.getContextPath()%>/User/userLoginAction.do">
ID : <input type="text" id="uId"  name="uId" width="70%"><br>
PW : <input type="text" id="uPw"  name="uPw" width="70%"><br>
<div id="msg_login"></div>
<button type="button" id="loginbtn" onclick="check();">로그인</button>
<input type="button" value="취죠" onclick="location.href='<%= request.getContextPath()%>/reHome.do'">
<input type="text" placeholder="건들면 죽여버린다 ">
</form>
<!-- 로그인 유효성 검사  -->
<script>
/* 버튼에 타입 버튼  안주면은 무조건 submit타입으로 인식해서 서브밋이 되는건가  */
function check(){
	var uId = $("#uId").val();
	var uPw = $("#uPw").val();
	var uIdDup = false;
	var uPwDup = false;
	var submitFlag = false;
	var editdata = {uId:uId,uPw:uPw};
	if ($("#uId").val() == "" ){
		alert("아이디를 입력하세요");
		$("#uId").focus();
		submitFlag = false;
		return false;	
	}else if ($("#uPw").val() == ""){
		alert("비밀번호를 입력하세요");
		$("#uPw").focus();
		submitFlag = false;
		return false;
	}else if ( $("#uId").val() != "" )
	{
		$.ajax({
			url : "<%= request.getContextPath()%>/User/uIdCheck.do",
			type : "POST",
			data : {"uId": uId},
			dataType : "JSON",
			success :function(data){
				console.log(data);
				if(data == 0 || data >= 2){
					$("#msg_login").text("아이디 및 비밀번호가 틀렸습니다1");
					$("#msg_login").css("color","#dc3545");
					uIdDup = false;
					console.log(uIdDup);
					submitFlag = false;
				}else{
					alert("로그인 되셧습니다");
					uIdDup = true;
					console.log(uIdDup);
					submitFlag = true;
					$("form").submit();
				}
			},
			error : function(){
				alert("요청실패");
			}
		}); //ajax 끝 
	}else if( $("#uPw").val() != "" )
	{
		
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