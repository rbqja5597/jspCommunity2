<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sbs.example.util.Util"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" value="댓글 수정" />
<%@ include file="../../part/head.jspf"%>


<main class="con-min-width">
    <div class="con">
<h1><i class="fas fa-edit"></i>&nbsp;${pageTitle}</h1>

<div>
	<script>
	let DoModifyReplyForm__submited = false;
	let DoModifyReplyForm__checkedLoginId = "";
	
	// 폼 발송전 체크
	function DoModifyReplyForm__submit(form) {
		if ( DoModifyReplyForm__submited ) {
			alert('처리중입니다.');
			return;
		}
		
		const editor = $(form).find('.toast-ui-editor').data('data-toast-editor');
		const body = editor.getMarkdown().trim();
		
		if ( body.length == 0 ) {
			alert('내용을 입력해주세요.');
			editor.focus();
			
			return;
		}
		
		form.body.value = body;
		
		form.submit();
		DoModifyReplyForm__submited = true;
	}
	</script>
	<form action="doModifyReply" method="POST" onsubmit="DoModifyReplyForm__submit(this); return false;">
		<input type="hidden" name="id" value="${reply.id}" />
		<input type="hidden" name="body" />

		<br>

		<div>
			<div>내용</div>
			<div>
				<script type="text/x-template">${reply.body}</script>
 				<div class="toast-ui-editor"></div>
			</div>
		</div>
		<br>
		<div>
			<div>
				<input type="submit" value="수정"/>
				<button type="button" onclick="history.back();">뒤로가기</button>
			</div>
		</div>
	</form>
	<br>
</div>
</div>
</main>
<section></section>

<%@ include file="../../part/foot.jspf"%>