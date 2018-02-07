<%@ page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="my" uri="/WEB-INF/tlds/mytagLib.tld" %>

 <%
	if (request.getMethod().equalsIgnoreCase("get")) {
		request.setAttribute("ERROR", "아이디와 비밀번호를 정상적으로 입력하셔야 합니다.");
		request.getRequestDispatcher("/index.jsp").forward(request, response);
	}
 
 	String	user	= request.getParameter("user").trim();
	String	pass	= request.getParameter("pass").trim();

	BbsDAO	dao		= new BbsDAO(application);
	boolean	flag	= dao.isMember(user, pass);
	
	out.println(flag);

	if (flag) {
		session.setAttribute("USER_ID", user);
		session.setAttribute("USER_PWD", pass);
		session.setAttribute("USER_NAME", dao.selectName(user));
		response.sendRedirect(request.getContextPath() + "/login/myInfo.jsp");
		
	} else {	// 비회원
		request.setAttribute("ERROR", "아이디와 비밀번호가 틀립니다.");
		request.getRequestDispatcher("/login/login.jsp").forward(request, response);
	}

	dao.close();
 %>
