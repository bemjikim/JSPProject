<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.member.dao.MemberDAO, com.member.bean.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<meta charset="UTF-8">
	<title>Edit Form</title>
	<style>

		#list {
			font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
			border-collapse: collapse;
			margin-right: auto;
			margin-left: auto;
			justify-content: center;
			align-items: center;
			height: 50vh;
			width: 70%;
			margin-bottom : 30px;

		}
		#h1{
			margin-top: 50px;
			text-align: center;
			margin-bottom : 30px;
		}
		#list td, #list th {
			border: 1px solid #ddd;
			padding: 8px;
			text-align:center;
		}
		#list tr:nth-child(even){background-color: #f2f2f2;}
		#list th {
			padding-top: 12px;
			padding-bottom: 12px;
			text-align: center;
			background-color: #006bb3;
			color: white;
		}

		.navbar {
			margin-bottom: 0;
			border-radius: 0;
		}

		footer {
			margin-top: 50px;
			background-color: #555;
			color: white;
			padding: 15px;
		}
	</style>
</head>
<body>

<%
	MemberDAO boardDAO = new MemberDAO();
	String id=request.getParameter("id");	
	MemberVO u=boardDAO.getMember(Integer.parseInt(id));
	request.setAttribute("vo",u);
%>
<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li><a href="list.jsp">Home</a></li>
				<li ><a href="addpostform.jsp">Add</a></li>
				<li class="active"><a href="#">Edit</a></li>
				<li><a href="#">Contact</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a onclick = history.back()><span class="glyphicon glyphicon-log-in"></span></a></li>
			</ul>
		</div>
	</div>
</nav>

<h1 id = "h1">회원 정보 수정</h1>
<form action="editpost.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="sid" value="${vo.getSid()}"/>
	<table id = "list">
		<tr><th>User ID:</th><td><input type="text" name="userid" value = "${vo.getUserid()}" disabled /></td></tr>
		<tr><th>Name:</th><td><input type="text" name="username" value = "${vo.getUsername()}"/></td></tr>
		<tr>
			<th>Photo:</th><td><input type="file" name="photo" value="${vo.getPhoto()}" />
			<c:if test ="${vo.getPhoto() ne ''}"><br /><img src = "${pageContext.request.contextPath}/upload/${vo.getPhoto()}" class = "photo"></c:if></td>
		</tr>
		<tr><th>Email:</th><td><input type="text" name="email" value = "${vo.getEmail()}" /></td></tr>
		<tr><th>Detail:</th><td><textarea cols="50" rows="5" name="detail">${vo.getDetail()}</textarea></td></tr>
	</table>
		<button type = "button" onclick = "history.back()" style = "margin-left : 700px">뒤로 가기</button>
		<button type = "submit" id = >회원 정보 수정</button>

</form>
<footer class="container-fluid text-center">
	<p>This is 21900104, Bum Jin Kim's Project 4</p>
</footer>
</body>
</html>