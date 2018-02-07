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
    	<form action="editOk.jsp" method="post">
	    	<div class="row">
	    		<div class="col-md-12">
	    			<input type="hidden" name="articleid" value="${dto.no }">
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
	    					<td class="text-center" >제목</td>
	    					<td colspan="5">
	    						<input class="form-control" type="text" value="${dto.title }" name="title">
	    					</td>
	    				</tr>
	    				<tr>
	    					<td class="text-center" >내용</td>
	    					<td colspan="5">
	    						<textarea class="form-control" rows="15" name="content">${dto.content }</textarea>
	    					</td>
	    				</tr>
	    			</table>
	    		</div>
	    	</div>
	    	<div class="row">
	    		<div class="col-md-4 col-md-offset-8 text-right">
	    			<button type="submit" class="btn btn-primary">글 수정</button>
	    			<a class="btn btn-primary" href="list.jsp" role="button">취소</a>
	    		</div>
	    	</div>
    	</form>
	</div>    
  
    <c:import url="/include/js.jsp"></c:import>
  </body>
</html>