<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    session.invalidate();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그아웃</title>
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
        color: #000;
        text-align: center;
        padding: 20px 0;
    }

    a {
        display: inline-block;
        color: #fff;
        background-color: #0abab5; 
        padding: 10px 20px;
        border-radius: 5px;
        text-decoration: none;
        transition: background-color 0.3s ease;
        margin-top: 20px;
    }

    a:hover {
        background-color: #0a5e5e; 
    }
    </style>
</head>
<body>
    <div class="container">
        <h1>안전하게 로그아웃 되었습니다</h1>
        <a href="index.jsp">처음화면으로 돌아가기</a>
    </div>
</body>
</html>

