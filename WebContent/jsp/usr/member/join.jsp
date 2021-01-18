<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="회원가입" />
<%@ include file="../../part/head.jspf"%>
<h1>회원가입</h1>

<div>
	<form action="doJoin" method="POST">
		<input type="hidden" name="id" value="${member.id}" />


		<div>
			이름 : <input name="name" type="text" maxlength="10"
			placeholder="이름" />
		</div>
		<br>
		<div>
			아이디 : <input name="loginId" type="text" maxlength="11" 
			placeholder="아이디 입력 (5~11자)" />
		</div>
		<br>
		<div>
			비밀번호 : <input name="loginPw" type="text" maxlength="20"
				placeholder="비밀번호" />
		</div>
		<br>
		<div>
			이메일 : <input name="email" type="text" maxlength="20" placeholder="이메일" />
		</div>
		<br>
		<div>
			닉네임 : <input name="nickname" type="text" maxlength="10"
				placeholder="닉네임 (3~6자)" />
		</div>
		<br>
		<div>
			<div>
				<input type="submit" value="회원가입" />
				<button type="button" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</form>
</div>
<%@ include file="../../part/foot.jspf"%>