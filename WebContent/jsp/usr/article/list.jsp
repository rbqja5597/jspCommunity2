<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="pageTitle" value="${board.name} 게시물 리스트" />
<%@ include file="../../part/head.jspf"%>

<section class="section_1 con-min-width">
<div class="con">
<h1>${pageTitle}</h1>

<br>
<div>
	<a href="write?boardId=${param.boardId}">게시물 작성</a>
</div>
<br>

<table class="table">
    <caption>표 제목</caption>
    <tr>
      <th>번호</th>
      <th>제목</th>
      <th>작성날짜</th>
      <th>갱신날짜</th>
      <th>작성자</th>
      <th>상세보기</th>
    </tr>
  
  <c:forEach items="${articles}" var="article">
    <tr>
      <td>${article.id}</td>
      <td>${article.title}</td>
      <td>${article.regDate}</td>
      <td>${article.updateDate}</td>
      <td>${article.extra__writer}</td>
      <td><a href="detail?id=${article.id}">상세보기</a></td>
   </tr>
  </c:forEach>
</table>  
</div>
</section>  
<%@ include file="../../part/foot.jspf"%>