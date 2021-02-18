<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sbs.example.util.Util"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageTitle" value="게시물 상세페이지" />
<%@ include file="../../part/head.jspf"%>

<!-- ${article.extra__boardName}  --> 

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



<div class="title-bar padding-0-10 con-min-width">
	<h1 class="con">
		<span>
			<i class="fas fa-newspaper"></i>
		</span>
		&nbsp;
		<span>${pageTitle}</span>
	</h1>
</div>

<div class="article-detail-box detail-box padding-0-10 con-min-width">
	<div class="con">
		<table>
			<colgroup>
				<col width="150">
			</colgroup>
			<tbody>
				<tr>
					<th>
						<span>번호</span>
					</th>
					<td>
						<div>${article.id}</div>
					</td>
				</tr>				
				<tr>
					<th>
						<span>작성자</span>
					</th>
					<td>
						<div>${article.extra__writer}</div>
					</td>
				</tr>
				<tr>
					<th>
						<span>제목</span>
					</th>
					<td>
						<div>${article.title}</div>
					</td>
				</tr>
				<tr>
					<th>
						<span>추천</span>
					</th>
					<td>
						<div>${article.extra__likeOnlyPoint}</div>
					</td>
				</tr>
				<tr>
					<th>
						<span>비추</span>
					</th>
					<td>
						<div>${article.extra__dislikeOnlyPoint}</div>
					</td>
				</tr>
				<tr>
				<td>
				<c:if test="${article.extra.actorCanLike}">
					<a class=""
					href="../like/doLike?relTypeCode=article&relId=${article.id}&redirectUrl=${encodedCurrentUrl}">
					<span><i class="far fa-thumbs-up"></i></span>	
					<span>추천</span>
					</a>
				</c:if>
				
				<c:if test="${article.extra.actorCanCancelLike}">
					<a class=""
					href="../like/doCancelLike?relTypeCode=article&relId=${article.id}&redirectUrl=${encodedCurrentUrl}">
					<span><i class="far fa-thumbs-up"></i></span>	
					<span>추천 x</span>
					</a>
				</c:if>
				</td>
				<td>
				<c:if test="${article.extra.actorCanDislike}">
					<a class="" 
					href="../like/doDislike?relTypeCode=article&relId=${article.id}&redirectUrl=${encodedCurrentUrl}">
					<span><i class="far fa-thumbs-down"></i></span>
					<span>비추</span>
					</a>
				</c:if>
				<c:if test="${article.extra.actorCanCancelDislike}">
					<a class=""
					href="../like/doCancelDislike?relTypeCode=article&relId=${article.id}&redirectUrl=${encodedCurrentUrl}">
					<span><i class="far fa-thumbs-down"></i></span></span>
					<span>비추 x</span>
					</a>
				</c:if>
				</td>
				</tr>
				<tr>
				<th><span>내용</span></th>
				</tr>
				<tr>
					
					<td colspan="2">
					<hr>
						<script type="text/x-template">${article.body}</script>
						<div class="toast-ui-viewer"></div>
					<hr>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

<hr />

<div class="article-btn-box padding-0-10 con-min-width">
	<div class="con btn-wrap list-modify">
		<a class="btn2 btn-info" href="list?boardId=${article.boardId}">리스트</a>
		<a class="btn2 btn-info" href="modify?id=${article.id}">수정</a>
		<a class="btn2 btn-danger" onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) { return false; }"
		href="doDelete?id=${article.id}">삭제</a>
	</div>
</div>


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
			<col width="10">
			<col width="40">
			<col width="20">
			<col width="10">
			</colgroup>
			<thead>
				<tr>
					<th>작성자</th>
					<th>내용</th>
					<th>작성날짜</th>
					<th>수정 / 삭제</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${replies}" var="reply">
					<tr data-id="${reply.id}">
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
							
							<a href="../reply/showModifyReply?id=${reply.id}&redirectUrl=${encodedCurrentUrl}">
							<i class="fas fa-pen"></i>
							</a>
							&nbsp;&nbsp;&nbsp;
							<a class=""	onclick="if ( confirm('정말 삭제하시겠습니까?') == false ) { return false; }"
									href="../reply/doDelete?id=${reply.id}&redirectUrl=${encodedCurrentUrl}">
									<i class="fas fa-trash"></i>
									</a>
							
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
								<div class="btn-wrap">
								<br>
									<input class="btn2" type="submit" value="등록" />
									<button class="btn2" type="button"	onclick="history.back();">뒤로가기</button>
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