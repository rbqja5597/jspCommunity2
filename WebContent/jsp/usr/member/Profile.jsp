<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="회원정보" />
<%@ include file="../../part/head.jspf"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<h1>${pageTitle}</h1>

<div>
	<form>
		<input type="hidden" name="loginPwReal"/>
		<br>
		<div>
			아이디 : ${loginedMember.loginId}
		</div>
		<br>
		<div>
			이름 : ${loginedMember.name}
		</div>
		<br>
		<div>
			이메일 : ${loginedMember.email}
		</div>
		<br>
		<div>
			닉네임 : ${loginedMember.nickname}
		</div>
		<br>
		<div>
			전화번호 : ${loginedMember.cellphoneNo}
		</div>
		<br>
		<div>
			아이디 생성날짜 : ${loginedMember.regDate}
		</div>
		<br>
		<div>
		<br>
			<div>
			
				<button type="button"><a href="modify">수정하기</a></button>
				<button type="button" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</form>
</div>
<%@ include file="../../part/foot.jspf"%>