<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageTitle" value="${board.name} 게시물 작성" />
<%@ include file="../../part/head.jspf"%>

<main class="con-min-width">
<div class="con">
 

<h1><i class="fas fa-edit"></i>&nbsp;${pageTitle}</h1>


<div>
	<script>
	let DoWriteForm__submited = false;
	let DoWriteForm__checkedLoginId = "";
	
	// 폼 발송전 체크
	function DoWriteForm__submit(form) {
		if ( DoWriteForm__submited ) {
			alert('처리중입니다.');
			return;
		}
	
		form.title.value = form.title.value.trim();
	
		if ( form.title.value.length == 0 ) {
			alert('제목을 입력해주세요.');
			form.title.focus();
			
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
		DoWriteForm__submited = true;
	}
	</script>
	<form action="doWrite" method="POST" onsubmit="DoWriteForm__submit(this); return false;">
		<input type="hidden" name="boardId" value="${board.id}" />
		<input type="hidden" name="body" />
		
		
		<div>
		<div>
			<div class="flex">제목</div>
				<input name="title" type="text" maxlength="50"
					placeholder="제목을 입력해주세요." />
			</div>
		</div>

		<br>

		<div>
			<div>내용</div>
			
			<div>
				<script type="text/x-template"></script>
 				<div class="toast-ui-editor"></div>
			</div>
		</div>
		<br>
		<div>
			
			<div>
				<input type="submit" value="작성" />
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