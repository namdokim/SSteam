<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header.jsp" %>
<script>
function check(){
	//alert("각 값이 있는지 체크하는 구문을 만들어보세요");	
	
	if ($("#uId").val() == ""){
		alert("아이디를 입력하세요");
		$("#uId").focus();
		return false;
	}else if ($("#uPw").val() == ""){
		alert("비밀번호를 입력하세요");
		$("#uPw").focus();
		return;
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

function idCheck(){
//	alert("아이디 체크창입니다.");	
	let uId = $("#uId").val();
	
	$.ajax({
		url: "<%=request.getContextPath()%>/User/UserLoginAction.do",		
		method: "POST",
		data: {"uId": uId },
		dataType: "json",
		success : function(data){	
			if (data.value =="0"){
				alert("사용가능한 아이디입니다.");
				$("#udely").val("Y");
			}else{
				alert("사용불가한 아이디 입니다");
			}	
		},
		error : function(request,status,error){
			alert("다시 시도하시기 바랍니다.");		
		}		
	});	
	
	return;
}
</script>

<form name="fam" method="post" action="<%= request.getContextPath()%>/User/userLoginAction.do" onclick="return true">
ID : <input type="text" id="uId"  name="uId" width="70%"><br>
PW : <input type="text" id="uPw"  name="uPw" width="70%">
<input type="submit" name="submit" value="확인" onclick="check()">
</form>

<%@ include file="/include/footer.jsp" %>