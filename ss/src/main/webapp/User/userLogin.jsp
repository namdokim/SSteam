<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>

<form name="login" id="login" method="post" action="<%= request.getContextPath()%>/User/userLoginAction.do">
ID : <input type="text" id="uId"  name="uId" width="70%"><br>
PW : <input type="text" id="uPw"  name="uPw" width="70%"><br>
<div id="msg_login"></div>
<button value="login" onclick="check();">로그인</button>
<input type="button" value="취죠" >
<input type="text" placeholder="건들면 죽여버린다 ">
</form>
<script>

function check(){
	//alert("각 값이 있는지 체크하는 구문을 만들어보세요");	
	var uId = $("#uId").val();
	var uPw = $("#uPw").val();
	var editdata = $("#login");
	var formdata = new FormData(editdata[0])
	if ($("#uId").val() == "" ){
		alert("아이디를 입력하세요");
		
		$("#uId").focus();
		return false;
	}else if ($("#uPw").val() == ""){
		alert("비밀번호를 입력하세요");
		$("#uPw").focus();
		return false;
	}
	<%-- 
	$.ajax({
		url: "<%=request.getContextPath()%>/User/loginCheck.do",
		method: "POST",
		data: formdata,
		dataType: "json",
		success : function(data){
			console.log(data);
			if(data == 1 ){
				alert("환영합니다");
				return true;
			}else
			{
				$("#msg_login").text("비밀번호 및 아이디가 틀렸습니다");
				$("#msg_login").css("color","#dc3545");
				return false;
			}
		return false;
		}
	});
	 --%>
	$("#login").submit();
	return false;
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
<%@ include file="/include/footer.jsp" %>