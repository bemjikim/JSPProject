<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.member.dao.MemberDAO, com.member.bean.MemberVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Member Board</title>
<style>
	#list {
		font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
		border-collapse: collapse;
		margin-right: auto;
		margin-left: auto;
		display:flex;
		justify-content: center;
		align-items: center;
		margin-bottom : 30px;
		height: 50vh;
		width: 90%;
	}
	#post
	{
		font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
		margin:auto;
		display:block;
		block-size : 50px;
		margin-bottom:70px;
		background-color: #006bb3;
		color:white;
		border: 1px solid #ddd;
	}
	#post:hover
	{
		background-color: #555555;
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
		background-color: #555;
		color: white;
		padding: 15px;
	}
</style>
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		if(a) location.href='deletepost.jsp?id=' + id;
	}
</script>
</head>
<body>
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
				<li class="active"><a href="list.jsp">Home</a></li>
				<li><a href="addpostform.jsp">Add</a></li>
				<li><a href="#">Contact</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a onclick = history.back()><span class="glyphicon glyphicon-log-in"></span></a></li>
			</ul>
		</div>
	</div>
</nav>
<h1 id = "h1">자유게시판</h1>
<%
	MemberDAO boardDAO = new MemberDAO();
	List<MemberVO> list = boardDAO.getMemberList();
	request.setAttribute("list",list);
%>
<table id="list">
<tr>
	<th>No</th>
	<th>Userid</th>
	<th>Username</th>
	<th>Email</th>
	<th>Regdate</th>
	<th>View</th>
	<th>Edit</th>
	<th>Delete</th>
</tr>
<c:forEach items="${list}" var="u" varStatus="status">
	<tr>
		<td>${fn:length(list)-status.index}</td>
		<td>${u.getUserid()}</td>
		<td>${u.getUsername()}</td>
		<td>${u.getEmail()}</td>
		<td>${u.getRegdate()}</td>
		<td><a href="view.jsp?id=${u.getSid()}">View</a></td>
		<td><a href="editform.jsp?id=${u.getSid()}">Edit</a></td>
		<td><a href="javascript:delete_ok('${u.getSid()}')">Delete</a></td>
	</tr>
</c:forEach>


</table>

<br/><button id = "post" onclick = "location.href='addpostform.jsp'">Add New Post</button>
<footer class="container-fluid text-center">
	<p>This is 21900104, Bum Jin Kim's Project 4</p>
</footer>
</body>
</html>