<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String name = request.getParameter("name");
	String birthDate = request.getParameter("birthDate");
	String phone = request.getParameter("phone");
	String email = request.getParameter("email");
	String role = "user";  // 역할은 고정으로 'user'를 설정
	
	request.setCharacterEncoding("UTF-8");
	
	MemberVO member = new MemberVO(id, password, name, birthDate, phone, email, role);
	MemberDAO dao = new MemberDAO();
	try {
	    dao.insertMember(member);
	    response.sendRedirect("../login.jsp");
	} catch(Exception e) {
	    e.printStackTrace();
	    response.sendRedirect("signup.jsp"); // 회원가입 실패 시 다시 회원가입 페이지로 리다이렉트
	}
%>
