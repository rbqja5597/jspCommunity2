<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sbs.example.util.Util"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageTitle" value="${article.extra__boardName} 게시물 상세페이지" />
<%@ include file="../../part/head.jspf"%>

<script>
	$(function() {
		if ( param.focusReplyId ) {
			const $target = $('.reply-list-box tr[data-id="' + param.focusReplyId + '"]');
			$target.addClass('focus');
		
			setTimeout(function() {
				const targetOffset = $target.offset();
				
				$(window).scrollTop(targetOffset.top - 100);
				
				setTimeout(function() {
					$target.removeClass('focus');
				}, 1000);
			}, 1000);
		}
	});
</script>


<main class="con-min-width">
<div class="con">
<h1>${pageTitle}</h1>
<section>
	번호 : ${article.id}
	<br />
	작성날짜 : ${article.regDate}
	<br />
	갱신날짜 : ${article.updateDate}
	<br />
	작성자 : ${article.extra__writer}
	<br />
	제목 : ${article.title}
	<br />
	
	좋아요 : ${article.extra__likeOnlyPoint}
	<br />
	싫어요 : ${article.extra__dislikeOnlyPoint}
	<hr>
	<script type="text/x-template">${article.body}</script>
  <div class="toast-ui-viewer"></div>
</section>

<hr />

<section class="con-min-width">
	<a href="list?boardId=${article.boardId}">리스트로 이동</a>
	<br>
	<a href="modify?id=${article.id}">수정</a>
	<a onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) { return false; }"
		href="doDelete?id=${article.id}">삭제</a>

	<br>
	<br>

	<c:if test="${article.extra.actorCanLike}">
			<a class=""
			href="../like/doLike?relTypeCode=article&relId=${article.id}&redirectUrl=${encodedCurrentUrl}"
			onclick="if ( !confirm('`좋아요` 처리 하시겠습니까?') ) return false;">
				<span><i class="far fa-thumbs-up"></i></span>
				<span>좋아요</span>
			</a>
		</c:if>

		<c:if test="${article.extra.actorCanCancelLike}">
			<a class=""
			href="../like/doCancelLike?relTypeCode=article&relId=${article.id}&redirectUrl=${encodedCurrentUrl}"
			onclick="if ( !confirm('`좋아요`를 취소 처리 하시겠습니까?') ) return false;">
				<span><i class="fas fa-slash"></i></span>
				<span>좋아요 취소</span>
			</a>
		</c:if>
		

		<c:if test="${article.extra.actorCanDislike}">
			<a class="" 
			href="../like/doDislike?relTypeCode=article&relId=${article.id}&redirectUrl=${encodedCurrentUrl}"
			onclick="if ( !confirm('`싫어요` 처리 하시겠습니까?') ) return false;">
				<span><i class="far fa-thumbs-down"></i></span>
				<span>싫어요</span>
			</a>
		</c:if>

		<c:if test="${article.extra.actorCanCancelDislike}">
			<a class=""
			href="../like/doCancelDislike?relTypeCode=article&relId=${article.id}&redirectUrl=${encodedCurrentUrl}"
			onclick="if ( !confirm('`싫어요`를 취소 처리 하시겠습니까?') ) return false;">
				<span><span><i class="fas fa-slash"></i></span></span>
				<span>싫어요 취소</span>
			</a>
		</c:if>

</section>


<!-- 댓글 -->
<div class="title-bar padding-0-10 con-min-width">
	<h1 class="con">
		<span>
			<i class="fas fa-list"></i>
		</span>
		<span>댓글</span>
	</h1>
</div>

<div class="padding-0-10 con-min-width">
	<div class="con">
		<div>
			<span>댓글</span>
			<span class="color-red"> ${replies.size()}개</span>
		</div>
	</div>
</div>
<br>

<div class="padding-0-10 con-min-width">
	<div class="con">
		<table class="table-bar">
			<colgroup>
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>내용</th>
					<th>작성날짜</th>
					<th>좋아요 / 싫어요</th>
					<th>수정 / 삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${replies}" var="reply">
					<tr data-id="${reply.id}">
						<td>
							<span>${reply.id}</span>
						</td>
						<td>
							<span>${reply.extra__writer}</span>
						</td>
						<td>
							<script type="text/x-template">${reply.body}</script>
							<div class="toast-ui-viewer"></div>
						</td>
						<td>
							<span>${reply.regDate}</span>
						</td>
						
						<td>
							<span>
								<span>
									<i class="far fa-thumbs-up"></i>
								</span>
								<span> ${reply.extra__likeOnlyPoint} </span>
							</span>&nbsp;/&nbsp; 
							<span>
								<span>
									<i class="far fa-thumbs-down"></i>
								</span>
								<span> ${reply.extra__dislikeOnlyPoint} </span>
							</span>
						</td>
						
						<td>
							<div class="btn-wrap">
								<a class=""  href="../reply/doModify?id=${reply.id}&redirectUrl=${encodedCurrentUrl}">수정</a> /
								<a class=""
									onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) { return false; }"
									href="../reply/doDelete?id=${reply.id}&redirectUrl=${encodedCurrentUrl}">삭제</a>
							</div>
						</td>							

							
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>



<!-- <div class="title-bar padding-0-10 con-min-width">
	<h1 class="con">
		<span>
			<i class="fas fa-newspaper"></i>
		</span>
		<span>댓글작성</span>
	</h1>
</div> -->
<br>

<c:if test="${isLogined == false}">
	<div class="padding-0-10 con-min-width">
		<div class="con">
			<a class="udl hover-link"
				href="../member/login?afterLoginUrl=${encodedCurrentUrl}">로그인</a>
			후 이용해주세요.
		</div>
	</div>
</c:if>
<c:if test="${isLogined}">
	<div
		class="padding-0-10 con-min-width">
		<script>
	let Reply__DoWriteForm__submited = false;
	let Reply__DoWriteForm__checkedLoginId = "";
	
	// 폼 발송전 체크
	function Reply__DoWriteForm__submit(form) {
		if ( Reply__DoWriteForm__submited ) {
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
		Reply__DoWriteForm__submited = true;
	}
	</script>

		<form class="con" action="../reply/doWrite" method="POST"
			onsubmit="Reply__DoWriteForm__submit(this); return false;">
			<input type="hidden" name="redirectUrl"
				value="${Util.getNewUrl(currentUrl, 'focusReplyId', '[NEW_REPLY_ID]')}" />
			<input type="hidden" name="relTypeCode" value="article" />
			<input type="hidden" name="relId" value="${article.id}" />
			<input type="hidden" name="body" />

			<table>
				<colgroup>
				<col width="1200">
				</colgroup>
				<tbody>
					<tr>
						<td>
							<div>
								<div>
									<script type="text/x-template"></script>
									<div class="toast-ui-editor" data-height="200"></div>
								</div>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div>
								<div align="right" class="btn-wrap">
								<br>
									<input class="btn1" type="submit" value="등록" />
									<!-- <button class="" type="button"
										onclick="history.back();">뒤로가기</button> -->
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</c:if>


<br>
<br>


</div>
</main>




<%@ include file="../../part/foot.jspf"%>