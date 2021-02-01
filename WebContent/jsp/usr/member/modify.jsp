<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="회원정보수정" />
<%@ include file="../../part/head.jspf"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>

<main>
<h1>${pageTitle}</h1>

<div>
	<script>
	let DoModifyForm__submited = false;
	let DoModifyForm__checkedLoginId = "";
	
	
	// 폼 발송전 체크
	function DoModifyForm__submit(form) {
		if ( DoModifyForm__submited ) {
			alert('처리중입니다.');
			return;
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
		DoModifyForm__submited = true;
	}
	</script>
	<form action="doModify" method="POST" onsubmit="DoModifyForm__submit(this); return false;">
		<input type="hidden" name="loginPwReal"/>
		<div>
			아이디 : ${loginedMember.loginId}
		</div>
		<br>
		
		<div>
			비밀번호 : <input name="loginPw" type="password" maxlength="100"
				placeholder="비밀번호를 입력해주세요." />
		</div>
		<br>
		<div>
			비밀번호 확인 : <input name="loginPwConfirm" type="password" maxlength="100"
				placeholder="비밀번호 확인을 입력해주세요." />
		</div>
		<br>
		<div>
			이름 : <input name="name" type="text" maxlength="50"
			placeholder="이름을 입력해주세요." value="${loginedMember.name}"/>
		</div>
		<br>
		<div>
			이메일 : <input name="email" type="email" maxlength="100"
			placeholder="이메일을 입력해주세요." value="${loginedMember.email}"/>
		</div>
		<br>
		<div>
			닉네임 : <input name="nickname" type="text" maxlength="50"
				placeholder="닉네임을 입력해주세요." value="${loginedMember.nickname}"/>
		</div>
		<br>
		<div>
			전화번호 : <input name="cellphoneNo" type="tel"  maxlength="100"
				placeholder="전화번호를 입력해주세요." value="${loginedMember.cellphoneNo}"/>
		</div>
		<br>
		<div>
		<br>
			<div>
				<input type="submit" value="수정" />
				<button type="button" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</form>
</div>
</main>
<%@ include file="../../part/foot.jspf"%>