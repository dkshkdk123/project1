<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 자바빈 클래스 import --%>
<%@ page import="jsp.member.model.MemberBean" %>
<%-- DAO import --%>
<%@ page import="jsp.member.model.MemberDAO" %>
<%  request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 자바빈 관련 액션태그 사용 --%>
	<jsp:useBean id="memberBean" class="jsp.member.model.MemberBean" />
	<jsp:setProperty property="*" name="memberBean"/>
	<%
		// 세션에서 아이디를 가져와 MemberBean에 세팅한다.
		String id= (String)session.getAttribute("sessionID");
		memberBean.setId(id);
		// 수정할 회원정보를 담고있는 MemberBean을 DAO로 전달하여 회원정보 수정을 한
		MemberDAO dao = MemberDAO.getInstance();
		dao.updateMember(memberBean);
	%>
	<br><br>
	<font size="5" color="gray">회원정보가 수정되었습니다.</font>
	
	<br><br>
	<input type="button" value="메인으로" onclick="javascript:window.location='MainLogoutForm.jsp'"/>
</body>
</html>