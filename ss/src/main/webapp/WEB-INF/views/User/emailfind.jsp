<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp" %>
	<form name="emailfind" action="/User/emailfind.do" method="post">
		<div>
			<p> 이메일 아이디를  찾기 위해 전화번호를 써주세요 회원가입시 넣은 번호가 아니면은 찾을수가 없습니다 </p>
		</div>
		<div>
			<input type="text" id="uPhone" name="uPhone" placeholder="-없이 전화번호를 써주세요">
		</div>
	</form>
	<div>
	</div>
<%@ include file="../include/footer.jsp" %>