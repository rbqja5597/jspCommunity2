<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="회원가입" />
<%@ include file="../../part/head.jspf"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

  <main class="con-min-width">
    <div class="con">	


<div>
	<script>
	let DoJoinForm__submited = false;
	let DoJoinForm__checkedLoginId = "";
	
	// 로그인 아이디 중복체크
	function DoJoinForm__checkLoginIdDup(el) {
		const form =  $(el).closest('form').get(0);
		const loginId = form.loginId.value;
		
		$.get(
				"getLoginIdDup",
				{
					loginId
				},
				function(data) {
					if ( data.msg ) {
						alert(data.msg);
					}
				
					if ( data.success ) {
						DoJoinForm__checkedLoginId = data.body.loginId;
					}
				},
				"json"
			);
		}
	
	// 폼 발송전 체크
	function DoJoinForm__submit(form) {
		if ( DoJoinForm__submited ) {
			alert('처리중입니다.');
			return;
		}

	
		form.loginId.value = form.loginId.value.trim();
	
		if ( form.loginId.value.length == 0 ) {
			alert('아이디를 입력해주세요.');
			form.loginId.focus();
			
			return;
		}

		if ( form.loginId.value != DoJoinForm__checkedLoginId ) {
			alert('아이디 중복체크를 해주세요.');
			form.btnLoginIdDupCheck.focus();
			return false;
		}
		
		form.loginPw.value = form.loginPw.value.trim();
	
		if ( form.loginPw.value.length == 0 ) {
			alert('비밀번호를 입력해주세요.');
			form.loginPw.focus();
			
			return;
		}
		
		form.loginPwConfirm.value = form.loginPwConfirm.value.trim();
	
		if ( form.loginPwConfirm.value.length == 0 ) {
			alert('비밀번호 확인을 입력해주세요.');
			form.loginPwConfirm.focus();
			
			return;
		}
		
		if ( form.loginPw.value != form.loginPwConfirm.value ) {
			alert('비밀번호가 일치하지 않습니다.');
			form.loginPwConfirm.focus();
			
			return;
		}
		
		form.name.value = form.name.value.trim();
	
		if ( form.name.value.length == 0 ) {
			alert('이름을 입력해주세요.');
			form.name.focus();
			
			return;
		}

		form.email.value = form.email.value.trim();
		
		if ( form.email.value.length == 0 ) {
			alert('이메일을 입력해주세요.');
			form.email.focus();
			
			return;
		}
				
		form.nickname.value = form.nickname.value.trim();
	
		if ( form.nickname.value.length == 0 ) {
			alert('닉네임을 입력해주세요.');
			form.nickname.focus();
			
			return;
		}
		
		
		form.cellphoneNo.value = form.cellphoneNo.value.trim();
	
		if ( form.cellphoneNo.value.length == 0 ) {
			alert('전화번호를 입력해주세요.');
			form.cellphoneNo.focus();
			
			return;
		}


		form.loginPwReal.value = sha256(form.loginPw.value);
		form.loginPw.value = "";
		form.loginPwConfirm.value = "";
		
		form.submit();
		DoJoinForm__submited = true;
	}
	</script>
	


	
	<form action="doJoin" method="POST" class="joinForm1" onsubmit="DoJoinForm__submit(this); return false;">
	<h1>${pageTitle}</h1>
		<input type="hidden" name="loginPwReal"/>
		
		<div class="textForm">
		<div class="sett flex">* 아이디</div>
			<input name="loginId" type="text" class="id1" placeholder="아이디입력 5~11자" maxlength="11">
			<button class="btn1" onclick="DoJoinForm__checkLoginIdDup(this);" name="btnLoginIdDupCheck" type="button">중복체크</button>
			</input>
		</div>		
		
		<div class="textForm2">
		<div class="sett flex">* 비밀번호</div>
        <input name="loginPw" type="password" class="pw" placeholder="비밀번호 입력 5~20자" maxlength="11">
    	</div>
		
		<div class="textForm">
		<div class="sett flex">* 비밀번호 확인</div>
        <input name="loginPwConfirm" type="password" class="pw" placeholder="비밀번호 확인 5~20자">
     	</div>
		
		<div class="textForm">
		<div class="sett flex">* 이름</div>
        <input name="name" type="text" class="name" placeholder="이름을 입력해주세요">
        </div>
		
		<div class="textForm">
		<div class="sett flex">* 이메일</div>
        <input name="email" type="text" class="email" placeholder="이메일을 입력해주세요">
     	</div>
		
		<div class="textForm">
		<div class="sett flex">* 닉네임</div>
        <input name="nickname" type="text" class="nickname" placeholder="닉네임을 입력해주세요">
        </div>
		
		<div class="textForm">
		<div class="sett flex">* 전화번호</div>
        <input name="cellphoneNo" type="number" class="cellphoneNo" placeholder="전화번호를 입력해주세요">
        </div>
		
		<input type="submit" class="btn" value="J O I N"/>
			
	</form>
</div>
</div>
</main>
<%@ include file="../../part/foot.jspf"%>