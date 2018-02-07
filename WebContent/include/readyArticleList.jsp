<%@page import="model.BbsDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="model.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	BbsDAO 			dao		= new BbsDAO(application);
	List<BbsDTO> 	list 	= dao.mySelectList();
	dao.close();
%>

<c:set var="list" value="<%=list %>" />
