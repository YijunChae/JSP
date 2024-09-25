<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@ page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    MemberDAO dao = new MemberDAO();
    MemberVO member = dao.selectMemberById(session.getAttribute("id").toString());
    pageContext.setAttribute("member", member);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원정보 수정</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #d3d3d3;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .container {
            width: 80%;
            max-width: 800px;
            background-color: #FFF;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
            border-radius: 10px;
            padding: 20px;
        }
        h1 {
            color: #0abab5;
            text-align: center;
            padding: 20px 0;
            animation: color-change 2s infinite;
        }
        form {
            display: flex;
            flex-direction: column;
            margin-bottom: 20px;
        }
        label {
            margin: 10px 0 5px;
        }
        input[type="text"],
        input[type="password"],
        input[type="date"],
        input[type="email"] {
            padding: 10px;
            border: 1px solid #0abab5;
            border-radius: 5px;
            margin-bottom: 10px;
        }
        input[type="submit"] {
            color: #fff;
            background-color: #0abab5;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #0a5e5e;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>회원정보 수정</h1>
        <form action="modifyProcess.jsp" method="post">
            <label for="id">아이디</label>
            <input type="text" id="id" name="id" value="${ member.id }" readonly>
            <label for="password">패스워드</label>
            <input type="password" id="password" name="password" value="${ member.password }">
            <label for="name">이름</label>
            <input type="text" id="name" name="name" value="${ member.name }">
            <label for="birthDate">생년월일</label>
            <input type="date" id="birthDate" name="birthDate" value="${ member.birthDate }">
            <label for="phone">연락처</label>
            <input type="text" id="phone" name="phone" value="${ member.phone }">
            <label for="email">이메일</label>
            <input type="text" id="email" name="email" value="${ member.email }">
            <input type="submit" value="수정하기">
        </form>
    </div>
</body>
</html>


