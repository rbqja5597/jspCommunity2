<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="로그인" />
<%@ include file="../../part/head.jspf"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>


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

		form.loginPwReal.value = sha256(form.loginPw.value);

		form.loginPw.value = "";
		
		form.submit();
		DoLoginForm__submited = true;
	}
	</script>
	<form action="doLogin" method="POST" class="loginForm" onsubmit="DoLoginForm__submit(this); return false;">
      <input type="hidden" name="loginPwReal"/>
                                                                                               
      <h2>${pageTitle}</h2>
      <div class="idForm">
        <input name="loginId" type="text" class="id" placeholder="아이디">
      </div>
      <div class="passForm">
        <input name="loginPw" type="password" class="pw" placeholder="비밀번호">
      </div>
      <input type="submit" class="btn" value="LOG IN"/>
      <ul class="loginMenu">
                    <li class="join">
                        <a href="join" title="회원가입" id="member-join">회원 가입</a>
                    </li>
                    <li class="idsearch">
                        <a href="findLoginId" id="id-search" >아이디 찾기</a>
                    </li>
                    <li class="pwsearch">
                        <a href="#" id="pw-search">비밀번호 찾기</a>
                    </li>
                </ul>
    </form>
    
</div>
<%@ include file="../../part/foot.jspf"%>