<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@ page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String id = (String)session.getAttribute("id");
    if (id == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    MemberDAO dao = new MemberDAO();
    MemberVO member = dao.selectMemberById(id);
    pageContext.setAttribute("member", member);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>My Page</title>
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
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th {
            background-color: #b2d8d8;
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
        }
        td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
        }
        .center {
            text-align: center;
        }
        a {
            display: inline-block;
            color: #fff;
            background-color: #0abab5;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            margin: 10px;
            transition: all 0.3s ease;
        }
        a:hover {
            background-color: #0a5e5e; 
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>마이페이지</h1>
        <table>
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>생년월일</th>
                <th>연락처</th>
                <th>이메일</th>
                <th>사용자 구분</th>
            </tr>
            <tr>
                <td> ${ member.id} </td>
                <td> ${ member.name} </td>
                <td> ${ member.birthDate} </td>
                <td> ${ member.phone} </td>
                <td> ${ member.email} </td>
                <td> ${ member.role} </td>
            </tr>
        </table>
        <div class="center">
            <a href="member/modify.jsp">회원정보 수정</a>
            <a href="member/delete.jsp">회원탈퇴</a>
        </div>
    </div>
</body>
</html>





