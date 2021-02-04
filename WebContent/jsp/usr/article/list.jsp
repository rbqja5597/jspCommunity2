<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageTitle" value="${board.name} 게시물 리스트" />
<%@ include file="../../part/head.jspf"%>

<main>
<section class="section_1 con-min-width">
<div class="con">
<br>
<h1>${pageTitle}</h1>

<br>
<section class="writer_search">
<div>
	<a href="write?boardId=${param.boardId}">게시물 작성</a>
</div>
<br>

<div class="search">
	<script>
	let DoSearchForm__submited = false;
	function DoSearchForm__submit(form) {
		if ( DoSearchForm__submited ) {
			alert('처리중입니다');
			return;
		}
	
		form.searchKeyword.value = form.searchKeyword.value.trim();
		
		if ( form.searchKeyword.value.length == 0 ) {
			alert('검색어를 입력해주세요.');
			form.searchKeyword.focus();
			return;
		}
		
		form.submit();
		DoSearchForm__submited = true;
	}
	</script>
	<form onsubmit="DoSearchForm__submit(this); return false;">	
		<input type="hidden" name="boardId" value="${param.boardId}"/>
		
		<select name="searchKeywordType">
			<option value="titleAndBody">제목+본문</option>
			<option value="title">제목</option>
			<option value="body">본문</option> 
		
		</select>
		<script>
		const param__searchKeywordType = '${param.searchKeywordType}';
		
		if ( param__searchKeywordType ) {
			$('select[name="searchKeywordType"]').val(param__searchKeywordType);
		}
		</script>
		
		<input value="${param.searchKeyword}"type="text" name="searchKeyword" placeholder="검색어를 입력해주세요" />
		<input type="submit" value="검색" />
	</form>
</div>
</section>

<br>

<div> 

	총 게시물 수 : ${totalCount}

</div>

<br>



<table class="table">
    <caption>표 제목</caption>
    <tr>
      <th>번호</th>
      <th>작성날짜</th>
      <th>수정날짜</th>
      <th>작성자</th>
      <th>제목</th>
      <th>내용</th>
    </tr>
  
  <c:forEach items="${articles}" var="article">
    <tr>
      <td>${article.id}</td>
      <td>${article.regDate}</td>
      <td>${article.updateDate}</td>
      <td>${article.extra__writer}</td>
      <td><a href="detail?id=${article.id}"/>${article.title}</td>
      <td><a href="detail?id=${article.id}"/>${article.body}</td>
   </tr>
  </c:forEach>
</table>  
</div>
</section>

<style>
.red {
	color:red;
}
</style>
<br>
<br>
<section class="section_page">
<div class="con bottom_page">
	<!--
	<c:set var="aUrl" value="?page=1&boardId=${param.boardId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}" />
	<a href="${aUrl}">◀◀</a>
	-->

	<c:if test="${pageBoxStartBeforeBtnNeedToShow}">
		<c:set var="aUrl" value="?page=${pageBoxStartBeforePage}&boardId=${param.boardId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}" />
		<a href="${aUrl}">◀</a>
	</c:if>
	<c:forEach var="i" begin="${pageBoxStartPage}" end="${pageBoxEndPage}" step="1">
		<c:set var="aClass" value="${page == i ? 'red' : ''}" />
		<c:set var="aUrl" value="?page=${i}&boardId=${param.boardId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}" />
		<a class="${aClass}" href="${aUrl}">${i}</a>
	</c:forEach>

	<c:if test="${pageBoxEndAfterBtnNeedToShow}">
		<c:set var="aUrl" value="?page=${pageBoxEndAfterPage}&boardId=${param.boardId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}" />
		<a href="${aUrl}">▶</a>
	</c:if>

	<!--
	<c:set var="aUrl" value="?page=${totalPage}&boardId=${param.boardId}&searchKeywordType=${param.searchKeywordType}&searchKeyword=${param.searchKeyword}" />
	<a href="${aUrl}">▶▶</a>
	-->
</div>
</section>
</main>
<%@ include file="../../part/foot.jspf"%>