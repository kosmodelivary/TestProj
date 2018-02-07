<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<c:if test="${sessionScope.USER_ID eq null}"  >
	<script>
		alert('로그인 후 이용하세요.');
		location.replace("${pageContext.request.contextPath }/index.jsp");
	</script>
</c:if>


<html lang="ko">
  <c:import url="/include/head.jsp" />
  <%@ include file="/include/readyArticleContent.jsp" %>

  <style>
  	body {
  		background-color: white;
  	}
  	
  	#notArticle {
  		font-size: 3em;
  		text-align: center;
  	}
  	
	a {
		text-decoration: none;
		color: black;
	}
	
	.category {
		background-color: Lavender;
	}
	
	#paging {
		background-color: white;
	}
	
	
  </style>

  <body>
	<c:import url="/include/navbar.jsp" />
    
	<!-- content -->    
    <div class="container">
    
    	<div class="row">
			<h1>자유 게시판</h1>
    	</div>
    	<div class="row">
    		<div class="col-md-12">
    			<table class="table table-bordered">
    				<colgroup>
    					<col class="category">
    					<col>
    					<col class="category">
    					<col>
    					<col class="category">
    					<col>
    				</colgroup>
    				<tr>
    					<td class="col-md-2 text-center">작성자</td>
    					<td class="col-md-2 text-center">${dto.name }</td>
    					<td class="col-md-2 text-center">작성일</td>
    					<td class="col-md-2 text-center">${dto.postdate }</td>
    					<td class="col-md-2 text-center">조회수</td>
    					<td class="col-md-2 text-center">${dto.visitcount }</td>
    				</tr>
    				<tr>
    					<td class="text-center" >제목</td>
    					<td colspan="5">${dto.title }</td>
    				</tr>
    				<tr>
    					<td class="text-center" >내용</td>
    					<td colspan="5">${content }</td>
    				</tr>
    			</table>
    		</div>
    	</div>
    	<div class="row">
    		<div class="col-md-4 col-md-offset-8 text-right">
    			<form action="deleteProcess.jsp" method="post" class="form-inline" name="form">
	    			<a class="btn btn-primary" href="write.jsp" role="button">글쓰기</a>
	    			<a class="btn btn-primary ${sessionScope.USER_ID == dto.id ? '' : 'hidden' }" href="edit.jsp?articleid=${dto.no }" role="button">수정하기</a>
	    				<input type="hidden" name="articleid" value="${dto.no }">
	    				<input type="hidden" name="id" value="${dto.id }">
	    			<button type="submit" class="btn btn-primary ${sessionScope.USER_ID == dto.id ? '' : 'hidden' }" onclick="isDelete()">삭제하기</button>
	    			<a class="btn btn-primary" href="list.jsp" role="button">목록보기</a>
    			</form>
    		</div>
    	</div>
	</div>
	
	<script>
		function isDelete() {
			if (confirm('정말 삭제하시겠습니까 ?')) {
				return true;
			} else {
				return false;
			}
		}
	</script>
	
    <c:import url="/include/js.jsp"></c:import>
  </body>
</html>