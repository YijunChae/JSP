<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Yijun's Board</title>
<style>
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-image: url('xmas.jpg');
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
    text-align: center;
    padding: 20px 0;
    animation: color-change 2s infinite;
}

@keyframes color-change {
    0%   {color: #0abab5;}
    25%  {color: #0a5e5e;}
    50%  {color: #0abab5;}
    75%  {color: #0a5e5e;}
    100% {color: #0abab5;}
}

p {
    text-align: center;
    margin: 15px 0;
}

p a {
    color: #0abab5;
    text-decoration: none;
    border: 1px solid #0abab5;
    padding: 10px 20px;
    border-radius: 5px;
    transition: all 0.3s ease;
    display: inline-block;
    margin-bottom: 10px;
}

p a:hover {
    background-color: #0abab5;
    color: #f4f4f4;
}
</style>
</head>
<body>
    <div class="container">
        <h1>Yijun's Board</h1>

        <p><a href="board/boardList.jsp">게시판</a></p>

        <c:choose>
            <c:when test="${empty sessionScope.user}">
                <p><a href="member/signup.jsp">회원가입</a></p>
                <p><a href="login.jsp">로그인</a></p>
            </c:when>
            <c:when test="${sessionScope.user.role eq 'member'}">
                <p><a href="mypage.jsp">마이페이지</a></p>
                <p><a href="logout.jsp">로그아웃</a></p>
            </c:when>
            <c:when test="${sessionScope.user.role eq 'admin'}">
                <p><a href="admin/members.jsp">전체회원조회</a></p>                
            </c:when>
            <c:otherwise>
                <p><a href="mypage.jsp">마이페이지</a></p>
                <p><a href="logout.jsp">로그아웃</a></p>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>



