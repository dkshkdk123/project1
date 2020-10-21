<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jsp.member.model.MemberDAO" %>
<!DOCTYPE html>
<html>
<head>
	
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		
		request.setCharacterEncoding("UTF-8");
	
	
		String id= request.getParameter("id");
		String pw = request.getParameter("password");
		
		
		MemberDAO dao = MemberDAO.getInstance();
		int check = dao.loginCheck(id,pw);
		
		
		String msg = "";
		if(check == 1) 
		{
			
			session.setAttribute("sessionID", id);
			msg =  "MainLogoutForm.jsp";
		}
		else if(check == 0) 
		{
			msg = "LoginForm.jsp?msg=0";
		}
		else 
		{
			msg = "LoginForm.jsp?msg=-1";

		}
		response.sendRedirect(msg);
	%>
</body>
</html>