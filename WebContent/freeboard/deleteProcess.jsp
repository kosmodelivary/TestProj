<%@page import="model.BbsDTO"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String	user_id		= session.getAttribute("USER_ID").toString();
	String	articleid	= request.getParameter("articleid");
	String	id			= request.getParameter("id");

	if (!request.getMethod().equalsIgnoreCase("post") || 
		!user_id.equalsIgnoreCase(id)) { %>
		<script>
			alert('정상적인 삭제 시도가 아닙니다.');
			history.back();
		</script>
<%		
	} else {
		BbsDAO 	dao			= new BbsDAO(application);
		int		affected	= dao.delete(articleid);
		dao.close();
		
		if (affected == 1) {
			response.sendRedirect("list.jsp");
		} else { %>
			<script>
				alert('글 삭제가 실패되었습니다.');
				history.back();
			</script>
		<%		
		}
	}
%>
