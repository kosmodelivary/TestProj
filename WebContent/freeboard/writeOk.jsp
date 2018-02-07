<%@page import="model.BbsDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
	request.setCharacterEncoding("utf-8");

	String	id			= session.getAttribute("USER_ID").toString();
	String	title		= request.getParameter("title");
	String	content		= request.getParameter("content");

	BbsDTO	dto			= new BbsDTO();
	dto.setId(id);
	dto.setTitle(title);
	dto.setContent(content);
	
	BbsDAO 	dao			= new BbsDAO(application);
	int		affected	= dao.insert(dto);
	dao.close();
	
	if (affected == 1) {
		response.sendRedirect("list.jsp");
	} else { %>
		<script>
			alert('글 등록이 실패되었습니다.');
			history.back();
		</script>
<%		
	}
%>
