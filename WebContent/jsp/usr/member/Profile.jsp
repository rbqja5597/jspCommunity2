<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="pageTitle" value="회원정보" />
<%@ include file="../../part/head.jspf"%>

<script src="https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js"></script>


<main class="con-min-width">
    <div class="con">


<div>
	
	<form class="ProfileForm">
	<h1>${pageTitle}</h1>
		<input type="hidden" name="loginPwReal"/>
		
		<div class="teForm">
			<a class="id">아이디 : ${loginedMember.loginId}</a>
		</div>
		
		<div class="teForm">
			<a class="id">이름 : ${loginedMember.name}</a>
		</div>
		
		<div class="teForm">
			<a class="id">이메일 : ${loginedMember.email}</a>
		</div>
		
		<div class="teForm">
			<a class="id">닉네임 : ${loginedMember.nickname}</a>
		</div>
  
    	<div class="teForm">
			<a class="id">전화번호 : ${loginedMember.cellphoneNo}</a>
		</div>
		
		<div class="teForm">
			<a class="id">전화번호 : ${loginedMember.regDate}</a>
		</div>
		
		<div>
			<div>
				<button class="btn2" type="button"><a href="modify">수정하기</a></button>
				<button class="btn2" type="button" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</form>
</div>
</div>
</main>
<section></section>
<%@ include file="../../part/foot.jspf"%>