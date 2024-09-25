<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@ page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    MemberDAO dao = new MemberDAO();
    List<MemberVO> members = dao.selectAllMembers();
    pageContext.setAttribute("members", members);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>전체회원조회</title>
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
    </style>
</head>
<body>
    <div class="container">
        <h1>전체회원조회</h1>
        <table>
            <tr>
                <th>아이디</th>
                <th>이름</th>
                <th>생년월일</th>
                <th>연락처</th>
                <th>이메일</th>
                <th>회원 유형</th>
            </tr>
            <c:forEach var="member" items="${ members }">
            <tr>
                <td> ${ member.id }</td>
                <td> ${ member.name }</td>
                <td> ${ member.birthDate }</td>
                <td> ${ member.phone }</td>
                <td> ${ member.email }</td>
                <td> ${ member.role }</td>
            </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
