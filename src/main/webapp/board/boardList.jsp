<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="kr.ac.kopo.board.dao.BoardDAO" %>
<%@ page import="kr.ac.kopo.board.vo.BoardVO" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    BoardDAO dao = new BoardDAO();
    List<BoardVO> boardList = dao.selectAllBoards();
    request.setAttribute("boardList", boardList);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 목록</title>
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
        h2 {
            color: #009ACD;  
            text-align: center;
            padding: 20px 0;
        }
        table {
            width: 100%;
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
        #addBtn {
            display: block;
            width: 200px;
            height: 50px;
            margin: 20px auto;
            background-color: #009ACD;
            color: #fff;
            border-radius: 5px;
            text-align: center;
            line-height: 50px;
            font-size: 20px;
            transition: all 0.3s;
        }
        #addBtn:hover {
            background-color: #00688B;
            cursor: pointer;
        }
    </style>
    <script>
        window.onload = function() {
            let btn = document.getElementById("addBtn");
            btn.addEventListener('click', function() {
                location.href = 'writeBoard.jsp'
            })
        }
    </script>
</head>
<body>
    <div class="container">
        <h2>게시글 목록</h2>
        <table>
            <tr>
                <th width="10%">게시글 번호</th>
                <th>제목</th>
                <th width="13%">작성자</th>
                <th width="20%">작성일</th>
            </tr>
            <c:forEach items="${ boardList }" var="board">
                <tr>
                    <td>${ board.no }</td>
                    <td>
                        <a href="boardDetail.jsp?no=<c:out value='${ board.no }'/>">
                            <c:out value="${ board.title }" />
                        </a>
                    </td>                  
                    <td>${ board.writer }</td>
                    <td>${ board.regDate }</td>
                </tr>
            </c:forEach>
        </table>
        <button id="addBtn">새글등록</button>
    </div>
</body>
</html>





