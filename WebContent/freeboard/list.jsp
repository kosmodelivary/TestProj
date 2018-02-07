<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<c:if test="${sessionScope.USER_ID eq null}"  >
	<script>
		alert('로그인 후 이용하세요.');
		location.replace("${pageContext.request.contextPath }/login/login.jsp");
	</script>
</c:if>


<html lang="ko">
  <c:import url="/include/head.jsp" />
  <%@ include file="/include/readyArticleList.jsp" %>

  <style>
  	body {
  		background-color: white;
  	}
  	
  	#notArticle {
  		font-size: 3em;
  	}
  	
	a {
		text-decoration: none;
		color: black;
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
    			<table class="table table-striped">
		            <thead>
		              <tr>
		                <th class="col-md-1">#</th>
		                <th class="col-md-8">제목</th>
		                <th class="col-md-1">작성자</th>
		                <th class="col-md-1">조회수</th>
		                <th class="col-md-1">작성일</th>
		              </tr>
		            </thead>
		            <tbody>
					  <c:forEach var="item" items="${list }" >
			              <tr>
			                <td>${item.no }</td>
			                <td><a href="view.jsp?articleid=${item.no }">${item.title }</a></td>
			                <td>${item.name }</td>
			                <td>${item.visitcount }</td>
			                <td>${item.postdate }</td>
			              </tr>
					  </c:forEach>
					  <tr>
    				  	  <td class="text-center" id="paging" colspan="6">페이지 번호 출력 위치</td>
    				  </tr>
		            </tbody>
    			</table>
    		</div>
    	</div>
    	<div class="row">
    		<div class="col-md-4 col-md-offset-8 text-right">
    			<a class="btn btn-primary" href="write.jsp" role="button">글쓰기</a>
    		</div>
    	</div>
    	<c:if test="${list eq null }">
	      <div class="row">
	    	 <div class="col-md-12 text-center" id="notArticle">
	    		글이 없습니다.
	    	 </div>
	      </div>
    	</c:if>
		
	</div>    
 
  
    <c:import url="/include/js.jsp"></c:import>
  </body>
</html>