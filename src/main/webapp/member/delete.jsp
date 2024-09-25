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
    <title>회원탈퇴</title>
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
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    h1 {
        color: #0abab5;
        text-align: center;
        padding: 20px 0;
        animation: color-change 2s infinite;
    }

    p {
        text-align: center;
    }

    form {
        display: flex;
        flex-direction: column;
        margin-bottom: 20px;
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
        <h1>회원탈퇴</h1>
        <p>당신과의 이별이 아쉽습니다.</p>
        <br>
        <form action="deleteProcess.jsp" method="post">
            <input type="hidden" name="id" value="${ member.id }">
            <input type="submit" value="회원탈퇴하기">
        </form>
    </div>
</body>
</html>

