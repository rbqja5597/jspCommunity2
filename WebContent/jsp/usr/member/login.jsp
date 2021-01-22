<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="로그인" />
<%@ include file="../../part/head.jspf"%>
<div>
	<script>
	let DoLoginForm__submited = false;
	function DoLoginForm__submit(form) {
		if ( DoLoginForm__submited ) {
			alert('처리중입니다.');
			return;
		}
	
		form.loginId.value = form.loginId.value.trim();
	
		if ( form.loginId.value.length == 0 ) {
			alert('로그인 아이디를 입력해주세요.');
			form.loginId.focus();
			
			return;
		}
		
		form.loginPw.value = form.loginPw.value.trim();
	
		if ( form.loginPw.value.length == 0 ) {
			alert('로그인 비밀번호를 입력해주세요.');
			form.loginPw.focus();
			
			return;
		}
		
		form.submit();
		DoLoginForm__submited = true;
	}
	</script>
	<form action="doLogin" method="POST" class="loginForm" onsubmit="DoLoginForm__submit(this); return false;">
                                                                                               
      <h2>${pageTitle}</h2>
      <div class="idForm">
        <input name="loginId" type="text" class="id" placeholder="아이디">
      </div>
      <div class="passForm">
        <input name="loginPw" type="password" class="pw" placeholder="비밀번호">
      </div>
      <input type="submit" class="btn" value="LOG IN"/>
    </form>
</div>
<%@ include file="../../part/foot.jspf"%>