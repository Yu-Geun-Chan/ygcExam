<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="#{board.code } FAQ LIST"></c:set>
<%@ include file="../common/head.jspf"%>


<section class="mt-2 text-xl px-4">
	<form action="/usr/faq/list" method="get">
		<input value="${searchKeyword}" name="searchKeyword" type="text" placeholder="What is your searchKeyword?"
			class="input-sm input input-bordered w-60 max-w-xs mt-3" />
		<button class="btn btn-primary btn-sm" type="submit">검색</button>
	</form>
</section>

<c:if test="${faqsCount > 0}">
	<ul>
		<c:forEach var="faq" items="${faqs}">
			<li>${faq.title}</li>
			<li>${faq.body }</li>
		</c:forEach>
	</ul>
</c:if>
<c:if test="${faqsCount == 0}">
	<p>검색 결과가 없습니다.</p>
</c:if>




<%@ include file="../common/foot.jspf"%>