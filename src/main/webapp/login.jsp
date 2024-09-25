<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>로그인</title>
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

    form {
        display: flex;
        flex-direction: column;
        margin-bottom: 20px;
    }

    label {
        margin: 10px 0 5px;
    }

    input[type="text"], input[type="password"] {
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

    p {
        text-align: center;
    }

    p a {
        color: #0abab5;
        text-decoration: none;
        transition: color 0.3s ease;
    }

    p a:hover {
        color: #0a5e5e;
    }
    </style>
</head>
<body>
    <div class="container">
        <h1>서비스 이용을 위해 로그인을 진행해주세요</h1>
        <form action="loginProcess.jsp" method="post">
            <label for="id">아이디</label>
            <input type="text" id="id" name="id" required>

            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" required>

            <input type="submit" value="로그인">
        </form>
        <p>아직 회원이 아니시라면? <a href="member/signup.jsp">회원가입</a></p>
    </div>
</body>
</html>
