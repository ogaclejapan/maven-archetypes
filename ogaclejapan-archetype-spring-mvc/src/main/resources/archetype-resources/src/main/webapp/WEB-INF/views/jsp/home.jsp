<%@page contentType="text/html;charset=UTF-8"%>
<%@page pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<html>
<head>
	<META http-equiv="Content-Type" content="text/html;charset=UTF-8" />
	<title>home</title>
</head>
<body>
<div class="container">  
	<h1>
		<spring:message code="welcome.title"/>
	</h1>
	<ul>
		<li><a href="hello">Hello</a></li>
	</ul>
</div>
</body>
</html>
