<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	MemberDAO dao = new MemberDAO();
	MemberVO user = dao.loginMember(id, password);
	
	if (user != null) {  
	    session.setAttribute("user", user);  // 세션에 user 객체 등록(자바의 static 효과)
	    session.setAttribute("id", id);
	    
	    Cookie idCookie = new Cookie("id", id);  // 쿠키에 아이디 저장(역시 static 효과와 유사!)
	    idCookie.setMaxAge(60 * 60 * 24);  // 쿠키는 초단위 -> 유효시간을 1일로 설정하겠음
	    response.addCookie(idCookie);  // 응답에 쿠키를 추가 -> 나중에 다시 request할 때 모두 전송하도록!!
	
	    response.sendRedirect("index.jsp");	// 로그인에 성공하면 다시 메인페이지로
	} else {  // 로그인 실패
	    response.sendRedirect("login.jsp");
	}
%>