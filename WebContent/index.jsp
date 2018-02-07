<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
  <c:import url="/include/head.jsp" />
  <link href="${pageContext.request.contextPath }/css/cover.css" rel="stylesheet">
  
  <body style="padding: 0;background-color: #fff">
	<c:import url="/include/navbar.jsp" />

    <div class="site-wrapper">

      <div class="site-wrapper-inner">

        <div class="cover-container">

          <div class="inner cover">
            <p class="lead"><img alt="keyakizaka46_logo" src="https://pbs.twimg.com/profile_images/875580356996415488/tN4jYZEL_400x400.jpg"> </p>
            <p class="lead">
            	欅坂46 팬 페이지
            </p>
          </div>

          <div class="mastfoot">
            <div class="inner">
              <p>이 페이지는 상업적 목적을 지양하는 순수 팬 페이지를 지향합니다.</p>
            </div>
          </div>

        </div>

      </div>

    </div>    
  
    <c:import url="/include/js.jsp"></c:import>
  </body>
</html>