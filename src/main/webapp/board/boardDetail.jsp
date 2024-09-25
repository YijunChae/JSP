<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.ac.kopo.board.dao.BoardDAO" %>
<%@ page import="kr.ac.kopo.board.vo.BoardVO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String no = request.getParameter("no");
    BoardDAO dao = new BoardDAO();
    BoardVO board = dao.selectBoard(Integer.parseInt(no));
    request.setAttribute("board", board);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 상세 조회</title>
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
        }
        h2 {
            color: #009ACD;
            text-align: center;
            padding: 20px 0;
        }
        table {
            width: 80%;
            background-color: #FFFFFF;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th {
            background-color: #87CEFA;
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
        }
        td {
            padding: 15px;
            text-align: center;
            border: 1px solid #ddd;
        }
        #listBtn, #editBtn, #deleteBtn {
            display: block;
            width: 200px;
            height: 50px;
            margin: 10px auto;
            background-color: #009ACD;
            color: #fff;
            border-radius: 5px;
            text-align: center;
            line-height: 50px;
            font-size: 20px;
            transition: all 0.3s;
        }
        #listBtn:hover, #editBtn:hover, #deleteBtn:hover {
            background-color: #00688B;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <h2>게시글 상세 조회</h2>
    <table>
        <tr>
            <th>번호</th>
            <td>${ board.no }</td>
        </tr>
        <tr>
            <th>제목</th>
            <td>${ board.title }</td>
        </tr>
        <tr>
            <th>작성자</th>
            <td>${ board.writer }</td>
        </tr>
        <tr>
            <th>내용</th>
            <td>${ board.content }</td>
        </tr>
        <tr>
            <th>조회수</th>
            <td>${ board.viewCnt }</td>
        </tr>
        <tr>
            <th>등록일</th>
            <td>${ board.regDate }</td>
        </tr>
    </table>
    <button id="listBtn" onclick="location.href='boardList.jsp'">전체 글 목록</button>
	<button id="editBtn" onclick="location.href='updateBoard.jsp?no=${ board.no }'">수정</button>
	<button id="deleteBtn" onclick="location.href='deleteBoard.jsp?no=${ board.no }'">삭제</button>
</body>
</html>


