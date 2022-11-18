<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.member.dao.MemberDAO, com.member.bean.MemberVO"%>
<%@ page import="com.member.common.FileUpload" %>
<%
	String sid = request.getParameter("id");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		MemberDAO memberDAO = new MemberDAO();
		String filename = memberDAO.getPhotoFilename(id);
		MemberVO u = new MemberVO();
		u.setSid(id);
		if(filename != null)
		{
			FileUpload.deleteFile(request, filename);
		}
		memberDAO.deleteMember(u);
	}

%>
<script>
	alert('데이터 삭제 완료!');
	location.href='list.jsp';
</script>