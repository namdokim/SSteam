<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
	<form name="passwordfind" action="/User/passwordfind.do" method="post">
		<div>
			<p> 비밀번호 찾기 위해 전화번호를 써주세요 회원가입시 넣은 번호가 아니면은 찾을수가 없습니다 </p>
		</div>
		<div>
			<p>Email(id)</p><input type="text" id="email" name="email" placeholder="이메일로 인증번호가 갑니다 ">
		</div>
		<div>
			<p>번호</p><input type="text" id="uPhone" name="uPhone" placeholder="-없이 전화번호를 써주세요">
		</div>
	</form>
	
<%@ include file="../include/footer.jsp" %>