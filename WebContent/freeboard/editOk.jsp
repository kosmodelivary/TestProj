<%@page import="model.BbsDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
	request.setCharacterEncoding("utf-8");

	String	user_id		= session.getAttribute("USER_ID").toString();
	String	title		= request.getParameter("title");
	String	content		= request.getParameter("content");
	String	articleid	= request.getParameter("articleid");
	String	id			= request.getParameter("id");
	
	if (!request.getMethod().equalsIgnoreCase("post") || 
		!user_id.equalsIgnoreCase(id)) { %>
		<script>
			alert('정상적인 수정 시도가 아닙니다.');
			history.back();
		</script>

<%
	} else {
		BbsDTO	dto			= new BbsDTO();
		dto.setId(user_id);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setNo(articleid);
		
		BbsDAO 	dao			= new BbsDAO(application);
		int		affected	= dao.update(dto);
		dao.close();
		
		if (affected == 1) {
			response.sendRedirect("view.jsp?articleid=" + dto.getNo());
		} else { %>
			<script>
				alert('글 수정이 실패되었습니다.');
				history.back();
			</script>
	<%		
		}
	}
%>
